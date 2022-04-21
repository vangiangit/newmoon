<?php
global $tmpl;
$seo_title = $data -> seo_title ? $data -> seo_title : $data -> title;
$seo_keyword = $data -> seo_keyword ? $data -> seo_keyword : $seo_title;
$seo_description = $data -> seo_description ? $data -> seo_description : $data -> summary;
$tmpl->addTitle($seo_title);
$tmpl->addMetakey($seo_keyword);
$tmpl->addMetades($seo_description);
$tmpl->addStylesheet('jquery.fancybox.min');
$tmpl->addScript('jquery.fancybox.min');
$Itemid = 5;		
$tmpl->setMeta('og:image', URL_ROOT.str_replace('/original/','/tiny/', $data->image));
?>
<div class="container">
    <h1 class="content-title post-title"><?php echo $data->title;?></h1>
    <div class="post-date">
        <?php echo date('d/m/Y | H:i', strtotime($data->created_time));?>
    </div>
    <div class="post-content">
        <?php echo $data->summary; ?>
    </div><!-- /.post-content-->
    <div class="row row-album">
        <?php $i = 0;
        $total= count($listImages);
        foreach($listImages as $item){
            $i++;?>
            <div class="col-lg-3">
                <a class="gallery-item" data-fancybox="gallery" href="<?php echo URL_ROOT.$item->image; ?>">
                    <img class="img-responsive" src="<?php echo URL_ROOT.str_replace('/original/','/tiny/', $item->image); ?>" alt="<?php echo $data->title;?>" />
                </a>
            </div><!-- /.col-lg-3-->
            <?php if($i%4==0 & $i!=$total){ ?>
                </div><!-- /.row-->
                <div class="row row-album">
            <?php } ?>
        <?php } ?>
    </div><!-- /.row-->
</div><!-- /.container-->