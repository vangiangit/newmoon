<div id="block-<?php echo $blockId ?>" class="block-banner block-banner-<?php echo $style ?>" style="<?php echo $cssText?>">
    <div class="block-heading">
        <?php echo $title ?>
    </div>
    <?php $i = 0;
    foreach($list as $item){
        $i++;?>
        <div id="banner-<?php echo $item->id; ?>" class="item">
            <?php echo $item -> content; ?>
        </div>
    <?php }?>
</div><!--end: #block-<?php echo $blockId ?>-->