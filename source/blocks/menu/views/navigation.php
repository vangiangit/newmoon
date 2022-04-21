<?php
global $tmpl, $user; 
if(!$list) 
    return;
?>
<ul>
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
        echo '<li class="menu-'.$item->id.' '.$item->selected.'"><a class="title" href="'.$link.'" title="'.htmlspecialchars($item->name).'"><i><img src="'.URL_ROOT.$item->image.'" alt="'.$item->name.'" /></i><span>'.$item->name.'</span></a>';  
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
    <li style="width: 150px;">
        <div class="title user">
            <i><img src="/templates/default/images/nav-icon-user.png" alt="user" /></i>
            <?php if($user->userID){?>
                <a class="logged name" href="<?php echo FSRoute::_('index.php?module=members&view=members&Itemid=10')?>" title="Trang cá nhân"><span><?php echo $user->userInfo->username; ?></span></a><br />
                <a class="logged level" href="#top"><span>Cấp: <b><?php echo $user->userInfo->level_text; ?></b></span></a>
                <a class="logged level" href="#top"><span>Điểm: <b><?php echo number_format($user->userInfo->point, 0, ',', '.'); ?> Uza</b></span></a>
            <?php }else{ ?>
                <a href="<?php echo FSRoute::_('index.php?module=members&view=members&task=login&Itemid=10')?>" title="Đăng nhập"><span>Đăng nhập</span></a><br />
                <a href="<?php echo FSRoute::_('index.php?module=members&view=members&task=register&Itemid=10')?>" title="Đăng ky"><span>Đăng ky</span></a>
            <?php } ?>
        </div>
        <?php if($user->userID){?>
            <?php
            $tasks = array(
                'display' => 'Thông tin tài khoản',
                'changepass' => 'Đổi mật khẩu',
                'history_converted' => 'Lịch sử quà tặng',
                'history_points' => 'Lịch sử điểm',
                'logout' => 'Thoát'
            );
            ?>
            <ul>
            <?php foreach($tasks as $key=>$val){?>
                <li><a href="<?php echo FSRoute::_('index.php?module=members&view=members&task='.$key.'&Itemid=10')?>" title="<?php echo $val ?>"><?php echo $val ?></a></li>
            <?php } ?>
            </ul>
        <?php } ?>
    </li>
</ul>