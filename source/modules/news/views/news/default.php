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
$link_creator = FSRoute::_('index.php?module=news&view=home&task=author&id='.$data->creator_id.'&code='.$data->creator.'&Itemid='.$Itemid);
?>
<div class="container container-detail">
    <div class="row">
        <div class="col-lg-5">
            <div class="cd-info">
                <h1 class="cd-title"><?php echo $data->title;?></h1>
                <div class="creator">
                    <div class="align-items-center d-flex">
                        <a href="<?php echo $link_creator ?>" title="<?php echo htmlspecialchars($data->creator_name); ?>">
                            <img onerror="this.src='/images/iconCoinNM.png'" src="<?php echo URL_ROOT.$data->creator_avatar ?>" class="rounded-circle" alt="icon">
                            <?php echo $data->creator_name ?>
                        </a>
                        <div class="aic-dot"></div>
                        <div class="aic-date">
                            <?php echo date('M d', strtotime($data->created_time)); ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-7">
            <div class="cd-thumbnail-wrapper">
                <div class="thumbnail-box">
                    <img src="<?php echo URL_ROOT . $data->image;?>" />
                </div>
            </div>
        </div>
    </div>
    <div class="cd-content">
        <?php if($menus){ ?>
        <div class="colLeft">
            <div class="colLeftSticky">
                <div class="boxColLeft">
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
            </div><!-- /.colLeftSticky-->
        </div><!-- /.colLeft-->
        <?php } ?>
        <div class="colContent <?php if(!$menus) echo 'no-colLeft'; ?>">
            <div class="cd-text-description">
                <?php echo $data->summary; ?>
            </div><!-- /.textDescription-->
            <div class="cd-post-content-wrapper">
                <?php echo $data->content; ?>
            </div><!-- /.postContentWrapper-->
            <?php 
            $tags = explode(',', $data->tags); 
            if($tags){
            ?>

                <div class="listTag d-flex">
                    <?php foreach($tags as $tag){ ?>
                        <a href="/tag/<?php echo trim($tag) ?>">
                            <div class="hashTag">
                                <div><?php echo trim($tag) ?></div>
                            </div>
                        </a>
                    <?php } ?>
                </div>
            <?php } ?>
        </div>
    </div><!-- /#post-detail-->
</div>
<script type="text/javascript">
    $(document).ready(function(){
        var aTop = $(".colContent").offset().top;

        $(window).scroll(function(){
            if($(this).scrollTop() >= aTop){
                $('.colLeft').css({'left': $(".colContent").offset().left+'px', 'position': 'fixed', 'top': '92px'});
            }else{
                $('.colLeft').css({'left': '0', 'position': 'absolute', 'top': '0'});
            }
        });
    });
</script>

<div id="block-<?php echo $data->id?>" class="block-news block-news-grid">
    <div class="container">
        <div class="block-heading">
            Related Posts
        </div>
        <div class="block-content">
            <div class="row list-grid">
                <?php foreach($otherList as $item){?>
                    <div class="col-lg-4">
                        <?php $tmpl->grid_item($item, 'small'); ?>
                    </div>
                <?php }?>
            </div><!-- /.row-->
        </div><!-- /.block-content-->
    </div>
</div><!-- #block-<?php echo $data->id?>-->