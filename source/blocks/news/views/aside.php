<?php 
global $tmpl;
$Itemid = 5;
?>
<div id="block-<?php echo $blockId?>" class="block-news block-news-<?php echo $style ?>" style="<?php echo $cssText?>">
    <div class="block-heading">
        <?php echo $title ?>
    </div>
    <div class="block-content">
        <?php foreach($list as $item){
            $tmpl->news_tiny($item, 'tiny');
        }?>
    </div><!-- /.block-content-->
</div><!-- #block-<?php echo $blockId?>-->