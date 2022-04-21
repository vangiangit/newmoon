<?php
if(!function_exists('loadMainContent')){
    /**
     * 
     */
    function loadMainContent($module = ''){
        if (isset($_SESSION['have_redirect'])){
            if ($_SESSION['have_redirect'] == 1){
                echo "<div id='message_rd' >";
                $types = array(
                    0 => 'error',
                    1 => 'alert',
                    2 => 'suc');
                foreach ($types as $type){
                    if (isset($_SESSION["msg_$type"])){
                        $msg_error = $_SESSION["msg_$type"];
                        foreach ($msg_error as $item){
                            echo "<script type='text/javascript'>alert('" . $item . "'); </script>";
                        }
                        unset($_SESSION["msg_$type"]);
                    }
                }
                echo "</div>";
            }
            unset($_SESSION['have_redirect']);
        }
        $view = FSInput::get('view', $module);
        /* Phiên bản mobile */
        if(IS_MOBILE)
            $view = 'm'.$view;
        $path = PATH_BASE . 'modules' . DS . $module . DS . 'controllers' . DS . $view .".php";
        if (file_exists($path)){
            require_once $path;
            $c = ucfirst($module) . 'Controllers' . ucfirst($view);
            $controller = new $c();
            $task = FSInput::get('task');
            $task = $task ? $task : 'display';
            $controller->$task();
        }
    }
}
function randomkey($str, $keyword = 0)
{
    $return = '';
    $strreturn = explode(" ", trim($str));
    $i = 0;
    $listid = '';
    while ($i < count($strreturn))
    {
        $id = rand(0, count($strreturn));
        if (strpos($listid, '[' . $id . ']') === false)
        {
            if (isset($strreturn[$id]))
            {
                $return .= $strreturn[$id] . ' ';
                $i++;
                if ($keyword == 1 && ($i % 2) == 0 && $i < count($strreturn))
                    $return .= ',';
                $listid .= '[' . $id . ']';
            }
        }
    }
    return $return;
}
function array_language()
{
    return array(1 => "vn", 2 => "en");
}
function formatNumber($value)
{
    return number_format($value, 0, "", ".");
}
/*
*	type: msg, error, alert.
*/
function setRedirect($url, $msg = '', $type = '')
{
    if ($msg)
    {
        switch ($type)
        {
            case 'error':
                if (!isset($_SESSION['msg_error']))
                    $msg_error = array();
                else
                    $msg_error = $_SESSION['msg_error'];
                $msg_error[] = $msg;
                $_SESSION['msg_error'] = $msg_error;
                break;
            case 'alert':
                if (!isset($_SESSION['msg_alert']))
                    $msg_alert = array();
                else
                    $msg_alert = $_SESSION['msg_alert'];
                $msg_alert[] = $msg;
                $_SESSION['msg_alert'] = $msg_alert;
                break;
            case '':
            default:
                if (!isset($_SESSION['msg_suc']))
                    $msg_suc = array();
                else
                    $msg_suc = $_SESSION['msg_suc'];
                $msg_suc[] = $msg;
                $_SESSION['msg_suc'] = $msg_suc;
                break;
        }
        $_SESSION['have_redirect'] = 1;
    }
    if (headers_sent())
    {
        echo "<script>document.location.href='$url';</script>\n";
    } else
    {
        //@ob_end_clean(); // clear output buffer
        session_write_close();
        //header( 'HTTP/1.1 301 Moved Permanently' );
        header("Location: " . $url);
    }
    exit();
}
/******* CUT STRING BY LENGTH ********/
function format_money($price)
{
    if (!$price)
        $price = 0;
    return number_format($price, 0, ',', '.');
}
/******* end CUT STRING BY LENGTH ********/
function array_remove_empty($array)
{
    if (!count($array))
        return $array;
    $array_new = array();
    foreach ($array as $item)
    {
        if (trim($item) == '' || !$item)
            continue;
        $array_new[] = $item;
    }
    return $array_new;
}
function implodeWord($str, $noWord)
{
    $str = preg_replace("/ +/i", " ", $str);
    $array = explode(" ", $str);
    for ($i = 0; $i < $noWord; $i++)
    {
        if (preg_match("/[0-9A-Za-zÀ-ÖØ-öø-ÿ]/i", $array[$i]))
            $aryContent[] = $array[$i];
    }
    $strContent = implode(" ", $aryContent);
    return $strContent;
}
function getWord($noWord, $str)
{
    $noCountWord = count_words(strip_tags($str));
    if ($noCountWord >= $noWord)
    {
        $content = implodeWord(strip_tags($str), $noWord) . '...';
    } else
    {
        $content = strip_tags($str);
    }
    $k = chr(92);
    $content = str_replace($k, "", $content);
    return $content;
}
function count_words($str)
{
    $words = 0;
    $str = preg_replace("/ +/i", " ", $str);
    $array = explode(" ", $str);
    for ($i = 0; $i < count($array); $i++)
    {
        if (preg_match("/[0-9A-Za-zÀ-ÖØ-öø-ÿ]/i", $array[$i]))
            $words++;
    }
    return $words;
}
if (!function_exists('show_error'))
{
    function show_error($error)
    {
        echo $error;
    }
}
function testVar($var){
    print_r('<pre>');
    print_r($var);
    print_r('</pre>');
}
function getCurrentUrl($remove=''){
	$url = '';
	$qString = $_SERVER['REQUEST_URI'];
	if(strpos($qString, '?') ==FALSE) return $qString.'?';	
	$qString = explode('?',$qString);
	$url.=$qString[0];
	$get	= explode('&',$qString[1]);
	$pre	='';
	foreach ($get as $value){
  		$val = explode('=', $value);
  		if(!(in_array($val[0], $remove)) AND $val[1]!=''){
  			if($pre=='') { $pre = '?';
  			}else{
  				$pre ='&';
  			}
  			$url.=$pre.$val[0].'='.$val[1];
  		}
	}		
    if(strpos($url, '?') ==FALSE) {$url.='?'; }else{ $url.='&'; } 
	return $url;	
}
function convertDateTime($strDate = "", $strTime = ""){
	//Break string and create array date time
	$strDate			= str_replace("/", "-", $strDate);
	$strDateArray	= explode("-", $strDate);
	$countDateArr	= count($strDateArray);
	$strTime			= str_replace("-", ":", $strTime);
	$strTimeArray	= explode(":", $strTime);
	$countTimeArr	= count($strTimeArray);
	//Get Current date time
	$today			= getdate();
	$day				= $today["mday"];
	$mon				= $today["mon"];
	$year				= $today["year"];
	$hour				= $today["hours"];
	$min				= $today["minutes"];
	$sec				= $today["seconds"];
	//Get date array
	switch($countDateArr){
		case 2:
			$day	= intval($strDateArray[0]);
			$mon	= intval($strDateArray[1]);
			break;
		case $countDateArr >= 3:
			$day	= intval($strDateArray[0]);
			$mon	= intval($strDateArray[1]);
			$year = intval($strDateArray[2]);
			break;
	}
	//Get time array
	switch($countTimeArr){
		case 2:
			$hour	= intval($strTimeArray[0]);
			$min	= intval($strTimeArray[1]);
			break;
		case $countTimeArr >= 3:
			$hour	= intval($strTimeArray[0]);
			$min	= intval($strTimeArray[1]);
			$sec	= intval($strTimeArray[2]);
			break;
	}
	//Return date time integer
	if(@mktime($hour, $min, $sec, $mon, $day, $year) == -1) return $today[0];
	else return mktime($hour, $min, $sec, $mon, $day, $year);
}
function sendMailFS($title, $content, $nTo, $mTo, $mCc = ''){
    require_once(PATH_BASE.'libraries/PHPMailer_v5.1/class.phpmailer.php');
    $smtpHost   = 'smtp.gmail.com'; 
    $smtpPort   = '465'; 
    $smtpEmail  = 'mail.finalstyle@gmail.com'; 
    $smtpPass   = 'fs123456';
    $nFrom = "Admin: ".$_SERVER['SERVER_NAME'];
	$mail             = new PHPMailer();
	$body             = $content;
	$mail->IsSMTP(); 							
	$mail->CharSet 	= "utf-8";
	$mail->SMTPDebug  = 0;                     	
	$mail->SMTPAuth   = true;                 
	$mail->SMTPSecure = "ssl";                 
	$mail->Host       = $smtpHost;      
	$mail->Port       = $smtpPort;                   	
	$mail->Username   = $smtpEmail;  
	$mail->Password   = $smtpPass;     
    $mail->SetFrom('contact@ibds.vn','iBĐS.VN');
    $mail->AddReplyTo('contact@ibds.vn','iBĐS.VN');     	 
    if($mCc != '')
        $mail->AddBCC($mCc, $nFrom);
	$mail->Subject    = $title;
	$mail->AltBody    = "To view the message, please use an HTML compatible email viewer!"; // optional, comment out and test
	$mail->MsgHTML($body);
	$mail->AddAddress($mTo, $nTo);
	if(!$mail->Send()) {
	  return 0;
	} else {
	  return 1;
	}
}

