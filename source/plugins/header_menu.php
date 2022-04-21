<?php
global $tmpl;
?>
<div class="header-menu-content">
    <div class="logo">
        <a href="<?php echo URL_ROOT?>" title="">
            <img class="img-responsive" src="<?php echo URL_ROOT?>templates/default/images/logo.png">
        </a>
    </div><!-- /.logo-->
    <?php if($tmpl -> count_block('menu-position')){?>
        <?php $tmpl -> load_position('menu-position');?>
    <?php }?>
    <?php $tmpl->load_direct_blocks('search'); ?>
    <p class="social">
        <a class="" href="#"></a>
        <a class="" href="#"></a>
        <a class="" href="#"></a>
        <a class="" href="#"></a>
        <a class="" href="#"></a>
    </p>
    <p class="copyright">Copyright @ 2018 <a href="<?php echo URL_ROOT?>"><?php echo $_SERVER['HTTP_HOST']; ?></a>.<br />All rights reserved.</p>
</div>