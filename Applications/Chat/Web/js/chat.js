if (typeof console == "undefined") {
    this.console = {log: function (msg) { }};
}
// 如果浏览器不支持websocket，会使用这个flash自动模拟websocket协议，此过程对开发者透明
WEB_SOCKET_SWF_LOCATION = "/swf/WebSocketMain.swf";
// 开启flash的websocket debug
WEB_SOCKET_DEBUG = true;
var ws, name, client_list = {};
var admin_pass;
var msg_count = {};
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
            title: "请输入密码!",
            type: "input",
            showCancelButton: true,
            closeOnConfirm: false,
            animation: "slide-from-top",
            inputPlaceholder: "密码"
        },
                function (inputValue) {
                    if (inputValue === false)
                        return false;

                    if (inputValue === "") {
                        swal.showInputError("请输入密码!");
                        return false;
                    }
                    admin_pass = inputValue;
                    var login_data = '{"type":"login","client_name":"' + admin_name + '","admin_id":"' + admin_id + '","admin_pass":"' + admin_pass + '"}';
                    console.log("websocket握手成功，发送登录数据:" + login_data);
                    ws.send(login_data);
                    swal.close();
                });
        // 登录
    } else {
        var login_data = '{"type":"login","client_name":"' + admin_name + '","admin_id":"' + admin_id + '","admin_pass":"' + admin_pass + '"}';
        console.log("websocket握手成功，发送登录数据:" + login_data);
        ws.send(login_data);
        swal.close();
    }
    clearChat();
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
            // 登录 更新用户列表
        case 'user_login':
        case 'login':
            if (data['code'] == 500)
            {
                alert('当前客服不存在或者客服密码错误');
                window.location.reload();
            } else {
                if (data['client_list'])
                {
                    client_list = data['client_list'];
                } else
                {
                    client_list[data['client_id']] = data['client_name'];
                }
                flush_client_list();
                console.log(data['client_name'] + "登录成功");
            }
            break;
            // 发言
        case 'say':
            recive(data['from_client_id'], data['content'], data['time']);
            break;
            // 用户退出 更新用户列表
        case 'logout':
            delete client_list[data['from_client_id']];
            $("#content_" + data['from_client_id']).remove();
            if (uid == data['from_client_id']) //当前用户
            {
                clearChat();
            }
            flush_client_list();
    }
}

// 提交对话
function onSubmit() {
    var input = document.getElementById("sendMsg");
    var to_client_id = uid;
    var to_client_name = client_list[uid];
    say(to_client_id, input.value);
    var content = input.value.replace(/"/g, '\\"').replace(/\n/g, '\\n').replace(/\r/g, '\\r');
    console.log('发给:' + to_client_id + '(' + to_client_name + ')');
    ws.send('{"type":"say","to_client_id":"' + to_client_id + '","to_client_name":"' + to_client_name + '","content":"' + content + '"}');
    input.value = "";
}
// 发送图片
function sendImg(imgurl) {
    var to_client_id = uid;
    var to_client_name = client_list[uid];
    say(to_client_id, '<img src="' + imgurl + '" style="width: 50%;">');
    ws.send('{"type":"say","to_client_id":"' + to_client_id + '","to_client_name":"' + to_client_name + '","content_type":"img" ,"content":"' + imgurl + '"}');
}

// 刷新用户列表框
function flush_client_list() {
    var userlist_window = $("#userlist");
    userlist_window.empty();
    for (var p in client_list) {
        var img = '/img.php?uid=' + p;
        var str = '<li _v-7e56f776 class="userlist" id="' + p + '">\n\
                    <img class="avatar" width="30" height="30" _v-7e56f776="" src="' + img + '">\n\
                    <p class="name" _v-7e56f776="">' + client_list[p] + '</p><b style="color:red;float:right" id="msg_notice_' + p + '"></b></li>';
        userlist_window.append(str);
    }
}

//收到信息
function recive(from_client_id, content, time) {
    createChat(from_client_id);
    if (uid != from_client_id)
    {
        if (!msg_count[from_client_id]) {
            msg_count[from_client_id] = 0;
        }
        msg_count[from_client_id]++;
        $('#msg_notice_' + from_client_id).html(msg_count[from_client_id]);
    }
    if (!uid)
    {
        $('#' + from_client_id).click();
    }
    content = content.replace(/\[em_([0-9]*)\]/g, '<img src="arclist/$1.gif" border="0" />');
    var str = '';
    str += '<li _v-b412eea0=""><p class="time" _v-b412eea0=""><span _v-b412eea0="">' + time + '</span></p><div class="main" _v-b412eea0=""> ';
    str += ' <img class="avatar" width="30" height="30" _v-b412eea0="" src="/img.php?uid=' + from_client_id + '">';
    str += '<div class="text" _v-b412eea0="">' + content + '</div></div></li>'
    $("#content_" + from_client_id).append(str);
    totop();
}

//发给别人 
function say(to_client_id, content) {
    content = replace_em(content);
    createChat(to_client_id);
    var str = '';
    str += '<li _v-b412eea0="" ><div class="main" _v-b412eea0=""> ';
    str += ' <img class="avatar" width="30" height="30" _v-b412eea0="" src="/img/admin.png">';
    str += '<div class="text" _v-b412eea0="">' + content + '</div></div></li>'
    $("#content_" + to_client_id).append(str);
    totop();

}
//创建聊天
function createChat(id) {
    if (!$("#content_" + id).length)
    {
        $(".message").append('<ul _v-b412eea0 class="chat_html" id="content_' + id + '"></ul>');
    }
}
//最下
function totop() {
    $('.message').scrollTop($('.message')[0].scrollHeight);
}
//重置界面
function clearChat() {
    uid = 0;
    $('#currentChat').html('');
    $('.chat_html').remove();
}
function replace_em(str) {
    str = str.replace(/\n/g, '<br/>');
    str = str.replace(/\[em_([0-9]*)\]/g, '<img src="arclist/$1.gif" border="0" />');
    return str;
}