<?php
global $tmpl;
$tmpl->addTitle(FSText::_('Album ảnh'));
$Itemid = 5;
?>
<div class="container">
    <h1 class="content-title post-title text-uppercase"><?php echo FSText::_('Album ảnh')?></h1>
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
</div>
