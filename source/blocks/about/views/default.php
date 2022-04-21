<?php 
global $tmpl;
$Itemid = 5;
?>
<div id="block-<?php echo $blockId?>" class="block-about block-about-<?php echo $style ?>" style="<?php echo $cssText?>">
    <div class="container">
        <div class="block-content">
            <div class="row row-centered">
            <?php $i=0;
            $total = count($list);
            foreach($list as $item){
                $i++; ?>
                <div class="col-lg-4">
                    <?php $tmpl->about_item($item, 'tiny');?>
                </div><!-- /.col-lg-6-->
                <?php if($i%4==0 && $i!=$total){ ?>
                    </div><!-- /.row-->
                    <div class="row row-centered">
                <?php }?>
            <?php } ?>
            </div><!-- /.row-->
        </div><!--end: .block-content-->
    </div>
</div><!-- #block-<?php echo $blockId?>-->