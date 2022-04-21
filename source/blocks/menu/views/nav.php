<?php
global $tmpl;
?>
<ul id="block-<?php echo $blockId ?>" class="<?php echo $class ?>">
    <?php
    $parentId = 0;
    $numChild = 0;
    $count = 0;
    foreach($list as $item){
        if($parentId)
            $count ++;
        if(IS_REWRITE)
            $link = FSRoute::_($item->link);
        else{
            if(strpos($item->link, '?') == FALSE)
                $item->link .= '?';
            else
                $item->link .= '&';
            $link = FSRoute::_($item->link.'Itemid='.$item->id);
        }
        echo '<li class="menu-'.$item->id.' '.$item->selected.' '.($item->children?'has-child':'').' dropdown nav-item"><a class="nav-link" target="'.$item->target.'" href="'.$link.'" title="'.htmlspecialchars($item->name).'">'.$item->name.'</a><span></span>';
        if($item->children){
            $parentId = $item->id;
            $numChild = $item->children;
            echo '<ul class="dropdown-menu sub-menu submenu-'.$item->id.' '.$item->selected.'">';
        }
        if($parentId && $count == $numChild){
            $parentId = 0;
            $count = 0;
            $numChild = 0;
            echo '  </li>';
            echo '</ul>';
            continue;
        }
        echo '</li>';
    }
    ?>
</ul>