function writeFile($filename,$contents){
	$fp = fopen ($filename, "w"); 
	if($fp)
	{
		 fwrite ($fp,$contents); 
		 fclose ($fp); 
	}
}

/**
 * Delete a file or delete all file in a directory
 *
 * @param string $str Path to file or directory
 */
function recursiveDelete($str){
    if(is_file($str)){
        return @unlink($str);
    }
    elseif(is_dir($str)){
        $scan = glob(rtrim($str,'/').'/*');
        foreach($scan as $index=>$path){
            recursiveDelete($path);
        }
    }
}

function custom_error_handler($e_number, $e_message, $e_files, $e_line, $e_var){
    $message = '<p>' . implode ( '</p><p>', (! is_array ( $e_message )) ? array ($e_message ) : $e_message ) . '</p>';
    if(!IS_LIVE)
        echo $message;
    else
        echo "<p class='warning'>Oop! Something went wrong, we are sorry for the inconvenice.</p>\n";          
}

/**
 * Ham cat chuoi
 * 
 * @param   string  $string     Chuoi ban dau
 * @param   int     $totalChar  Tong so ky tu muon lay
 * @param   string  $ext        Phan mo rong
 * 
 * @return  string
 */
function cutString($string = '', $totalChar = 0, $ext = '...'){
    if(mb_strlen($string, 'UTF-8') > $totalChar){
        $string = mb_substr($string, 0, $totalChar, 'UTF-8');
        if(mb_strrpos($string,' ',0,'UTF-8')){
            $string = mb_substr($string, 0, mb_strrpos($string,' ',0,'UTF-8'), 'UTF-8');
        }
        return $string.$ext;
    }
    return $string;
} 
  
