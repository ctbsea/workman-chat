if (typeof console == "undefined") {
    this.console = {log: function (msg) { }};
}
// 如果浏览器不支持websocket，会使用这个flash自动模拟websocket协议，此过程对开发者透明
WEB_SOCKET_SWF_LOCATION = "/swf/WebSocketMain.swf";
// 开启flash的websocket debug
WEB_SOCKET_DEBUG = true;

var ws, name, client_list = {};
var current_img;
// 连接服务端
function connect() {
    // 创建websocket
    ws = new WebSocket("ws://" + document.domain + ":7272");
    // 当socket连接打开时，输入用户名
    ws.onopen = onopen;
    // 当有消息时根据消息类型显示不同信息
    ws.onmessage = onmessage;
    ws.onclose = function () {
        console.log("连接关闭，定时重连");
        connect();
    };
    ws.onerror = function () {
        console.log("出现错误");
    };
}

function onopen()
{
    if (!name)
    {
        swal({
            title: "请输入姓名!",
            type: "input",
            showCancelButton: true,
            closeOnConfirm: false,
            animation: "slide-from-top",
            inputPlaceholder: "姓名"
        },
                function (inputValue) {
                    if (inputValue === false)
                        return false;

                    if (inputValue === "") {
                        swal.showInputError("你必须输入一个姓名以便体验更好的咨询!");
                        return false;
                    }
                    name = inputValue;
                    var login_data = '{"type":"user_login","client_name":"' + name.replace(/"/g, '\\"') + '","admin_id":"' + admin_id + '"}';
                    console.log("websocket握手成功，发送登录数据:" + login_data);
                    ws.send(login_data);
                    swal.close();
                });
        // 登录
    } else {
        var login_data = '{"type":"user_login","client_name":"' + name.replace(/"/g, '\\"') + '","admin_id":"' + admin_id + '"}';
        console.log("websocket握手成功，发送登录数据:" + login_data);
        ws.send(login_data);
        swal.close();
    }
}
// 服务端发来消息时
function onmessage(e)
{
    console.log(e.data);
    var data = eval("(" + e.data + ")");
    switch (data['type']) {
        // 服务端ping客户端
        case 'ping':
            ws.send('{"type":"pong"}');
            break;
            ;
        case 'user_login':
            if (data['admin_login'] == 1) {
                tips('连线成功,有问题可以咨询', data['time']);
            } else {
                tips('<a href="" >客服' + admin_name + '有事离开一会,有问题请点击留言</a>', data['time']);
            }
            current_client_id = data['client_id'];
            current_img = '/img.php?uid=' + current_client_id;
            $('.avatar').attr('src', current_img);
            break;
            // 推送过来的管理员登录    
            // 登录 
        case 'login':
            tips('客服' + data['client_name'] + '上线了,有问题可以咨询', data['time']);
            break;
            // 发言
        case 'say':
            if (data['code'] == 400)
            {
                tips('<a href="leave.php" target="_blank" >客服' + admin_name + '有事离开一会,有问题请点击留言</a>', data['time']);
                break;
            }
            //{"type":"say","from_client_id":xxx,"to_client_id":"all/client_id","content":"xxx","time":"xxx"}
            recive(data['from_client_id'], data['content'], data['time']);
            break;
            //管理员退出
        case 'logout':
            tips('<a href="leave.php" target="_blank" >客服' + admin_name + '有事离开一会,有问题请点击留言</a>', data['time']);
            break;
    }
}

// 提交对话
function onSubmit() {
    var input = document.getElementById("sendMsg");
    say(input.value);
    console.log(input.value);
    var content = input.value.replace(/"/g, '\\"').replace(/\n/g, '\\n').replace(/\r/g, '\\r');
    console.log(content);
    ws.send('{"type":"say","to_client_id":"","to_client_name":"","content":"' + content + '"}');
    input.value = "";
}


// 发送图片
function sendImg(imgurl) {
    say('<img src="' + imgurl + '" style="width: 50%;">');
    ws.send('{"type":"say","to_client_id":"","to_client_name":"","content_type":"img" ,"content":"' + imgurl + '"}');
}

// 提醒
function tips(content) {
    var str = '';
    str += '<li _v-b412eea0=""><p class="time" _v-b412eea0=""><span _v-b412eea0="">' + content + '</span></p>';
    str += '</li>'
    $("#content").append(str);
    $('.message').scrollTop($('.message')[0].scrollHeight);
}

//收到信息
function recive(from_client_id, content, time) {
    content = content.replace(/\[em_([0-9]*)\]/g, '<img src="arclist/$1.gif" border="0" />');
    var str = '';
    str += '<li _v-b412eea0=""><p class="time" _v-b412eea0=""><span _v-b412eea0="">' + time + '</span></p><div class="main" _v-b412eea0=""> ';
    str += ' <img class="avatar" width="30" height="30" _v-b412eea0="" src="' + admin_img + '">';
    str += '<div class="text" _v-b412eea0="">' + content + '</div></div></li>'
    $("#content").append(str);
    $('.message').scrollTop($('.message')[0].scrollHeight);
}

//发给别人 
function say(content) {
    content = replace_em(content);
    var str = '';
    str += '<li _v-b412eea0=""><div class="main" _v-b412eea0=""> ';
    str += ' <img class="avatar" width="30" height="30" _v-b412eea0="" src= "' + current_img + '">';
    str += '<div class="text" _v-b412eea0="">' + content + '</div></div></li>'
    $("#content").append(str);
    $('.message').scrollTop($('.message')[0].scrollHeight);
}

function replace_em(str) {
    str = str.replace(/\n/g, '<br/>');
    str = str.replace(/\[em_([0-9]*)\]/g, '<img src="arclist/$1.gif" border="0" />');
    return str;
}