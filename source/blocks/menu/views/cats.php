<?php global $tmpl; ?>
<div class="container block-menu block-menu-<?php echo $style.' '.$class; ?>">
    <div class="block-heading">
        <?php echo $title; ?>
    </div>
    <div class="row">
        <?php foreach($list as $item){ 
            if(strpos($item->link, '?') == FALSE) 
                $item->link .= '?';
            else
                $item->link .= '&';
            $link = FSRoute::_($item->link.'Itemid='.$item->id);
            ?>
            <div class="col-lg-2">
                <div class="menu-item">
                    <a href="<?php echo $link; ?>">
                        <img src="<?php echo URL_ROOT.$item->image; ?>" />
                        <div><?php echo $item->name ?></div>
                    </a>
                </div>
            </div>
        <?php } ?>
    </div>
</div>