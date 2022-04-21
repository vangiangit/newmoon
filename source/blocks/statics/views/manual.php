<?php
global $tmpl;
$Itemid = 5;
?>
<div id="block-<?php echo $blockId?>" class="block block-statics block-statics-<?php echo $style ?>" style="<?php echo $cssText?>">
    <div id="block-<?php echo $blockId?>-carousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="item active">
            <?php $i=0;
            $total = count($list);
            foreach($list as $item){
                $i++;
                $title = htmlspecialchars($item->title);
                $link = FSRoute::_('index.php?module=statics&view=statics&id='.$item->id.'&code='.$item->alias.'&ccode='.$item->category_alias.'&Itemid='.$Itemid);?>
                <div class="panel-group">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" href="#collapse-<?php echo $blockId.'-'.$item->id?>"><?php echo $item->title ?></a>
                            </h4>
                        </div>
                        <div id="collapse-<?php echo $blockId.'-'.$item->id?>" class="panel-collapse collapse">
                            <div class="panel-body"><?php echo $item->content ?></div>
                        </div>
                    </div>
                </div><!-- /.panel-group-->
                <?php if($i%5==0 && $i!=$total){ ?>
                    </div><!-- /.item-->
                    <div class="item">
                <?php } ?>
            <?php } ?>
            </div><!-- /.item-->
        </div><!-- /.carousel-inner-->
        <?php if($total > 5){ ?>
            <ol class="carousel-indicators">
                <li data-target="#block-<?php echo $blockId?>-carousel" data-slide-to="0" class="active"></li>
                <?php $i=$j=0;
                foreach($list as $item){
                    $i++;?>
                    <?php if($i%5==0 && $i!=$total){
                        $j++;?>
                        <li data-target="#block-<?php echo $blockId?>-carousel" data-slide-to="<?php echo $j?>"></li>
                    <?php } ?>
                <?php } ?>
            </ol>
        <?php } ?>
    </div><!-- /.carousel.slide-->
</div><!-- /#block-<?php echo $blockId?>-->