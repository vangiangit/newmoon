<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>CMS - FinalStyle</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="copyright" content="© 2013 FinalStyle, Thiết kế website Phong Cách Số" /> 
    <meta name="robots" content="noindex, nofollow"/>
    <link rel="shortcut icon" href="templates/default/images/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="templates/default/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="templates/default/css/templates.css"/>
    <link rel="stylesheet" type="text/css" href="templates/default/js/charCount/charCount.css"/>
    <link rel="stylesheet" type="text/css" href="<?php echo URL_ROOT; ?>libraries/jquery/jquery.ui/jquery-ui.css"/>
    <!--[if gte IE]>
        <link rel="stylesheet" type="text/css" href="templates/default/css/ie.css"/>
    <![endif]-->
    <script type="text/javascript" src="<?php echo URL_ROOT; ?>libraries/jquery/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="<?php echo URL_ROOT; ?>libraries/jquery/jquery.ui/jquery-ui.js"></script>
    <script type="text/javascript" src="<?php echo URL_ROOT; ?>libraries/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="<?php echo URL_ROOT; ?>libraries/ckeditor/plugins/ckfinder/ckfinder.js"></script>
    <script type="text/javascript" src="templates/default/js/helper.js"></script>
    <script type="text/javascript" src="templates/default/js/datetimepicker.js"></script>
    <script type="text/javascript" src="templates/default/js/charCount/charCount.js"></script>
    
    <script type="text/javascript" src="<?php echo URL_ROOT; ?>libraries/tiny_mce/tiny_mce.js"></script>
    <script type="text/javascript" src="<?php echo URL_ROOT; ?>libraries/tiny_mce/ASCIIMathML2wMnGFallback.js"></script>
</head>
<body>
    <div id="wrapper">
        <div id="sidebar" class="fl">
            <div id="admin-info">
                <div class="avatar fl">
                    <a href="<?php echo URL_ADMIN?>"><img src="templates/default/images/logo/logo.jpg?v=<?php echo ASSET_VERSION; ?>" /></a>
                </div><!--end: .avatar-->
                <div class="info fr">
                    <div class="lang">
                        <?php
                        $arrLang = array('vi'=>'Tiếng việt', 'en'=>'English');
                        $language = $_SESSION['adlang'];
						$query_string = trim(preg_replace('/(&)?adlang=[a-z]+/i', '', $_SERVER['QUERY_STRING']));
                        if($query_string != '')
                            $query_string = rtrim($query_string, '&').'&';
                        ?>
                        <select onchange="window.location.href='<?php echo URL_ADMIN.'index.php?'.$query_string.'adlang=';?>'+this.value">
                            <?php foreach($arrLang as $key=>$val){ ?>
                                <option <?php if($language == $key) echo 'selected="selected"'?> value="<?php echo $key?>"><?php echo $val?></option>
                            <?php } ?>
                        </select>
                    </div><!--end: .lang-->
                    <div class="name"><?php echo $_SESSION['ad_username']; ?></div>
                    <div class="tool">
                        <a href="index.php?module=users&view=users&task=edit&cid=<?php echo $_SESSION['ad_userid']; ?>">Setting</a>
                        <span>|</span>
                        <a href="index.php?module=users&view=log&task=logout" title="Logout" >Logout</a>
                    </div><!--end: .tool-->
                </div><!--end: .info-->
            </div><!--end: #admin-info-->
            <div id="menu-bar">
                <?php require('modules/menus/admin.php');?>
            </div><!--end: #menu-bar-->
            
            <div class="clearfix"></div>
        </div><!--end: #sidebar-->
        <div id="wrap-content">
            <div id="box-content">
                <?php 
        		global $toolbar;
        		echo $toolbar->show_head_form();
                echo $main_content; 
                ?>
                <div class="clearfix"></div>
            </div><!--end: #box-content-->
            <div class="clearfix"></div>
        </div><!--end: #wrap-content-->
        <div class="clearfix"></div>
    </div><!--end: #wrapper-->
    <div id="footer" style="text-align: center;">
        © Copyright <?php echo date('Y');?> <strong><?php echo $_SERVER['HTTP_HOST'] ?></strong> All rights reserved
    </div><!--end: #footer-->
</body>		
</html>