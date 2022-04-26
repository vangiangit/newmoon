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
<div class="container container-news">
    <h1 class="block-heading">
        <?php echo $cat->name?>
    </h1>
    <div class="row list-news">
        <?php $i = 0;
        foreach($listNews as $item){
            $i++;?>
            <div class="col-lg-6">
                <?php $tmpl->project_item($item, 'tiny'); ?>
            </div>
        <?php } ?>
    </div><!-- /.list-grid-->
    <?php if($pagination) echo $pagination->showPagination(); ?>
    <?php if($tmpl -> count_block('content-position')){?>
        <?php $tmpl -> load_position('content-position');?>
    <?php }?>
</div><!-- /.container-->