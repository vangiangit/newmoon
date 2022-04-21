<?php
/**
 * @author vangiangfly
 * @copyright 2014
 */
class FSUser{
    /**
     * Thời gian lưu cookie
     * Int
     */ 
    var $remTime = 2592000;//1 tháng
    
    /**
     * Tên được lưu cookie
     * String
     */ 
    var $remCookieName = 'fsSavePass';
    
    /**
    * Domain
    * String
    */
    var $remCookieDomain = '';

    /**
     * Tên được lưu session
     * String
     */ 
    var $sessionVariable = 'userSessionValue';
    
    /**
     * Kiểu mã hóa pas
     */ 
    var $passMethod = 'sha1';
    
    /**
     * ID của user
     * Int
     */ 
    var $userID;
    
    /**
     * Toàn bộ thông tin người dùng
     * Object
     */ 
    var $userInfo;
    
    /**
     * Bảng User
     * String
     */
    var $tbStore = 'fs_members';
     
    /**
     * Hiển thị thông báo lỗi
     * Boolean
     */ 
    var $displayErrors = true;
    
    /**
     * Loại thành viên
     * String
     */ 
    var $userType = 'member';
    
    /**
     * Các tác vụ của thành viên
     * String
     */ 
    var $userTask = array();
    
    function __construct(){
        $this->remCookieDomain = $this->remCookieDomain == '' ? $_SERVER['HTTP_HOST'] : $this->remCookieDomain;
        
        if( !isset( $_SESSION ) ) session_start();
        
        if ( !empty($_SESSION[$this->sessionVariable])){
    	    $this->loadUser( $_SESSION[$this->sessionVariable] );
        }
        
        //Maybe there is a cookie?
        if ( isset($_COOKIE[$this->remCookieName]) && !$this->is_loaded()){
          $u = unserialize(base64_decode($_COOKIE[$this->remCookieName]));
          $this->login($u['uname'], $u['password']);
        }
    }
    
