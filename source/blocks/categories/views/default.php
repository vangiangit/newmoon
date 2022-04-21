<?php
$Itemid = 4;
$cols = count($cats);
?>
<div id="block-<?php echo $blockId; ?>" class="block-categories block-categories-<?php echo $style ?>" style="<?php echo $cssText;?>">
    <div class="container">
        <div class="block-heading">
            <span class="heading"><?php echo $title ?></span>
        </div><!--end: .block-heading-->
        <div class="block-content">
            <div class="row">
                <?php $i = 0;
                foreach ($cats as $cat){
                    $i++;
                    $link = FSRoute::_('index.php?module=product&view=cat&ccode='.$cat->alias.'&id='.$cat->id.'&Itemid=2');
                ?>
                    <div class="col-lg-4 col-md-4 col-sm-4">
                        <div class="cat-item">
                            <a href="<?php echo $link ?>" title="<?php echo htmlspecialchars($cat->name)?>">
                                <img class="img-responsive" src="<?php echo URL_ROOT.$cat->icon ?>" alt="<?php echo htmlspecialchars($cat->name)?>">
                            </a>
                            <h4 class="heading"><a href="<?php echo $link ?>" title="<?php echo htmlspecialchars($cat->name)?>"><?php echo $cat->name?></a></h4>
                            <div class="total"><?php echo $cat->total_products ?> sản phẩm</div>
                        </div>
                    </div>
                    <?php if($i%3==0 && $i!=$cols){ ?>
                        </div><!--end: .row-->
                        <div class="row">
                    <?php } ?>
                <?php } ?>
            </div><!--end: .row-->
        </div><!--end: .block-content-->
    </div><!--end: .container-->
</div><!--end: #block-<?php echo $blockId; ?>-->
