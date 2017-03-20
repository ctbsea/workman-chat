<?php

header('Access-Control-Allow-Origin:*');
require_once 'Upload.lib.php';

$upload = new Upload();
$upload->allowtype = ['jpg', 'png', "jpg", "jpeg", "bmp"];
$path = 'upload/' . date('Ymd');

if ($upload->uploadFile('mychat', $path)) {
    echo json_encode(['code' => 1, 'url' => $path . '/' . $upload->getNewFileName()]);
    exit;
}
echo json_encode(['code' => 0, 'msg' => $upload->getErrorMsg()]);
