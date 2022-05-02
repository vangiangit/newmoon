<?php
define('URL_ROOT', "http://" . $_SERVER['HTTP_HOST'] . "/");
if (!defined('DS')){
    define('DS', '/');
}
define('URL_ROOT_REDUCE', '/');
define('IS_REWRITE', 1);
define('MULTI_LANGUAGE', 0);
define('USE_CACHE', 0);
define('USE_BENMARCH', 0);
define('SQL_PUBLISH', ' AND created_time < \''.date('Y-m-d H:i:s').'\'');
define('ASSET_VERSION', '20220502')
?>