    /**
    * Đăng nhập
    * @param string $uname
    * @param string $password
    * @param bool $loadUser
    * @return bool
    */
    function login($uname, $password, $remember = false, $loadUser = true){
        global $db;
    	$uname    = $this->escape($uname);
    	$password = $originalPassword = $this->escape($password);
    	switch(strtolower($this->passMethod)){
    	  case 'sha1':
    	  	$password = "SHA1('$password')"; break;
    	  case 'md5' :
    	  	$password = "MD5('$password')";break;
    	  case 'nothing':
    	  	$password = "'$password'";
    	}
    	$db->query("SELECT * FROM `".$this->tbStore."` 
    	WHERE `email` = '$uname' AND `password` = $password LIMIT 1");
        $user = $db->getObject(); 
    	if ( !$user )
    		return false;
    	if ( $loadUser )
    	{
    		$this->userInfo = $user;
    		$this->userID = $user->id;
    		$_SESSION[$this->sessionVariable] = $this->userID;
    		if ( $remember ){
    		  $cookie = base64_encode(serialize(array('uname'=>$uname,'password'=>$originalPassword)));
    		  $a = setcookie($this->remCookieName, 
    		  $cookie,time()+$this->remTime, '/', $this->remCookieDomain);
    		}
    	}
    	return true;
    }
    
    /**
    * Thoát
    * param string $redirectTo
    * @return bool
    */
    function logout($redirectTo = ''){
        setcookie($this->remCookieName, '', time()-3600);
        $_SESSION[$this->sessionVariable] = '';
        $this->userData = '';
        if ( $redirectTo != '' && !headers_sent()){
            header('Location: '.$redirectTo );
            exit;//To ensure security
        }
    }
    
    /**
    * Thêm tài khoản: 'database field' => 'value'
    * @param array $data
    * @return int
    */ 
    function insertUser($data){
        global $db;
        if (!is_array($data)) $this->error('Data is not an array', __LINE__);
        switch(strtolower($this->passMethod)){
            case 'sha1':
                $password = "SHA1('".$data['password']."')"; break;
            case 'md5' :
                $password = "MD5('".$data['password']."')";break;
            case 'nothing':
                $password = $data[$this->tbFields['pass']];
    	}
        foreach ($data as $k => $v ) $data[$k] = "'".$this->escape($v)."'";
        $data['password'] = $password;
        $db->query("INSERT INTO `".$this->tbStore."` (`".implode('`, `', array_keys($data))."`) VALUES (".implode(", ", $data).")");
        $id = $db->insert ();
        return $id;
    }
    
    /**
    * Thêm tài khoản: 'database field' => 'value'
    * @param array $data
    * @return int
    */ 
    function updateUser($data, $user_id = 0){
        global $db;
        if (!is_array($data)) $this->error('Data is not an array', __LINE__);
        if(array_key_exists('password', $data)){
            switch(strtolower($this->passMethod)){
                case 'sha1':
                    $password = "SHA1('".$data['password']."')"; break;
                case 'md5' :
                    $password = "MD5('".$data['password']."')";break;
                case 'nothing':
                    $password = $data[$this->tbFields['pass']];break;
        	}
        }
        $strUpdate = "published = '1'";
        foreach ($data as $k => $v ){
            if($k != 'password')
                $strUpdate .= ",".$k."='".$this->escape($v)."'";
            else
                $strUpdate .= ",".$k."=".$password;
        }
        if($this->userID)
            $user_id = $this->userID;
        $db->query("UPDATE `".$this->tbStore.'` SET '.$strUpdate.' WHERE id = \''.$user_id.'\'');
        $id = $db->affected_rows();
        return $id;
    }
    
    /**
    * Lấy thông tin của user đã đăng nhập
    * @access private
    * @param string $userID
    * @return bool
    */
    private function loadUser($userID){
        global $db;
        $res = $db->query("SELECT * FROM `".$this->tbStore."` WHERE `id` = '".$this->escape($userID)."' LIMIT 1");
        $user = $db->getObject();
        if ( !$user )
            return false;
        $this->userInfo = $user;
        $this->userID = $user->id;
        $_SESSION[$this->sessionVariable] = $this->userID;
        return true;
    }
    
    /**
    * Kiểm tra đã đăng nhập chưa?
    * @ return bool
    */
    function is_loaded(){
        return empty($this->userID) ? false : true;
    }
    
    /**
  	* Produces the result of addslashes() with more safety
  	* @access private
  	* @param string $str
  	* @return string
    */  
    function escape($str) {
        $str = get_magic_quotes_gpc()?stripslashes($str):$str;
        /* $str = mysql_real_escape_string($str); */
        return $str;
    }

    /**
  	* Error holder for the class
  	* @access private
  	* @param string $error
  	* @param int $line
  	* @param bool $die
  	* @return bool
    */  
    function error($error, $line = '', $die = false) {
        if ( $this->displayErrors )
        	echo '<b>Error: </b>'.$error.'<br /><b>Line: </b>'.($line==''?'Unknown':$line).'<br />';
        if ($die) exit;
        return false;
    }
    
    /**
    * Kiểm tra đã có Email hay chưa?
    * @ return bool
    */
    function checkExitsEmail($email){
        global $db;
    	$db->query("SELECT * FROM `".$this->tbStore."` 
    	WHERE `email` = '$email'");
        $user = $db->getObject();
    	if($user)
            return true;
   		return false;
    }
    
    /**
    * Kiểm tra đã có Username hay chưa?
    * @ return bool
    */
    function checkExitsUsername($username){
        global $db;
    	$db->query("SELECT * FROM `".$this->tbStore."` 
    	WHERE `username` = '$username'");
        $user = $db->getObject();
    	if($user)
            return true;
   		return false;
    }
    
    /**
    * Kiểm tra mật khẩu hiện tại
    * @ return bool
    */
    function checkCurrentPassword($password){
        global $db;
        switch(strtolower($this->passMethod)){
    	  case 'sha1':
    	  	$password = "SHA1('$password')"; break;
    	  case 'md5' :
    	  	$password = "MD5('$password')";break;
    	  case 'nothing':
    	  	$password = "'$password'";
    	}
    	$db->query("SELECT * FROM `".$this->tbStore."` 
    	WHERE id = ".intval($this->userID)." AND `password` = $password");
        $user = $db->getObject();
    	if($user)
            return true;
   		return false;
    }
    
    /**
    * Đăng nhập chỉ dùng email
    * @param string $uname
    * @param string $password
    * @param bool $loadUser
    * @return bool
    */
    function loginMailOnly($uname, $remember = false, $loadUser = true){
        global $db;
    	$uname    = $this->escape($uname);
    	$db->query("SELECT * FROM `".$this->tbStore."` 
    	WHERE `email` = '$uname' LIMIT 1");
        $user = $db->getObject();
    	if ( !$user )
    		return false;
    	if ( $loadUser )
    	{
    		$this->userInfo = $user;
    		$this->userID = $user->id;
    		$_SESSION[$this->sessionVariable] = $this->userID;
    		if ( $remember ){
    		  $cookie = base64_encode(serialize(array('uname'=>$uname,'password'=>$originalPassword)));
    		  $a = setcookie($this->remCookieName, 
    		  $cookie,time()+$this->remTime, '/', $this->remCookieDomain);
    		}
    	}
    	return true;
    }
    
    function getLastName(){
        $pos = strrpos($this->userInfo->fullname, ' ');
        if ($pos === false) { // note: three equal signs
            return $this->userInfo->fullname;
        }
        return substr($this->userInfo->fullname, $pos + 1, strlen($this->userInfo->fullname) -$pos);
    }
    
    function forgot($username = '', $email = ''){
        global $db;
    	$db->query("SELECT * FROM `".$this->tbStore."` 
    	WHERE `username` = '$username' OR `email` = '$email'
        LIMIT 1");
        $user = $db->getObject();
   		return $user;
    }
    
    function check_forgot($id = 0, $activated_code = ''){
        global $db;
    	$db->query("SELECT * FROM `".$this->tbStore."` 
    	WHERE `id` = '$id' OR `activated_code` = '$activated_code'
        LIMIT 1");
        $user = $db->getObject();
   		return $user;
    }
   
}