/* Phục vụ cho phiên bản mobile */
function getCategoriesTree(){
	global $db;
	$sql = $db->query('SELECT * FROM fs_products_categories WHERE published = 1');
	$result = $db->getObjectList();
	$tree  = FSFactory::getClass('tree','tree/');
	$list = $tree -> indentRows2($result);
	return $list;
}

/**
 * Mã hóa chuối
 * @param String $str: chuỗi cần mã hóa
 * @return String 
 */ 
function fsEncode($str = ""){
	$returnStr = "";
	if(!empty($str)) {
		$enc = base64_encode($str);
		$enc = str_replace('=', '', $enc);
		$enc = str_rot13($enc);
		$returnStr = $enc;
	}
	return $returnStr;
}

/**
 * Giả mã chuỗi được mã hóa bởi hàm fsEncode()
 * @param String $str: chuỗi cần giải mã
 * @param Int $type: 0-String, 1-Int, 2-Double 
 * @return String đã giải mã
 */ 
function fsDecode($str = "", $type = 0){
    $returnStr = "";
    $str = str_replace(" ", "+", $str);
    if(!empty($str)) {
        $dec = str_rot13($str);
        $dec = base64_decode($dec);
        $returnStr = $dec;
    }
    switch($type){
        case 0:
            $returnStr = str_replace("\'","'",$returnStr);
            $returnStr = str_replace("'","''",$returnStr);
            return $returnStr;
            break;
        case 1:
            return intval($returnStr);
            break;
        case 3:
            return doubleval($returnStr);
            break;
    }
}

