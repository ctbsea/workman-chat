<?php

/*
 * 处理管理信息 提供数据落地
 */

class Init {
    public static $imgDomain = "http://img.com" ;
    /*
     * 链接数据库
     */

    public static function pdo() {
        $dsn = 'mysql:host=127.0.0.1;dbname=chat;charset=utf8';
        $usr = 'root';
        $pwd = '123456';
        return new \Slim\PDO\Database($dsn, $usr, $pwd);
    }

    /**
     * 获取管理员信息
     * @param int $client_id
     * @param mixed $message
     */
    public static function getAdmin($secret ,$admin_pass="") {
        $pdo = self::pdo();
        $selectStatement = $pdo->select()
                ->from('gw_chat_user')
                ->where('admin_secret', '=', $secret);
        if(!empty($admin_pass))
        {
            $selectStatement = $selectStatement->where('admin_pass', '=', $admin_pass);
        }
        $stmt = $selectStatement->execute();
        return $stmt->fetch();
    }

    /**
     * 判断是不是管理员
     * @param int $admin_id
     * @param mixed $name
     */
    public static function isAdmin($admin_id, $name) {
        $pdo = self::pdo();
        $selectStatement = $pdo->select()
                ->from('gw_chat_user')
                ->where('admin_secret', '=', $admin_id)
                ->where('admin_name', '=', $name);
        $stmt = $selectStatement->execute();
        return $stmt->fetch();
    }

    /**
     * 插入记录
     * @param int $client_id
     * @param mixed $message
     */
    public static function insertChat($table ,$params) {
        if (empty($params)) {
            return false;
        }
        $k = [];
        $v = [];
        foreach ($params as $p => $a) {
            $k[] = $p;
            $v[] = $a;
        }
        $pdo = self::pdo();
        $insertStatement = $pdo->insert($k)
                ->into($table)
                ->values($v);

        return $insertStatement->execute(false);
    }


}
