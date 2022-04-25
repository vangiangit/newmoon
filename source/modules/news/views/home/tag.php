<?php
global $tmpl;
$tmpl->addTitle('Tag: '.$keyword);
$Itemid = 5;
?>
<div class="container container-news">
    <h1 class="block-heading">
        <?php echo $keyword?>
    </h1>
    <div class="row list-grid">
        <?php foreach($listNews as $item){?>
            <div class="col-lg-4">
                <?php $tmpl->grid_item($item, 'tiny');?>
            </div>
        <?php } ?>
    </div><!-- /.list-grid-->
    <?php if($pagination) echo $pagination->showPagination(); ?>
    <?php if($tmpl -> count_block('content-position')){?>
        <?php $tmpl -> load_position('content-position');?>
    <?php }?>
</div><!-- /.container-->