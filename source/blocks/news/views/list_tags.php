<?php 
global $tmpl, $config;
$Itemid = 5;
$tags = explode(',', $config['tags']);
?>
<div id="block-<?php echo $blockId?>" class="block-news block-news-list block-news-list2 block-news-<?php echo $style ?>" style="<?php echo $cssText?>">
    <div class="container">
        <div class="block-heading">
            <a href="<?php echo $bLink ?>"><?php echo $title; ?></a>
        </div><!-- /.block-heading-->
        <div class="block-content">
            <div class="row list-news">
                <div class="col-lg-6">
                <?php $i = 0;
                foreach($list as $item){
                    $i++;?>
                    <div class="mb-4">
                        <?php $tmpl->list_item($item, 'small'); ?>
                    </div>
                <?php }?>
                </div>
                <div class="col-lg-6">
                    <div class="txtTrending">
                        Trending Search
                    </div>
                    <div class="listTag d-flex">
                        <?php 
                        $tags = explode(',', $config['tags']);
                        foreach($tags as $tag){ ?>
                            <a href="/tag/<?php echo trim($tag) ?>">
                                <div class="hashTag">
                                    <div><?php echo trim($tag) ?></div>
                                </div>
                            </a>
                        <?php } ?>
                    </div>
                </div>
            </div><!-- /.row-->
        </div><!-- /.block-content-->
    </div>
</div><!-- #block-<?php echo $blockId?>-->