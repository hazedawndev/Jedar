<?php

class loginModule {
    var $sessionKey = 'usersession_';
    var $proname = 'cms';
    var $tableName = 'admin';
    var $loginIndex = 'login_name';
    var $passwordIndex = 'password';
    var $lastlogintimeIndex = 'lastlogintime';
    var $sessionInfo = array(
        'admin_id',
        'status',
        'firstname',
        'lastname',
        'admin_group_id',
        'email'
    );
    var $passEncrypt = true;
    var $errorMessage = array(
        'missLoginName' => 'please provide username',
        'missPassword' => 'please provide password',
        'invalidPassword' => 'invaild username and password',
        'inactive' => 'inActive user',
        'invalidToomuch' => 'Maximum invalid login attempts in hour'
    );
    var $logoutTag = 0;
    function check($inname, $inpass, $incheckbox){
        $this->inputName = $inname;
        $this->inputPass = $inpass;
        $this->remember_me = $incheckbox;

        if (isset($_COOKIE['login_session']) && $_COOKIE['login_session'] && !$this->inputName && !$this->inputPass) {
            $userInfo = $this->getUserInfoBySessionKey();
        } else {
            $userInfo = $this->getUserInfo();
        }

        $flag = false;

        global $languageText, $encryptKey;
        if(strtotime($userInfo[$this->lastlogintimeIndex])+60*60 > time()){
            $userInfo['salt']=0;
        }
        if($userInfo['salt']>20){
            $this->loginHtml($this->errorMessage['invalidToomuch']);
        }
        if ($this->inputName == false && (!isset($_SESSION[$this->sessionKey . $this->sessionInfo[0]]) || $_SESSION[$this->sessionKey . $this->sessionInfo[0]] == false)) {
            $this->loginHtml($this->errorMessage['missLoginName']);
        } else if ($this->inputPass == false) {
            if ($_SESSION[$this->sessionKey . $this->sessionInfo[0]] == true) {
                $flag = true;
            } else {
                $this->loginHtml($this->errorMessage['missPassword']);
            }
        }
        if ($flag == false) {
            if ($this->inputPass != $userInfo[$this->passwordIndex] && $this->passEncrypt == false) {
                $this->loginHtml($this->errorMessage['invalidPassword']);
                $userInfo['salt']++;
                $this->mysqlHandle->update($this->tableName, array($this->loginIndex=>$this->inputName), array('salt' => $userInfo['salt'], $this->lastlogintimeIndex => date('Y-m-d H:i:s')));
            } elseif (md5($this->inputPass . $encryptKey) != $userInfo[$this->passwordIndex] && $this->passEncrypt == true) {
                $this->loginHtml($this->errorMessage['invalidPassword']);
                $userInfo['salt']++;
                $this->mysqlHandle->update($this->tableName, array($this->loginIndex=>$this->inputName), array('salt' => $userInfo['salt'], $this->lastlogintimeIndex => date('Y-m-d H:i:s')));
            }
            if ($userInfo['status'] == 0) {
                $this->loginHtml($this->errorMessage['inactive']);
            }
        }
        if ($this->logoutTag) {
            log_admin_activity('logout');
            $this->logOut();
            $this->loginHtml('');
        } else {
            $this->setSession($userInfo);
            if(isset($_SESSION['redirect_url']) && false){
                $redirect_url = $_SESSION['redirect_url'];
                $_SESSION['redirect_url'] = '';
                unset($_SESSION['redirect_url']);
                //header('location: '.$redirect_url);
                ?><script type="text/javascript">window.location='<?php echo $redirect_url; ?>';</script><?php
                exit();
            }
        }
    }

