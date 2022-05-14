<?php
global $tmpl;
$seo_title = $data -> seo_title ? $data -> seo_title : $data -> title;
$seo_keyword = $data -> seo_keyword ? $data -> seo_keyword : $seo_title;
$seo_description = $data -> seo_description ? $data -> seo_description : $data -> summary;
$tmpl->addTitle($seo_title);
$tmpl->addMetakey($seo_keyword);
$tmpl->addMetades($seo_description);
$Itemid = 5;		
$tmpl->setMeta('og:image', URL_ROOT.str_replace('/original/','/og-image/', $data->image));
?>
<div class="contentWrapperNormal">
    <div class="minHeight">
        <main>
            <div class="contentWrapper row">
                <div class="colLeft col">
                    <div class="colLeftSticky">
                        <?php if($menus){ ?>
                            <div class="boxColLeft mb-4">
                                <div class="boxColLeftWrap" style="padding: 20px 12px;">
                                <ul>
                                        <?php $i=0;
                                        foreach($menus as $item){ 
                                            $i++;?>
                                            <li onclick="goSetIdTop('<?php echo $item->link ?>')" data-id="<?php echo $item->link ?>">
                                                <div class="d-flex">
                                                    <span class="textNumber"><?php echo $i ?>.</span> 
                                                    <span class="ml-2"><?php echo $item->name ?></span>
                                                </div>
                                            </li>
                                        <?php } ?>
                                    </ul>
                                </div>
                            </div><!-- /.boxColLeft-->
                        <?php } ?>
                        <?php 
                        if($data->tags){
                            $tags = explode(',', $data->tags); 
                        ?>
                            <div class="boxColLeft">
                                <div class="boxColLeftWrap">
                                    <div class="block-heading">
                                        <span>Keyword</span>
                                    </div>
                                    <div class="listTag d-flex">
                                        <?php foreach($tags as $tag){ ?>
                                            <a href="/tag/<?php echo trim($tag) ?>">
                                                <div class="hashTag">
                                                    <div><?php echo trim($tag) ?></div>
                                                </div>
                                            </a>
                                        <?php } ?>
                                    </div>
                                </div>
                            </div><!-- /.boxColLeft-->
                        <?php } ?>
                    </div><!-- /.colLeftSticky-->
                </div><!-- /.colLeft-->
                <div class="colCenter col">
                    <div class="postContent">
                        <h1 class="post-title pd50"><?php echo $data->title;?></h1>
                        <div class="infoWrapper pd50">

                        </div>
                        <div class="thumbnailWrapper pd50">
                            <div class="thumbnailBox">
                                <img src="<?php echo URL_ROOT . $data->image;?>" />
                            </div>
                        </div>
                        <div class="textDescription pd50">
                            <?php echo $data->summary; ?>
                        </div><!-- /.textDescription-->
                        <div class="postContentWrapper pd50">
                            <?php echo $data->content; ?>
                        </div><!-- /.postContentWrapper-->
                    </div><!-- /#post-detail-->
                </div><!-- /.colCenter-->
                <div class="colRight col">
                    <div class="colRightSticky">
                        <div id="block-<?php echo $data->id?>" class="block-news block-news-related">
                            <div class="blurWrapper"></div>
                            <div class="block-heading">
                                Related Posts
                            </div>
                            <div class="block-content">
                                <?php foreach($otherList as $item){
                                    $tmpl->news_tiny($item, 'tiny');
                                }?>
                            </div><!-- /.block-content-->
                        </div><!-- #block-<?php echo $data->id?>-->
                        <?php if($tmpl -> count_block('aside-position')){?>
                            <?php $tmpl -> load_position('aside-position');?>
                        <?php }?>
                    </div>
                </div><!-- /.colRight-->
            </div><!-- /.contentWrapper-->
        </main>
    </div><!-- /.minHeight-->
</div><!-- /.contentWrapperNormal-->