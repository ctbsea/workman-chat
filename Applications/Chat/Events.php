<?php

/**
 * This file is part of workerman.
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the MIT-LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @author walkor<walkor@workerman.net>
 * @copyright walkor<walkor@workerman.net>
 * @link http://www.workerman.net/
 * @license http://www.opensource.org/licenses/mit-license.php MIT License
 */
/**
 * 用于检测业务代码死循环或者长时间阻塞等问题
 * 如果发现业务卡死，可以将下面declare打开（去掉//注释），并执行php start.php reload
 * 然后观察一段时间workerman.log看是否有process_timeout异常
 */
//declare(ticks=1);

/**
 * 聊天主逻辑
 * 主要是处理 onMessage onClose 
 */
use \GatewayWorker\Lib\Gateway;

class Events {

    //客服上线会话ID
    public static $adminClientId = [];

    /**
     * 有消息时
     * @param int $client_id
     * @param mixed $message
     */
    public static function onMessage($client_id, $message) {
        // debug
        echo "client:{$_SERVER['REMOTE_ADDR']}:{$_SERVER['REMOTE_PORT']} gateway:{$_SERVER['GATEWAY_ADDR']}:{$_SERVER['GATEWAY_PORT']}  client_id:$client_id session:" . json_encode($_SESSION) . " onMessage:" . $message . "\n";

        // 客户端传递的是json数据
        $message_data = json_decode($message, true);
        if (!$message_data) {
            return;
        }

        // 根据类型执行不同的业务
        switch ($message_data['type']) {
            // 客户端回应服务端的心跳
            case 'pong':
                return;
            case 'user_login':  //用户登录
                //判断房间是否存在
                $admin_id = $message_data['admin_id'];
                $client_name = htmlspecialchars($message_data['client_name']);
                $new_message = array('code' => 100, 'type' => 'user_login', 'client_id' => $client_id, 'client_name' => htmlspecialchars($client_name), 'time' => date('Y-m-d H:i:s'));

                $_SESSION['admin_id'] = $admin_id; //客服房间ID
                $_SESSION['client_name'] = $client_name;

                $admin = Init::getAdmin($admin_id);
                if (empty($admin)) {
                    $new_message['code'] = 500;
                    Gateway::sendToCurrentClient(json_encode($new_message));
                    return;
                }
                Init::insertChat('gw_chat_log', ['type' => 1,'ip' => $_SERVER['REMOTE_ADDR'] , 'admin_id' => $admin_id, 'client_id' => $client_id,
                                'client_name' => htmlspecialchars($client_name), 'send_time' => time(), 'status' => 1]);
                //管理员是否在线
                $new_message['admin_login'] = 0;
                // 获取房间内所有用户列表  
                $clients_list = Gateway::getClientSessionsByGroup($admin_id);
                foreach ($clients_list as $tmp_client_id => $item) {
                    $clients_list[$tmp_client_id] = $item['client_name'];
                }
                $clients_list[$client_id] = $client_name;
                //加入房间
                Gateway::joinGroup($client_id, $admin_id);
                if (isset(self::$adminClientId[$admin_id]) && Gateway::isOnline(self::$adminClientId[$admin_id])) { //未上线
                    $new_message['admin_login'] = 1;
                }
                //非管理员上线通知管理员
                if ($new_message['admin_login']) {
                    unset($clients_list[self::$adminClientId[$admin_id]]); // 排除管理员自己
                    $new_message['client_list'] = $clients_list;
                    Gateway::sendToClient(self::$adminClientId[$admin_id], json_encode($new_message));
                }
                Gateway::sendToCurrentClient(json_encode($new_message));
                return;
            // 客户端登录 message格式: {type:login, name:xx, admin_id:1} ，添加到客户端，广播给所有客户端xx进入聊天室
            //管理员登录 
            case 'login':
                //判断scret和密码
                $admin_id = $message_data['admin_id'];
                $client_name = htmlspecialchars($message_data['client_name']);
                $new_message = array('code' => 100, 'type' => 'login', 'client_id' => $client_id, 'client_name' => htmlspecialchars($client_name), 'time' => date('Y-m-d H:i:s'));
                $admin = Init::getAdmin($admin_id, $message_data['admin_pass']);
                if (empty($admin)) {
                    $new_message['code'] = 500;
                    Gateway::sendToCurrentClient(json_encode($new_message));
                    return;
                }

                $_SESSION['admin_id'] = $admin_id; //客服房间ID
                $_SESSION['client_name'] = $client_name;
                Init::insertChat('gw_chat_log', ['type' => 2, 'admin_id' => $admin_id,'ip' => $_SERVER['REMOTE_ADDR'] , 'client_id' => $client_id,
                            'client_name' => htmlspecialchars($client_name), 'send_time' => time(), 'status' => 1]);
                // 获取房间内所有用户列表 
                $clients_list = Gateway::getClientSessionsByGroup($admin_id);
                foreach ($clients_list as $tmp_client_id => $item) {
                    $clients_list[$tmp_client_id] = $item['client_name'];
                }
                self::$adminClientId[$admin_id] = $client_id; //标记管理房间的ID
                Gateway::joinGroup($client_id, $admin_id);
                $new_message['admin_login'] = 1;
                // 管理员上线 转播给当前房间的所有客户端，
                Gateway::sendToGroup($admin_id, json_encode($new_message));
                //管理员返回所有用户在线用户
                $new_message['client_list'] = $clients_list;
                Gateway::sendToCurrentClient(json_encode($new_message));
                return;
            // 客户端发言 message: {type:say, to_client_id:xx, content:xx}
            case 'say':
                // 非法请求
                if (!isset($_SESSION['admin_id'])) {
                    throw new \Exception("\$_SESSION['admin_id'] not set. client_ip:{$_SERVER['REMOTE_ADDR']}");
                }

                $admin_id = $_SESSION['admin_id'];
                $client_name = $_SESSION['client_name'];

                $new_message = array('code' => 100, 'type' => 'say', 'from_client_id' => $client_id, 'from_client_name' => $client_name,
                    'content' => nl2br(htmlspecialchars($message_data['content'])), 'time' => date('Y-m-d H:i:s'));

                if (!isset(self::$adminClientId[$admin_id]) || !Gateway::isOnline(self::$adminClientId[$admin_id])) { //未上线
                    $new_message['code'] = 400;
                    return Gateway::sendToCurrentClient(json_encode($new_message));
                }
                $sendType = 2;
                // 只能和管理员聊天
                // 如果当前人不是向管理员发送 默认向管理员发送
                // 如果当前人是管理员 可以向任何人发
                if ($client_id != self::$adminClientId[$admin_id]) {
                    $sendType = 1; //收到
                    $log_client_id = $client_id;
                    $log_client_name = $client_name;
                    $message_data['to_client_id'] = self::$adminClientId[$admin_id];
                } else {
                    //发出
                    $log_client_id = $message_data['to_client_id'];
                    $log_client_name = self::getClientName($admin_id, $log_client_id);
                }
                if (isset($message_data['content_type']) && $message_data['content_type'] == "img") {
                    $new_message['content'] = "<img src='{$new_message['content']}' style='width:50%'>";
                }
                Init::insertChat('gw_chat_msg', ['admin_id' => $admin_id, 'client_id' => $log_client_id, 'client_name' => $log_client_name, 'type' => $sendType,
                    'content' => $new_message['content'], 'send_time' => time(), 'status' => 1]);

                Gateway::sendToClient($message_data['to_client_id'], json_encode($new_message));
                return;
        }
    }

