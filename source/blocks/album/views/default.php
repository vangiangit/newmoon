<?php 
global $tmpl;
$Itemid = 5;
?>
<div id="block-<?php echo $blockId?>" class="block-album block-album-<?php echo $style ?>" style="<?php echo $cssText?>">
    <div class="container">
        <div class="block-heading">
            <span class="heading"><?php echo $title?></span>
        </div><!-- /.block-heading-->
<!--        <p class="note">--><?php //echo FSText::_('Góc chia sẻ hình ảnh hoạt động của YBCM và album ảnh khác') ?><!--</p>-->
        <div class="block-content">
            <div class="row">
            <?php $i=0;
            $total = count($list);
            foreach($list as $item){
                $i++; ?>
                <div class="col-lg-6">
                    <?php $tmpl->album_item($item, 'tiny');?>
                </div><!-- /.col-lg-6-->
                <?php if($i%2==0 && $i!=$total){ ?>
                    </div><!-- /.row-->
                    <div class="row">
                <?php }?>
            <?php } ?>
            </div><!-- /.row-->
        </div><!--end: .block-content-->
    </div>
</div><!-- #block-<?php echo $blockId?>-->