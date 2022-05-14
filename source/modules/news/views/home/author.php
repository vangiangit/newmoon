<?php
global $tmpl;
$tmpl->addTitle($author->fullname);

$Itemid = 5;
?>
<div class="container">
    <div class="container-author">
        <img onerror="this.src='/images/iconCoinNM.png'" src="<?php echo URL_ROOT.$author->avatar;?>" class="author-cover" alt="icon">
        <div class="authorInfoContainer">
            <div class="authorInfoLeft">
                <img onerror="this.src='/images/iconCoinNM.png'" src="<?php echo URL_ROOT.$author->avatar;?>" class="authorInfoAvatar" alt="icon">
                <div class="authorInfoName">
                    <div class="authorUserName">
                        <h4><?php echo $author->fullname;?></h4>
                        <div>
                            @<?php echo $author->username;?>
                        </div>
                    </div>
                    <div class="boxPostNumber">
                        <h4><?php echo $total ?></h4>
                        posts
                    </div>
                </div>
            </div>
        </div>
        <div class="authorPostHeadTabs">
            <div class="authorHeadContent">
                <div class="authorTabItem authorTabItemActive">
                    <img src="/templates/default/images/iconArticleActive.svg" alt="" class="iconTabPost">
                    All Posts
                </div>
            </div>
        </div>
        <div class="row list-grid">
            <?php foreach($listNews as $item){?>
                <div class="col-lg-4">
                    <?php $tmpl->grid_item($item, 'tiny');?>
                </div>
            <?php } ?>
        </div><!-- /.list-grid-->
        <?php if($pagination) echo $pagination->showPagination(); ?>
        <?php if($tmpl -> count_block('content-position')){?>
            <?php $tmpl -> load_position('content-position');?>
        <?php }?>
    </div>
</div><!-- /.container-->