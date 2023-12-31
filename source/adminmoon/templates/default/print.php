<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Control Pannel</title>
	<link href="templates/default/css/templates.css" rel="stylesheet" type="text/css" />
	<!--[if IE 7.0]>
	  <link href="templates/default/css/ie7.css" rel="stylesheet" type="text/css" />
	<![endif]-->
	<!--[if IE 6.0]>
	  <link href="templates/default/css/ie6.css" rel="stylesheet" type="text/css" />
	<![endif]-->
	<script type="text/javascript" src="templates/default/js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="templates/default/js/helper.js"></script>
    <style type="text/css">
    body{
        background: #fff !important;
    }
    </style>
</head>
<body style="width:760px;margin:0px auto;">
	<div class='print-head'>
		<img src="<?php echo URL_ROOT.'images/logos/logo.png'; ?>" />
		<hr/>
	</div>
	<!-- MAIN					-->
	<div class='print-body'>
		<div id="print-content-raw">
		</div>
		<div id="print-content" >
				<?php  echo $main_content; ?>
		</div>
	</div>
	<!-- end MAIN					-->
	<div style="clear: both;"></div>
	<div class='print-footer'>
		<div style="background: none repeat scroll 0% 0% rgb(238, 238, 238); padding: 5px;">
			<hr/>
			<div style="font-family: Arial; font-size: xx-small;"> 
				Copyright 2010 <?php echo URL_ROOT;?>
			</div>
		</div>
	</div>		
</body>
</html>