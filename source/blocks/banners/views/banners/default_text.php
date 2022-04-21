<?php
global $tmpl;
?>
<div id="block-<?php echo $blockId; ?>" class="block-banner block-banner-<?php echo $style ?>" style="<?php echo $cssText?>">
    <?php foreach($list as $item){?>
        <div id="banner-<?php echo $item->id; ?>" class="item">
            <?php if($item -> type == 1){?>
                <?php if($item -> image){?>
                    <a target="<?php echo $item -> target;?>" rel="nofollow" href="<?php echo $item -> link;?>" title='<?php echo $item -> name;?>'>
                        <?php if($item -> width && $item -> height){?>
                            <img class="img-responsive" alt="<?php echo $item -> name; ?>" src="<?php echo URL_ROOT.$item -> image;?>" width="<?php echo $item -> width;?>" height="<?php echo $item -> height;?>">
                        <?php } else { ?>
                            <img class="img-responsive" alt="<?php echo $item -> name; ?>" src="<?php echo URL_ROOT.$item -> image;?>"/>
                        <?php }?>
                    </a>
                <?php }?>
            <?php } else if($item -> type == 2){?>
                <?php
                if($item->video){
                    parse_str(parse_url($item->video, PHP_URL_QUERY), $youtube_key);
                    $youtube_key = $youtube_key['v'];
                    ?>
                    <a target="<?php echo $item -> target;?>" class="banner-video" youtube-id="<?php echo $youtube_key ?>" href="javascript:void(0);">
                        <img class="img-responsive" src="<?php echo URL_ROOT.$item -> image;?>" alt="<?php echo htmlspecialchars($item -> name)?>">
                    </a>
                <?php }?>
            <?php }?>
            <div class="item-content">
                <div class="container">
                    <?php echo $item -> content; ?>
                </div>
            </div>
        </div>
    <?php }?>
</div><!--end: #block-<?php echo $blockId; ?>-->