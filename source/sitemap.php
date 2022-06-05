<?php
/* Thêm các module */
$arrModule = array();
                        
$arrModule[] = array(   'module'    =>'news',
                        'cats'      =>'fs_news_categories',
                        'post'      =>'fs_news');
                        
$system_path = $_SERVER['DOCUMENT_ROOT'];
if (realpath($system_path) !== FALSE){
    $system_path = realpath($system_path).'/';
}
/* ensure there's a trailing slash */
$system_path = rtrim($system_path, '/').'/';
define('PATH_BASE', str_replace("\\", "/", $system_path));
define('URL_ROOT', 'https://'.$_SERVER['HTTP_HOST'].'/');
if (!isset($_SESSION)){
    session_start();
}

require(PATH_BASE.'config/defines.php');
require(PATH_BASE.'config/config.php');
require(PATH_BASE.'libraries/fsrouter.php');
require(PATH_BASE.'libraries/fscontrollers.php');
require(PATH_BASE.'libraries/fsmodels.php');
require(PATH_BASE.'libraries/database/mysql.php');
require(PATH_BASE.'libraries/fsinput.php');

/* Ngôn ngữ website */
$lang_request = FSInput::get('lang'); 
if($lang_request){
	$_SESSION['lang']  = $lang_request;
} else {
	$_SESSION['lang'] = isset($_SESSION['lang'])?$_SESSION['lang']:'vi';
}
if(MULTI_LANGUAGE){
    define('URL_LANG', URL_ROOT.$_SESSION['lang'] . "/");
}else{
    define('URL_LANG', URL_ROOT);
}

$db = new Mysql_DB();
                        
/* Bắt đầu tạo sitemap */                        
$strXml = '<?xml version="1.0" encoding="UTF-8"?>'."\n";
$strXml = '<?xml-stylesheet type="text/xsl" href="'.URL_ROOT.'templates/sitemap.xsl"?>'."\n";
$strXml .= '<urlset'."\n";
$strXml .= '    xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"'."\n";
$strXml .= '    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"'."\n";
$strXml .= '    xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9'."\n";
$strXml .= '    http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">'."\n";

/* Tao sitemap trang chủ */
$strXml .= '    <url>'."\n";
$strXml .= '        <loc>'.URL_ROOT.'</loc>'."\n";
$strXml .= '        <priority>1</priority>'."\n";
$strXml .= '        <changefreq>daily</changefreq>'."\n";
$strXml .= '        <lastmod>'.date('Y-m-d\TH:i:s+00:00').'</lastmod>'."\n";
$strXml .= '    </url>'."\n";

/* Tạo sitemap các module */
foreach($arrModule as $module){
    $link = FSRoute::_('index.php?module='.$module['module'].'&view=home');
    $strXml .= '    <url>'."\n";
    $strXml .= '        <loc>'.$link.'</loc>'."\n";
    $strXml .= '        <priority>1</priority>'."\n";
    $strXml .= '        <changefreq>daily</changefreq>'."\n";
    $strXml .= '        <lastmod>'.date('Y-m-d\TH:i:s+00:00').'</lastmod>'."\n";
    $strXml .= '    </url>'."\n";
    
    /* Tạo sitemap danh mục */
    if($module['cats']){
        $query = '  SELECT id, alias, created_time FROM '.$module['cats'].' WHERE published = 1 ORDER BY id DESC';
		$sql = $db->query($query);
		$rows = $db->getObjectList();
        if($rows)
            foreach($rows as $item){
                $link = FSRoute::_('index.php?module='.$module['module'].'&view=cat&id='.$item->id.'&ccode='.$item->alias);
                $strXml .= '    <url>'."\n";
                $strXml .= '        <loc>'.$link.'</loc>'."\n";
                $strXml .= '        <priority>0.90</priority>'."\n";
                $strXml .= '        <changefreq>daily</changefreq>'."\n";
                $strXml .= '        <lastmod>'.date('Y-m-d\TH:i:s+00:00', strtotime($item->created_time)).'</lastmod>'."\n";
                $strXml .= '    </url>'."\n";
            }
    }
    
    /* Tạo sitemap bài viết */
    if($module['post']){
        $query = '  SELECT id, alias, category_alias, created_time FROM '.$module['post'].' WHERE published = 1 ORDER BY id DESC';
		$sql = $db->query($query);
		$rows = $db->getObjectList();
        if($rows)
            foreach($rows as $item){
                $link = FSRoute::_('index.php?module='.$module['module'].'&view='.$module['module'].'&id='.$item->id.'&code='.$item->alias.'&ccode='.$item->category_alias);
                $strXml .= '    <url>'."\n";
                $strXml .= '        <loc>'.$link.'</loc>'."\n";
                $strXml .= '        <priority>0.20</priority>'."\n";
                $strXml .= '        <changefreq>daily</changefreq>'."\n";
                $strXml .= '        <lastmod>'.date('Y-m-d\TH:i:s+00:00', strtotime($item->created_time)).'</lastmod>'."\n";
                $strXml .= '    </url>'."\n";
            }
    }
}
$strXml .= '</urlset>';
$filename = PATH_BASE.'sitemap.xml';
$handle = fopen($filename, 'w+');
//chmod($filename, 0777);
fwrite($handle, '');
fwrite($handle, $strXml);
fclose($handle);
echo "Success, wrote  to file ($filename)";
?>