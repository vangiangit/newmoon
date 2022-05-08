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
                                <h4 class="heading">
                                    <a href="<?php echo $link;?>" title="<?php echo $title ?>"><?php echo $item->title?></a>
                                    <span class="date">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-calendar4-week" viewBox="0 0 16 16">
                                            <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM2 2a1 1 0 0 0-1 1v1h14V3a1 1 0 0 0-1-1H2zm13 3H1v9a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V5z"/>
                                            <path d="M11 7.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-2 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z"/>
                                        </svg>
                                        <?php echo date('M d', strtotime($item->created_time)); ?>
                                    </span>
                                </h4>
                                <p><?php echo $item->summary?></p>
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
                            <h4 class="heading">
                                <a href="<?php echo $link;?>" title="<?php echo $title ?>"><?php echo $item->title?></a>
                                <span class="date">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-calendar4-week" viewBox="0 0 16 16">
                                        <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM2 2a1 1 0 0 0-1 1v1h14V3a1 1 0 0 0-1-1H2zm13 3H1v9a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V5z"/>
                                        <path d="M11 7.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-2 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z"/>
                                    </svg>
                                    <?php echo date('M d', strtotime($item->created_time)); ?>
                                </span>
                            </h4>
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