    /**
     * 当客户端断开连接时
     * @param integer $client_id 客户端id
     */
    public static function onClose($client_id) {
        // debug
        echo "client:{$_SERVER['REMOTE_ADDR']}:{$_SERVER['REMOTE_PORT']} gateway:{$_SERVER['GATEWAY_ADDR']}:{$_SERVER['GATEWAY_PORT']}  client_id:$client_id onClose:''\n";

        // 从房间的客户端列表中删除
        if (isset($_SESSION['admin_id'])) {
            $admin_id = $_SESSION['admin_id'];

            //管理员在线
            if (isset(self::$adminClientId[$admin_id])) {
                $admin_client_id = self::$adminClientId[$admin_id];
                // 获取房间内所有用户列表 
                $clients_list = Gateway::getClientSessionsByGroup($admin_id);
                foreach ($clients_list as $tmp_client_id => $item) {
                    $clients_list[$tmp_client_id] = $item['client_name'];
                }
                $logType = 1;
                $client_name = $_SESSION['client_name'];
                //客服人员离线则向所有人 不是则向房间的管理员发送
                if ($admin_client_id == $client_id) {
                    $logType = 2;
                    $new_message = array('type' => 'logout', 'from_client_id' => $client_id, 'from_client_name' => $_SESSION['client_name'], 'time' => date('Y-m-d H:i:s'));
                    Gateway::sendToGroup($admin_id, json_encode($new_message));
                } else {
                    $new_message = array('type' => 'logout', 'from_client_id' => $client_id, 'from_client_name' => $_SESSION['client_name'], 'time' => date('Y-m-d H:i:s'));
                    Gateway::sendToClient($admin_client_id, json_encode($new_message));
                }
                Init::insertChat('gw_chat_log', ['type' => $logType, 'admin_id' => $admin_id, 'client_id' => $client_id
                    , 'client_name' => $client_name, 'send_time' => time(), 'status' => 2]);
            }
        }
    }

    public static function getClientName($admin_id, $client_id) {
        $clients_list = Gateway::getClientSessionsByGroup($admin_id);
        return isset($clients_list[$client_id]['client_name']) ? $clients_list[$client_id]['client_name'] : '';
    }

}
