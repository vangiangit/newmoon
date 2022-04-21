<?php 
global $tmpl;
$Itemid = 5;
?>
<div id="block-<?php echo $blockId?>" class="block-news block-news-<?php echo $style ?>" style="<?php echo $cssText?>">
    <div class="container">
        <div class="block-content">
            <div class="row row-new-hot">
                <?php
                $is2 = true;
                $i = 0;
                $j = 0;
                $total = count($list);
                foreach($list as $item){
                    $i++;
                    $j++;
                    $title = htmlspecialchars($item->title);
                    $link = FSRoute::_('index.php?module=news&view=news&id='.$item->id.'&code='.$item->alias.'&ccode='.$item->category_alias); ?>
                    <?php if($is2 && $i==1){
                        $size = 'small';?>
                        <div class="col-lg-8">
                    <?php }else{
                        $size = 'tiny';?>
                        <div class="col-lg-4">
                    <?php } ?>
                        <div class="col-news col-news-<?php echo $j ?>">
                            <a class="thumb" href="<?php echo $link;?>" title="<?php echo $title;?>">
                                <img onerror="this.src='/images/no-small-news.jpg'" class="img-responsive" src="<?php echo URL_ROOT.str_replace('/original/','/'.$size.'/', $item->image); ?>" alt="<?php echo $title;?>" />
                            </a>
                            <div class="bound-summary">
                                <div class="summary">
                                    <h4 class="heading"><a href="<?php echo $link;?>" title="<?php echo $title ?>"><?php echo $item->title?></a></h4>
                                    <p><?php echo cutString($item->summary, 175)?></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php if($is2 && $i==2){
                        $i = 0;
                        $is2 = false;
                        if($j != $total)
                            echo '</div><!-- /.row--><div class="row row-new-hot">';
                    } ?>
                    <?php if(!$is2 && $i==3){
                        $i = 0;
                        $is2 = true;
                        if($j != $total)
                            echo '</div><!-- /.row--><div class="row row-new-hot">';
                    } ?>
                <?php }?>
            </div><!-- /.row-->
        </div><!-- /.block-content-->
    </div>
</div><!-- #block-<?php echo $blockId?>-->
<script type="text/javascript">
    $(document).ready(function () {
        var bWidth = $('.col-news-2').width();
        $('.col-news').css('height', bWidth+'px');
    })
</script>