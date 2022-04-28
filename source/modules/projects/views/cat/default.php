<?php
$string = new FSString();
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
<div class="container container-news container-projects">
    <h1 class="block-heading project-heading">
        <?php echo $cat->summary?>
    </h1>
    <div class="listTag d-flex">
        <a href="javascript:void(0);">
            <div class="hashTag">
                <div>Submit Your Project</div>
            </div>
        </a>
    </div>
    <div class="row list-news">
        <?php $i = 0;
        foreach($listNews as $item){
            $i++;?>
            <div class="col-lg-4">
                <?php $tmpl->project_item($item, 'tiny'); ?>
            </div>
        <?php if($i==3) break; } ?>
    </div><!-- /.list-grid-->
    <div class="listTag d-flex">
        <?php $tags = explode(',', $cat->tags); ?>
        <a href="javascript:void(0);" data-tag="all">
            <div class="hashTag">
                <div>All</div>
            </div>
        </a>
        <?php 
        foreach($tags as $tag){ 
        ?>
            <a href="javascript:void(0);" data-tag="<?php echo $string->stringStandart($tag); ?>">
                <div class="hashTag">
                    <div><?php echo trim($tag) ?></div>
                </div>
            </a>
        <?php } ?>
    </div>
    <div class="row list-news">
        <?php $i = 0;
        foreach($listNews as $item){
            $class = '';
            $tags = explode(',', $item->tags);
            foreach($tags as $tag)
                $class .= ' project-tag-'.trim($string->stringStandart($tag));
            $i++;?>
            <div class="col-lg-4 project-tag <?php echo $class ?>">
                <?php $tmpl->project_item($item, 'tiny'); ?>
            </div>
        <?php } ?>
    </div><!-- /.list-grid-->
    <?php if($pagination) echo $pagination->showPagination(); ?>
    <?php if($tmpl -> count_block('content-position')){?>
        <?php $tmpl -> load_position('content-position');?>
    <?php }?>
</div><!-- /.container-->
<script type="text/javascript">
    $('.listTag a').click(function(){
        $tag = $(this).data('tag');
        if($tag=='all'){
            $('.project-tag').removeClass('d-none');
            return false;
        }else{
            $('.project-tag').addClass('d-none');
            $('.project-tag-'+$tag).removeClass('d-none');
        }
    });
</script>