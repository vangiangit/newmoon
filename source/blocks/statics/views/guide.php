<?php
global $tmpl;
$Itemid = 5;
?>
<div id="block-<?php echo $blockId?>" class="block block-statics block-statics-<?php echo $style ?>" style="<?php echo $cssText?>">
    <div class="container">
        <div id="block-<?php echo $blockId?>-carousel" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="item active">
                    <div class="row">
                    <?php $i=0;
                    $total = count($list);
                    foreach($list as $item){
                        $i++;
                        $title = htmlspecialchars($item->title);
                        $link = FSRoute::_('index.php?module=statics&view=statics&id='.$item->id.'&code='.$item->alias.'&ccode='.$item->category_alias.'&Itemid='.$Itemid);?>
                        <div class="col-lg-4">
                            <div class="static-item">
                                <a href="<?php echo $link?>" title="<?php echo $title;?>" class="thumb"><img class="img-responsive" src="<?php echo URL_ROOT.str_replace('/original/','/tiny/', $item->image); ?>" alt="<?php echo $title;?>"></a>
                                <h4 class="heading">
                                    <a href="<?php echo $link?>" title="<?php echo $title;?>"><?php echo $item->title ?></a>
                                </h4>
                                <div class="summary"><?php echo $item->summary ?></div>
                                <a class="learn-more" href="<?php echo $link?>" title="<?php echo $title;?>">Learn more</a>
                            </div>
                        </div><!-- /.panel-group-->
                        <?php if($i%3==0 && $i!=$total){ ?>
                                </div><!-- /.row-->
                            </div><!-- /.item-->
                            <div class="item">
                                <div class="row">
                        <?php } ?>
                    <?php } ?>
                    </div><!-- /.row-->
                </div><!-- /.item-->
            </div><!-- /.carousel-inner-->
            <?php if($total > 3){ ?>
                <ol class="carousel-indicators">
                    <li data-target="#block-<?php echo $blockId?>-carousel" data-slide-to="0" class="active"></li>
                    <?php $i=$j=0;
                    foreach($list as $item){
                        $i++;?>
                        <?php if($i%3==0 && $i!=$total){
                            $j++;?>
                            <li data-target="#block-<?php echo $blockId?>-carousel" data-slide-to="<?php echo $j?>"></li>
                        <?php } ?>
                    <?php } ?>
                </ol>
            <?php } ?>
        </div><!-- /.carousel.slide-->
    </div><!-- /.container-->
</div><!-- /#block-<?php echo $blockId?>-->