    function setSession($userInfo){   
        if ($this->inputName && (!isset($_SESSION[$this->sessionKey . $this->sessionInfo[0]]) || !$_SESSION[$this->sessionKey . $this->sessionInfo[0]])) {
            $session_id = md5(str_pad($userInfo['admin_id'], 10, "0", STR_PAD_LEFT) . session_id());
            foreach ($this->sessionInfo as $value) {
                $_SESSION[$this->sessionKey . $value] = $userInfo[$value];
            }

            if ($this->lastlogintimeIndex == true) {
                if ($this->mysqlHandle == false) die ('mysql handle not found');
                $data = array(
                    'ip' => $this->get_client_ip_server(),
                    'login_session' => $session_id,
                    $this->lastlogintimeIndex => date('Y-m-d H:i:s'),
                    'salt' => 0
                );
                $this->mysqlHandle->update($this->tableName, array($this->loginIndex=>$this->inputName), $data);
            }
            if ($this->remember_me) {
                setcookie('login_session', $session_id, time() + (86400 * 30), "/");
            }
            if (function_exists('log_admin_activity')) {
                log_admin_activity('login');
            }
            
        }
    }
    function get_client_ip_server() {
        $ipaddress = '';
        if ($_SERVER['HTTP_CLIENT_IP'])
            $ipaddress = $_SERVER['HTTP_CLIENT_IP'];
        else if($_SERVER['HTTP_X_FORWARDED_FOR'])
            $ipaddress = $_SERVER['HTTP_X_FORWARDED_FOR'];
        else if($_SERVER['HTTP_X_FORWARDED'])
            $ipaddress = $_SERVER['HTTP_X_FORWARDED'];
        else if($_SERVER['HTTP_FORWARDED_FOR'])
            $ipaddress = $_SERVER['HTTP_FORWARDED_FOR'];
        else if($_SERVER['HTTP_FORWARDED'])
            $ipaddress = $_SERVER['HTTP_FORWARDED'];
        else if($_SERVER['REMOTE_ADDR'])
            $ipaddress = $_SERVER['REMOTE_ADDR'];
        else
            $ipaddress = 'UNKNOWN';
     
        return $ipaddress;
    }

    function loginHtml($message){
        if (!isset($_POST['stage']) || !$_POST['stage']) {
            $message = '';
        }
        if(!isset($_SESSION['redirect_url']) || !$_SESSION['redirect_url']){
            $_SESSION['redirect_url'] = (isset($_SERVER['HTTPS']) ? "https" : "http")."://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
        }
        header('location: login.php?message=' . rawurldecode($message));
        exit;
    }

    function logOut(){
        foreach ($this->sessionInfo as $value) {
            $_SESSION[$this->sessionKey . $value] = '';
            session_unset($this->sessionKey . $value);
        }
        setcookie('login_session', '', time() + (86400 * 30), "/");
        header('location: index.php');
        exit;
    }

    function getUserInfoBySessionKey(){
        if ($this->mysqlHandle == false) die ('mysql handle not found');
        $result = $this->mysqlHandle->getList('admin', array('login_session'=>$_COOKIE['login_session']));
        if($result){
            $userInfo = $result[0];
            return $userInfo;
        } else {
            return null;
        }
    }

    function getUserInfo(){
        if ($this->mysqlHandle == false) die ('mysql handle not found');
        $result = $this->mysqlHandle->getList('admin', array($this->loginIndex=>$this->inputName));
        if($result){
            $userInfo = $result[0];
            return $userInfo;
        } else {
            return null;
        }
    }

    function getAdminID(){
        return $_SESSION[$this->sessionKey . 'admin_id'];
    }
    function getEmail(){
        return $_SESSION[$this->sessionKey . 'email'];
    }
    function getGroupID(){
        return $_SESSION[$this->sessionKey . 'admin_group_id'];
    }
    function setMysql($mysql){
        $this->mysqlHandle = $mysql;
    }

    function getPermission(){
        if ($this->mysqlHandle == false) die ('mysql handle not found');
        $permission = array();
        $gpInfo = $this->mysqlHandle->getData('admin_group', array('admin_group_id'=>$this->getGroupID()));
        foreach (explode(',', $gpInfo['permission']) as $ap) {
            if (!$ap) {
                continue;
            }
            $permission[$ap] = true;
        }
        return $permission;
    }
}

?>