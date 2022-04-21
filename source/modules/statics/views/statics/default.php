<?php
global $tmpl;
$seo_title = $data -> seo_title ? $data -> seo_title : $data -> title;
$seo_keyword = $data -> seo_keyword ? $data -> seo_keyword : $seo_title;
$seo_description = $data -> seo_description ? $data -> seo_description : mb_strtolower(strip_tags($data -> summary),'UTF8');
$tmpl->addTitle($seo_title);
$tmpl->addMetakey($seo_keyword);
$tmpl->addMetades($seo_description);
$Itemid = 3;		
?>
<div class="container">
    <div class="row">
        <div class="col-lg-3">
            <?php if($tmpl -> count_block('sidebar-position')){?>
                <?php $tmpl -> load_position('sidebar-position');?>
            <?php }?>
        </div><!-- /.col-lg-4-->
        <div class="col-lg-9">
            <div id="news-detail">
                <h1 class="news-title"><?php echo $data->title;?></h1>
                <div class="news-date">
                    <?php echo date('d/m/Y | H:i', strtotime($data->created_time));?>
                </div>
                <div class="news-content">
                    <?php echo $data->content; ?>
                </div><!--end: .detail-->
            </div><!--end: #news-detail-->
            <?php require_once (PATH_BASE.'plugins/addthis.php');?>
        </div><!-- /.col-lg-8-->
    </div><!-- /.row-->
</div><!-- /.container-->