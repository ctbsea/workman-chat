<?php
require_once '../init.php';
$csId = isset($_GET['tk']) ? $_GET['tk'] : 0;
if (empty($csId) || !isset($_SESSION[$csId])) {
    $csInfo = Init::getAdmin($csId);
    if (empty($csInfo)) {
        header('Location：http://www.baidu.com');
        exit;
    }
    $_SESSION[$csId] = json_encode(['img' => $csInfo['admin_img'], 'name' => $csInfo['admin_name']]);
}
$csInfo = json_decode($_SESSION[$csId], true);
?>  
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>管理网页客服咨询</title>
        <link href="css/chat.css" rel="stylesheet" type="text/css">
        <link href="dist/sweetalert.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="js/swfobject.js"></script>
        <script type="text/javascript" src="js/web_socket.js"></script>
        <script type="text/javascript"src="js/chat.js"></script>
        <script>
            var admin_id = "<?php echo isset($_GET['tk']) ? $_GET['tk'] : 0; ?>";
            var admin_img = "<?php echo $csInfo['img']; ?>";
            var admin_name = "<?php echo $csInfo['name']; ?>";
        </script>
    </head>
    <body onload="connect();">
        <div id="app" _v-6f58f7a2=""> 
            <div class="sidebar" _v-6f58f7a2=""> 
                <div class="card" _v-7021c5b7="" _v-6f58f7a2="" data-id=""> 
                    <header _v-7021c5b7=""> 
                        <img class="avatar" width="40" height="40" _v-7021c5b7="" alt="coffce" src="<?php echo $csInfo['img']; ?>"> 
                        <p class="name" _v-7021c5b7=""><?php echo $csInfo['name']; ?></p> 
                    </header> 
                </div> 
                <div class="list" _v-7e56f776="" _v-6f58f7a2="">
                    <ul id="userlist"> 

                    </ul> 
                </div> 
            </div> 
            <div class="main" _v-6f58f7a2=""> 
                <div class="text" id="currentChat" data-img="" data-name="" style="text-align: center;background: #d3d3d4;height: 25px;padding-top: 3px;"> 
                    无
                </div> 
                <div class="message" _v-b412eea0="" _v-6f58f7a2=""></div> 
                <div class="text" _v-34cd3954="" _v-6f58f7a2=""> 
                    <header _v-7021c5b7=""  style="background: #d3d3d4;line-height: 1px;height: 25px;padding-top: 0.1px;"> 
                        <img src="arclist/1.gif" class="emotion" alt="表情" style="padding-left: 10px;" /> 
                        <img src="img/sendimg.png" class="sendImg" alt="发送图片" style="padding-left: 10px;" /> 
                        <input type="file" style="display: none" name="mychat" id="mychat" value="" />
                    </header> 
                    <textarea placeholder="按 Ctrl + Enter 发送" _v-34cd3954="" id="sendMsg"></textarea> 
                </div> 
            </div> 
        </div>
    </body>
</html>
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.qqFace.js"></script>
<script src="dist/sweetalert.min.js"></script>
<script src="js/chat.js"></script>
<script>
        var uid = ""; //当前聊天的人
        var adminImg = $('.card').attr('data-img');
        //ctrl+Enter
        $(document).on('keydown', '#sendMsg', function (e) {
            if (!uid)
            {
                sweetAlert('请左侧选择聊天对象', "error");
                return false;
            }
            if (e.keyCode == 13 && (e.metaKey || e.ctrlKey)) {
                onSubmit();
            }
        })
        function getrand()
        {
            return  parseInt(Math.random()) * 3 + 3;
        }
        //用户切换没有聊天界面创建 有就显示
        $(document).on('click', '.userlist', function () {
            $('.userlist').removeClass("active");
            uid = $(this).attr('id');
            $(this).addClass('active');
            createChat(uid);
            $('.chat_html').hide();
            $("#content_" + uid).show();
            $('#currentChat').text(client_list[uid]);
            //消息全读
            msg_count[uid] = 0;
            $('#msg_notice_' + uid).html('');
            console.log("当前聊天:" + uid + "(" + client_list[uid] + ")");
            totop();
        })
        $('.emotion').qqFace({
            id: 'facebox',
            assign: 'sendMsg',
            path: 'arclist/' //表情存放的路径
        });
        $(".sendImg").click(function () {
            if (!uid)
            {
                sweetAlert('请左侧选择聊天对象', "error");
                return false;
            }
            $('#mychat').click();
        })
        $('#mychat').on('change', function () {
            if (document.getElementById('mychat').files[0]['size'] > 2 * 1024 * 1024)
            {
                sweetAlert('请上传2M以内的图片', "error");
                return false;
            }
            var fd = new FormData();
            fd.append("mychat", document.getElementById('mychat').files[0]);
            $.ajax({
                url: "<?php echo Init::$imgDomain; ?>/upload.php",
                type: "POST",
                processData: false,
                contentType: false,
                data: fd,
                dataType: "json",
                success: function (d) {
                    if (d.code)
                    {
                        sendImg("<?php echo Init::$imgDomain; ?>/" + d.url);
                    } else {
                        sweetAlert(d.msg, "error");
                    }
                }
            });
        });
</script>