<div id="block-<?php echo $blockId; ?>" class="block-products block-products-<?php echo $style ?>" style="<?php echo $cssText;?>">
    <div class="container">
        <div class="block-heading">
            <?php echo $title ?>
        </div><!--end: .block-heading-->
        <p class="note"><?php echo FSText::_('Sản phẩm của YBC phân phối rộng khắp trong nước và quốc tế như Hàn quốc, Ấn độ, Thái Lan, Bangladesh...')?></p>
        <div class="block-content">
            <div class="row">
                <?php $i = 0;
                foreach ($list as $item) {
                    $i++;?>
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 <?php if($i%2) echo 'col-xs-br';?>">
                        <?php $tmpl->product_item($item) ?>
                    </div><!--end: .col-lg-3-->
                <?php } ?>
            </div><!--end: .row-->
        </div><!--end: .block-content-->
    </div><!--end: .container-->
</div><!--end: #block-<?php echo $blockId; ?>-->