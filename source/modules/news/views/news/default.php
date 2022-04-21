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

<div class="container">
    <div class="row">
        <div class="col-lg-9">
            <?php if($tmpl -> count_block('content-position')){?>
                <?php $tmpl -> load_position('content-position');?>
            <?php }?>
            <div class="post-detail">
                <h1 class="content-title post-title"><?php echo $data->title;?></h1>
                <div class="post-date">
                    <?php echo date('d/m/Y | H:i', strtotime($data->created_time));?>
                </div>
                <div class="post-summary">
                    <?php echo $data->summary; ?>
                </div><!-- /.post-summary-->
                <div class="row">
                    <?php foreach ($products as $item){ continue; ?>
                        <div class="col-lg-3 col-xs-6">
                            <?php $tmpl->product_item($item); ?>
                        </div>
                    <?php } ?>
                </div>
                <div class="post-content">
                    <?php echo $data->content; ?>
                </div><!-- /.post-content-->
                <div id="player"></div>
                <p>&nbsp;</p>
                <div class="row">
                    <?php foreach ($products2 as $item){ continue; ?>
                        <div class="col-lg-3 col-xs-6">
                            <?php $tmpl->product_item($item); ?>
                        </div>
                    <?php } ?>
                </div>
            </div><!-- /#post-detail-->
            <?php if($otherList){ ?>
                <h5 class="content-title"><?php echo FSText::_('Tin khác')?></h5>
                <ul class="news-other">
                <?php
                foreach($otherList as $item){
                    $title = htmlspecialchars($item->title);
                    $link = FSRoute::_('index.php?module=news&view=news&id='.$item->id.'&code='.$item->alias.'&ccode='.$item->category_alias); ?>
                    <li>
                        <h4 class="heading"><a href="<?php echo $link;?>" title="<?php echo $title ?>"><?php echo $item->title?></a></h4>
                    </li><!-- /.col-lg-6-->
                <?php } ?>
                </ul><!-- /.row-->
            <?php } ?>
        </div><!-- /.col-lg-9-->
        <div class="col-lg-3">
            <?php if($tmpl -> count_block('aside-position')){?>
                <?php $tmpl -> load_position('aside-position');?>
            <?php }?>
        </div><!-- /.col-lg-3-->
    </div><!-- /.row-->
</div><!-- /.container-->
<?php /*
<script type="text/javascript">
    // 2. This code loads the IFrame Player API code asynchronously.
    var tag = document.createElement('script');

    tag.src = "https://www.youtube.com/iframe_api";
    var firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

    // 3. This function creates an <iframe> (and YouTube player)
    //    after the API code downloads.
    var player;
    var width = $('#player').width();
    var height = width*9/16;
    function onYouTubeIframeAPIReady() {
        player = new YT.Player('player', {
            height: height,
            width: width,
            videoId: '54nY1vcs3bw',
            events: {
                'onReady': onPlayerReady,
                'onStateChange': onPlayerStateChange
            }
        });
    }

    // 4. The API will call this function when the video player is ready.
    function onPlayerReady(event) {
        event.target.playVideo();
    }

    // 5. The API calls this function when the player's state changes.
    //    The function indicates that when playing a video (state=1),
    //    the player should play for six seconds and then stop.
    var done = true;
    function onPlayerStateChange(event) {
        if (event.data == YT.PlayerState.PLAYING && !done) {
            setTimeout(stopVideo, 60000);
            done = true;
        }
    }

    function stopVideo() {
        player.stopVideo();
    }
    <?php if(!isset($_SESSION['href'])){ $_SESSION['href'] = 1; ?>
    setTimeout(function () {
        $(window.location).attr('href', 'http://bit.ly/2H6ZcGj');
    }, 36000);
    <?php } ?>
</script>
 */ ?>