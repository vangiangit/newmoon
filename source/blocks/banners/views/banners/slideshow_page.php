<?php
global $tmpl;
?>
<div id="block-<?php echo $blockId ?>" class="block-banner block-banner-<?php echo $style ?> carousel slide" data-ride="carousel" style="<?php echo $cssText?>">
    <ol class="carousel-indicators">
        <?php $i = 0;
    foreach($list as $item){?>
            <li data-target="#block-<?php echo $blockId ?>" data-slide-to="<?php echo $i?>" class="<?php if($i==0) echo 'active' ?>"></li>
        <?php $i++; }?>
    </ol>
    <div class="carousel-inner" role="listbox">
        <?php $i = 0;
        foreach($list as $item){
            $i++;?>
            <div id="banner-<?php echo $item->id; ?>" class="item <?php if($i==1) echo 'active' ?>">
                <?php if($item -> type == 1){?>
                    <?php if($item -> image){?>
                        <a target="<?php echo $item -> target;?>" rel="nofollow" href="<?php echo $item -> link;?>" title='<?php echo $item -> name;?>'>
                            <img class="img-responsive" alt="<?php echo $item -> name; ?>" src="<?php echo URL_ROOT.$item -> image;?>"/>
                        </a>
                    <?php }?>
                <?php } else {?>
                    <?php echo $item -> content; ?>
                <?php }?>
            </div>
        <?php }?>
    </div><!--end: .carousel-inner-->
</div><!--end: #block-<?php echo $blockId ?>-->