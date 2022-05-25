<?php 
global $tmpl;
$Itemid = 5;
?>
<div id="block-<?php echo $blockId?>" class="block-news block-news-<?php echo $style ?>" style="<?php echo $cssText?>">
    <div class="container">
        <div class="block-heading">
            <a href="<?php echo $bLink ?>"><?php echo $title; ?></a>
        </div><!-- /.block-heading-->
        <div class="block-content">
            <div class="row list-news">
                <?php $i = 0;
                foreach($list as $item){
                    $i++;
                ?>
                    <div class="<?php if($i=='1') echo 'col-lg-12'; else echo 'col-lg-6'; ?>">
                        <?php $tmpl->list_item($item, 'tiny'); ?>
                    </div>
                <?php }?>
            </div><!-- /.row-->
        </div><!-- /.block-content-->
    </div>
</div><!-- #block-<?php echo $blockId?>-->