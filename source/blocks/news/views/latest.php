<?php 
global $tmpl;
$Itemid = 5;
?>
<div id="block-<?php echo $blockId?>" class="block-news block-news-<?php echo $style ?>" style="<?php echo $cssText?>">
    <div class="container">
        <div class="block-content">
            <div class="slider slider-for">
                <?php $i = 0;
                foreach($list as $item){
                    $title = htmlspecialchars($item->title);
                    $link = FSRoute::_('index.php?module=news&view=news&id='.$item->id.'&code='.$item->alias.'&ccode='.$item->category_alias);
                    $i++;?>
                    <?php if($item -> image){?>
                        <article class="post-slider-for">
                            <img class="img-fluid img-bg" src="<?php echo URL_ROOT.str_replace('/original/','/small/', $item->image); ?>" alt="<?php echo $title;?>" />
                            <div class="post-slider-for-info">
                                <a class="thumb" href="<?php echo $link;?>" title="<?php echo $title;?>">
                                    <img class="img-fluid" src="<?php echo URL_ROOT.str_replace('/original/','/small/', $item->image); ?>" alt="<?php echo $title;?>" />
                                </a>
                                <h4 class="heading"><a href="<?php echo $link;?>" title="<?php echo $title ?>"><?php echo $item->title?></a></h4>
                            </div>
                        </article><!-- /.post-item-->
                    <?php }?>
                <?php }?>
            </div>
            <div class="slider-nav-bound">
                <div class="slider slider-nav">
                    <?php $i = 0;
                    foreach($list as $item){
                        $title = htmlspecialchars($item->title);
                        $link = FSRoute::_('index.php?module=news&view=news&id='.$item->id.'&code='.$item->alias.'&ccode='.$item->category_alias);?>
                        <article class="post-slider-nav">
                            <a class="thumb" href="<?php echo $link;?>" title="<?php echo $title;?>">
                                <img class="img-fluid" src="<?php echo URL_ROOT.str_replace('/original/','/small/', $item->image); ?>" alt="<?php echo $title;?>" />
                            </a>
                            <h4 class="heading"><a href="<?php echo $link;?>" title="<?php echo $title ?>"><?php echo $item->title?></a></h4>
                        </article><!-- /.post-item-->
                    <?php $i++; }?>
                </div>
            </div>
        </div><!-- /.block-content-->
    </div>
</div><!-- #block-<?php echo $blockId?>-->
<script type="text/javascript">
    $('#block-<?php echo $blockId ?> .slider-for').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        fade: true,
        asNavFor: '#block-<?php echo $blockId ?> .slider-nav'
    });

    $('#block-<?php echo $blockId ?> .slider-nav').slick({
        slidesToShow: 5,
        slidesToScroll: 1,
        asNavFor: '#block-<?php echo $blockId ?> .slider-for',
        dots: false,
        centerMode: false,
        focusOnSelect: false,
        vertical: true,
        verticalSwiping: true,
    });
</script>