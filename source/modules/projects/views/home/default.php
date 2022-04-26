<?php
global $tmpl;
$tmpl->addTitle('Learn More About Featured Projects On Selected BlockChains');
$Itemid = 5;
?>

<div class="container container-news">
    <h1 class="block-heading">
        Learn More About Featured Projects On Selected BlockChains
    </h1>
    <div class="block-menu block-menu-cats block-menu-projects">
        <div class="row">
            <?php foreach($listCats as $item){
                $link = FSRoute::_('index.php?module=projects&view=cat&id='.$item->id.'&ccode='.$item->alias.'&Itemid='.$Itemid)
                ?>
                <div class="col-lg-3">
                    <div class="menu-item">
                        <a href="<?php echo $link; ?>">
                            <span><img src="<?php echo URL_ROOT.$item->icon; ?>" /></span>
                            <div><?php echo $item->name ?></div>
                        </a>
                    </div>
                </div>
            <?php } ?>
        </div>
    </div>
    <?php if($pagination) echo $pagination->showPagination(); ?>
    <?php if($tmpl -> count_block('content-position')){?>
        <?php $tmpl -> load_position('content-position');?>
    <?php }?>
</div><!-- /.container-->
