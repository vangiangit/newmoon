<?php
$cols = count($list);
$span = ceil(12/$cols);
?>
<div id="block-<?php echo $blockId; ?>" class="block-banner block-banner-<?php echo $style ?>" style="<?php echo $cssText?>">
    <div class="block-heading text-center">
        <?php $title = explode('|', $title); ?>
        <h4><?php echo @$title[0] ?></h4>
        <h2><?php echo @$title[1] ?></h2>
    </div>
    <div class="container">
        <div class="row">
            <?php $i = 0;
            foreach($list as $item){
                $i++;?>
                <div id="banner-<?php echo $item->id; ?>" class="col-lg-<?php echo $span ?> col-md-<?php echo $span ?> col-sm-6 col-xs-6">
                    <div class="item">
                        <a class="thumb" href="<?php echo FSRoute::_($item -> link);?>">
                            <img class="img-responsive" alt="<?php echo $item -> name; ?>" src="<?php echo URL_ROOT.$item -> image;?>"/>
                        </a>
                        <div class="item-heading">
                            <?php $name = explode('|', $item->name);
                            echo $name[0];
                            if(isset($name[1])) echo '<span>&nbsp;'.$name[1].'</span>';
                            ?>
                        </div>
                        <div class="item-content">
                            <?php echo $item -> content; ?>
                        </div>
                    </div>
                </div>
            <?php }?>
        </div>
        <div class="row text-center">
            <p><a class="btn btn-default btn-wide-solid2" id="getstarted-btn" href="<?php echo FSRoute::_('index.php?module=products&view=home')?>" role="button"><?php echo FSText::_('GET STARTED')?></a></p>
        </div>
    </div><!-- /.container-->
</div><!--end: #block-<?php echo $blockId; ?>-->