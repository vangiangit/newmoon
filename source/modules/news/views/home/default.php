<?php
global $tmpl;
$tmpl->addTitle('Tin tức');
$Itemid = 5;
?>
<div class="container">
    <div class="row">
        <div class="col-lg-3">
            <div class="sidebar-menu">
                <div class="sm-heading">
                    <?php echo FSText::_('Tin tức & Sự kiện')?>
                </div><!-- /.sm-heading-->
                <ul>
                    <?php foreach($listCats as $item){ ?>
                        <li><a href="<?php echo FSRoute::_('index.php?module=news&view=cat&id='.$item->id.'&ccode='.$item->alias);?>"><?php echo $item->name; ?></a></li>
                    <?php } ?>
                </ul>
            </div><!-- /.sidebar-menu-->
            <?php if($tmpl -> count_block('aside-position')){?>
                <?php $tmpl -> load_position('aside-position');?>
            <?php }?>
        </div><!-- /.col-lg-3-->
        <div class="col-lg-9">
            <?php if($tmpl -> count_block('content-position')){?>
                <?php $tmpl -> load_position('content-position');?>
            <?php }?>
            <h1 class="content-title"><?php echo FSText::_('Tin tức')?></h1>
            <?php foreach($listNews as $item){?>
                <?php $tmpl->news_item($item, 'tiny');?>
            <?php } ?>
            <?php if($pagination) echo $pagination->showPagination(); ?>
        </div><!-- /.col-lg-9-->
    </div><!-- /.row-->
</div>
