<?php
require_once '../init.php';
$csId = isset($_GET['tk']) ? $_GET['tk'] : 0; //客服
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
        <title>网页客服咨询</title>
        <link href="css/chat.css" rel="stylesheet" type="text/css">
        <link href="dist/sweetalert.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="js/swfobject.js"></script>
        <script type="text/javascript" src="js/web_socket.js"></script>
        <script>
            var admin_id = "<?php echo isset($_GET['tk']) ? $_GET['tk'] : 0; ?>";
            var admin_img = "<?php echo $csInfo['img']; ?>";
            var admin_name = "<?php echo $csInfo['name']; ?>";
        </script>
    </head>
    <body onload="connect();">
        <div id="app" _v-6f58f7a2=""> 
            <div class="main" _v-6f58f7a2=""> 
                <header _v-7021c5b7=""  style="text-align: center;background: #d3d3d4;height: 25px;padding-top: 3px;"> 
                    <img class="avatar" width="40" height="40" _v-7021c5b7="" alt="coffce" src="img/admin.png"> 
                    <p class="name" _v-7021c5b7=""></p> 
                </header> 
                <div class="message" _v-b412eea0="" _v-6f58f7a2="">
                    <ul _v-b412eea0 class="chat_html" id="content">
                    </ul>
                    <br>
                </div>
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
<script type="text/javascript"src="js/chat_user.js"></script>
<script>
        //ctrl+Enter
        $(document).on('keydown', '#sendMsg', function (e) {
            if (e.keyCode == 13 && (e.metaKey || e.ctrlKey)) {
                onSubmit();
            }
        })
        $('.emotion').qqFace({
            id: 'facebox',
            assign: 'sendMsg',
            path: 'arclist/' //表情存放的路径
        });
        $(".sendImg").click(function () {
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
                        sendImg("<?php echo Init::$imgDomain; ?>/"+d.url);
                    } else {
                        sweetAlert(d.msg, "error");
                    }
                }
            });
        });
</script>