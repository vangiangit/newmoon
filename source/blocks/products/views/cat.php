<div id="block-<?php echo $blockId; ?>" class="block-products block-products-<?php echo $style ?>" style="<?php echo $cssText;?>">
    <div class="container">
        <div class="block-heading">
            <a href="<?php echo $bLink ?>" class="heading"><?php echo $title ?></a>
        </div><!--end: .block-heading-->
        <div class="block-content">
            <div class="row">
                <div class="col-lg-6 medium-list">
                    <?php $tmpl->product_item($list[0], "medium") ?>
                </div><!--end: .col-lg-6-->
                <div class="col-lg-6 small-list">
                    <div class="row">
                        <?php $i = 0;
                        foreach ($list as $item) {
                            $i++;
                            if($i == 1)
                                continue;
                            ?>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                <?php $tmpl->product_item($item) ?>
                            </div><!--end: .col-lg-3-->
                            <?php if(($i-1)%2 == 0 && $i != count($list)){?>
                                </div>
                                <div class="row">
                            <?php } ?>
                        <?php } ?>
                    </div>
                </div><!--end: .col-lg-6-->
            </div><!--end: .row-->
        </div><!--end: .block-content-->
    </div><!--end: .container-->
</div><!--end: #block-<?php echo $blockId; ?>-->