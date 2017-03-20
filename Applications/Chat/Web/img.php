<?php

/*
 *  随机生成图片
 */
$uid = $_GET['uid'];
$file = new \phootwork\file\File('./cache/img.json');
$imgList = json_decode($file->read(), true);
if (!empty($imgList) && isset($imgList[$uid])) {
    $str = $imgList[$uid];
} else {
    //随机图片
    $num = rand(1, 3);
    //记录信息
    $str = './img/' . $num . '.jpg';
    $imgList[$uid] = $str;
    $file->write(json_encode($imgList));
}
$fileres = file_get_contents($str);
header("Content-Type: image/jpeg");
echo $fileres;
?>
