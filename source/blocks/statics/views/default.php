<?php 
global $tmpl;
$Itemid = 5;
$cols = count($list);
$span = ceil(12/$cols);
?>
<div id="block-<?php echo $blockId?>" class="block-statics block-statics-<?php echo $style ?>" style="<?php echo $cssText?>">
    <div class="container">
        <div class="block-heading">
            <?php echo $title?>
        </div>
        <p class="block-summary">Finalstyle là đơn vị tiên phong Xây dựng, phát triển các ứng dụng App dành cho website và App <br /> quản lý nội bộ tại Việt Nam</p>
        <div class="row">
            <?php $i=0;
            foreach($list as $item){
                $i++;
                $title = htmlspecialchars($item->title);
                $link = FSRoute::_('index.php?module=statics&view=statics&id='.$item->id.'&code='.$item->alias.'&ccode='.$item->category_alias.'&Itemid='.$Itemid);?>
                <div class="statics-item col-lg-<?php echo $span?>">
                    <a class="thumb" href="<?php echo $link?>" title="<?php echo $title;?>">
                        <img class="img-responsive" src="<?php echo URL_ROOT.str_replace('/original/','/tiny/', $item->image); ?>" alt="<?php echo $title;?>">
                    </a>
                    <h2 class="heading">
                        <a href="<?php echo $link?>"><?php echo $item->title; ?></a>
                    </h2>
                    <p class="summary"><?php echo nl2br($item->summary) ?></p>
                </div>
            <?php } ?>
        </div><!-- /.row-->
        <div class="block-button">
            <a href="#">Xem thêm</a>
        </div>
    </div><!-- /.container-->
</div><!-- /#block-<?php echo $blockId?>-->