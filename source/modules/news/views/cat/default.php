<?php
global $tmpl;
if(trim($cat->seo_title != ''))
    $tmpl->addTitle($cat->seo_title);
else
    $tmpl->addTitle($cat->name);
if(trim($cat->seo_keyword != ''))
    $tmpl->addMetakey($cat->seo_keyword);
if(trim($cat->seo_description != ''))
    $tmpl->addMetades($cat->seo_description);
$Itemid = 5;
?>
<div class="container">
    <div class="row">
        <div class="col-lg-9">
            <?php if($tmpl -> count_block('content-position')){?>
                <?php $tmpl -> load_position('content-position');?>
            <?php }?>
            <h1 class="content-title"><?php echo $cat->name ?></h1>
            <?php foreach($listNews as $item){?>
                <?php $tmpl->news_item($item, 'small');?>
            <?php } ?>
            <?php if($pagination) echo $pagination->showPagination(); ?>
        </div><!-- /.col-lg-9-->
        <div class="col-lg-3">
            <?php if($tmpl -> count_block('aside-position')){?>
                <?php $tmpl -> load_position('aside-position');?>
            <?php }?>
        </div><!-- /.col-lg-3-->
    </div><!-- /.row-->
</div><!-- /.container-->