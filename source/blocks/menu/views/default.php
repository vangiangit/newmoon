<?php global $tmpl; ?>
<ul id="block-<?php echo $blockId ?>" class="block-menu block-menu-<?php echo $style.' '.$class; ?>">
    <?php 
    $parentId = 0;
    $numChild = 0;
    $count = 0;
    foreach($list as $item){
        if($parentId)
            $count ++;
        if(strpos($item->link, '?') == FALSE) 
            $item->link .= '?';
        else
            $item->link .= '&';
        $link = FSRoute::_($item->link.'Itemid='.$item->id);
        echo '<li class="menu-'.$item->id.' '.$item->selected.'"><a href="'.$link.'" title="'.htmlspecialchars($item->name).'">'.$item->name.'</a>';  
        if($item->children){
            $parentId = $item->id;
            $numChild = $item->children;
            echo '<ul class="submenu-'.$item->id.' '.$item->selected.'">';
        }
        if($parentId && $count==$numChild){
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