function array2json($arr) {
    if(function_exists('json_encode')) return json_encode($arr); //Lastest versions of PHP already has this functionality.
    $parts = array();
    $is_list = false;

    //Find out if the given array is a numerical array
    $keys = array_keys($arr);
    $max_length = count($arr)-1;
    if(($keys[0] == 0) and ($keys[$max_length] == $max_length)) {//See if the first key is 0 and last key is length - 1
        $is_list = true;
        for($i=0; $i<count($keys); $i++) { //See if each key correspondes to its position
            if($i != $keys[$i]) { //A key fails at position check.
                $is_list = false; //It is an associative array.
                break;
            }
        }
    }

    foreach($arr as $key=>$value) {
        if(is_array($value)) { //Custom handling for arrays
            if($is_list) $parts[] = array2json($value); /* :RECURSION: */
            else $parts[] = '"' . $key . '":' . array2json($value); /* :RECURSION: */
        } else {
            $str = '';
            if(!$is_list) $str = '"' . $key . '":';

            //Custom handling for multiple data types
            if(is_numeric($value)) $str .= $value; //Numbers
            elseif($value === false) $str .= 'false'; //The booleans
            elseif($value === true) $str .= 'true';
            else $str .= '"' . addslashes($value) . '"'; //All other things
            // :TODO: Is there any more datatype we should be in the lookout for? (Object?)

            $parts[] = $str;
        }
    }
    $json = implode(',',$parts);
    
    if($is_list) return '[' . $json . ']';//Return numerical JSON
    return '{' . $json . '}';//Return associative JSON
} 

function random(){
	$rand_value = "";
	$rand_value.=rand(1000,9999);
	$rand_value.=chr(rand(65,90));
	$rand_value.=rand(1000,9999);
	$rand_value.=chr(rand(97,122));
	$rand_value.=rand(1000,9999);
	$rand_value.=chr(rand(97,122));
	$rand_value.=rand(1000,9999);
	return $rand_value;
}

/**
 * String $date: 21-09-2015 
 */ 
function date2weekday($date){
    $dayArray = array("Chủ nhật", "Thứ hai", "Thứ ba", "Thứ tư", "Thứ năm", "Thứ sáu", "Thứ bảy");
    $arrDate = explode('-', $date);
    $intTimestamp = mktime(9, 0, 0, $arrDate[1], $arrDate[0], $arrDate[2]);
    $today = getdate($intTimestamp); 
    return $dayArray[$today["wday"]];
}

/**
 * @return Array
 */ 
function getDaysFromWeekNumber($wNumber = 0, $year = 0){
    $dayArray = array("Chủ nhật", "Thứ hai", "Thứ ba", "Thứ tư", "Thứ năm", "Thứ sáu", "Thứ bảy");
    
    if(!$wNumber)
        $wNumber = date('W');
    if(!$year)
        $year = date('Y'); 
        
    $arrDay = array();
    for($day = 1; $day <= 7; $day++){
        $time = strtotime($year . "W" . $wNumber . $day);
        $today = getdate($time);
        $arrDay[] = array(
            'day' => date('d-m-Y', $time), /* Định dạng VN*/
            'eday' => date('Y-m-d', $time), /* Định dạng EN */
            'wday' => $dayArray[$today["wday"]]
        );
    }
    return $arrDay;
}

function formatPrice($price = 0){
    if($price > 1000000000 || $price == 1000000000){
        $price = number_format($price/1000000000, 2, ',', '.');
        $price = str_replace(',00', '', $price);
        return $price." tỷ";
    }else if($price > 1000000 || $price == 1000000){
        $price = number_format($price/1000000, 2, ',', '.');
        $price = str_replace(',00', '', $price);
        return $price." triệu";
    }else if($price > 100000 || $price == 100000){
        $price = number_format($price/100000, 2, ',', '.');
        $price = str_replace(',00', '', $price);
        return $price." trăm";
    }else{
        return $price." VNĐ";
    }
}