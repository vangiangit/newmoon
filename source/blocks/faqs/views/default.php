<?php 
global $tmpl;
$Itemid = 5;
?>
<div id="block-<?php echo $blockId?>" class="block-faqs block-faqs-<?php echo $style ?>" style="<?php echo $cssText?>">
    <div class="block-heading">
        <a title="<?php echo htmlspecialchars($title) ?>" href="<?php echo $bLink; ?>">
            <?php echo $title ?>
        </a>
    </div><!--end: .block-heading-->
    <div class="block-content">
        <div class="list-faqs">
            <?php $i=0;
            $total = count($list);
            foreach($list as $item){
                $i++;
                $title = htmlspecialchars($item->title);
                $link = FSRoute::_('index.php?module=faqs&view=faqs&id='.$item->id.'&code='.$item->alias.'&ccode='.$item->category_alias);?>
                <div class="panel-group">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" href="#collapse-<?php echo $blockId.'-'.$item->id?>"><?php echo $item->title ?></a>
                            </h4>
                        </div>
                        <div id="collapse-<?php echo $blockId.'-'.$item->id?>" class="panel-collapse collapse <?php if($i==1) echo 'in';?>">
                            <div class="panel-body"><?php echo $item->content ?></div>
                        </div>
                    </div>
                </div><!-- /.panel-group-->
            <?php } ?>
        </div><!-- /.list-faqs-->
    </div><!--end: .block-content-->
</div><!-- #block-<?php echo $blockId?>-->