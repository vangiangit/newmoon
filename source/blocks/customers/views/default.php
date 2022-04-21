<?php 
global $tmpl;
$Itemid = 9;
?>
<div id="block-<?php echo $blockId?>" class="block-customers block-customers-<?php echo $style ?>" style="<?php echo $cssText?>">
    <div class="container">
        <div class="block-heading">
            <?php echo $title?>
        </div>
        <div id="block-<?php echo $blockId?>-content" class="block-content carousel slide" data-interval="false" data-ride="carousel">
            <div class="carousel-inner" role="listbox">
                <div class="row item active">
                    <?php $i=0;
                    $total = count($list);
                    foreach($list as $item){
                        $i++;
                        ?>
                        <div class="col-lg-3">
                            <?php $tmpl->customer_item($item) ?>
                        </div>
                        <?php if($i%4==0 && $i!=$total){ ?>
                            </div><!-- /.row-->
                            <div class="row item">
                        <?php } ?>
                    <?php } ?>
                </div><!-- /.row-->
            </div><!--end: .carousel-inner-->
            <a class="left carousel-control" href="#block-<?php echo $blockId?>-content" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            </a>
            <a class="right carousel-control" href="#block-<?php echo $blockId?>-content" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            </a>
        </div><!-- /.block-content-->
        <div class="block-button">
            <a href="<?php echo $linkAll?>" title="Xem tất cả">Xem tất cả</a>
        </div>
    </div><!-- /.container-->
</div><!-- /#block-<?php echo $blockId?>-->