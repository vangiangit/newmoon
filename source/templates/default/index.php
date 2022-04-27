<?php
global $tmpl, $config, $user;
$Itemid = FSInput::get('Itemid', 1, 'int');
$tmpl->addStylesheet('style');
$tmpl->addScript('bootstrap.min');
$tmpl->addScript('library');
$tmpl->addScript('slick.min', '', 'top');
?>

<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container">
        <a class="navbar-brand" href="<?php echo URL_ROOT ?>">
            <img src="<?php echo URL_ROOT ?>templates/default/images/logo.png" />
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon">
                <img src="<?php echo URL_ROOT ?>templates/default/images/iconBurgerMenu.svg">
            </span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <?php if ($tmpl->count_block('menu-position')) { ?>
                <?php $tmpl->load_position('menu-position'); ?>
            <?php } ?>
            <div class="d-flex right-button">
                <a class="rb-item" href="javascript:void(0);" onclick="$('.searchMobileWrapper').toggleClass('show')">
                    <img src="<?php echo URL_ROOT ?>templates/default/images/iconSearch.svg" />
                </a>
                <a class="rb-item" href="#">
                    <img src="<?php echo URL_ROOT ?>templates/default/images/iconNewMenu.svg" />
                </a>
            </div>
        </div>
    </div>
    <div class="searchMobileWrapper">
        <div class="container">
            <div class="inputSearchWrapper">
                <?php $link = '/search'; ?>
                <form action="<?php echo $link ?>" onsubmit="return submitSearch();">
                    <input id="keyword" name="keyword" type="text" placeholder="Search" />
                    <input type="hidden" id="link_search" value="<?php echo $link ?>" />
                </form>
            </div>
            <div class="txtTrending">
                Trending Search
            </div>
            <div class="tagWrapper d-flex">
                <?php 
                $tags = explode(',', $config['tags']);
                ?>
                <?php foreach($tags as $tag){ ?>
                    <a href="/tag/<?php echo trim($tag) ?>">
                        <div class="hashTag">
                            <div><?php echo trim($tag) ?></div>
                        </div>
                    </a>
                <?php } ?>
            </div>
        </div>
    </div>
</nav>

<?php if ($tmpl->count_block('header-position')) { ?>
    <?php $tmpl->load_position('header-position'); ?>
<?php } ?>

<?php // if ($Itemid != 1) $tmpl->load_direct_blocks('breadcrumbs'); ?>

<?php echo $main_content ?>

<?php if ($tmpl->count_block('footer-position')) { ?>
    <?php $tmpl->load_position('footer-position'); ?>
<?php } ?>

<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <p>
                    <a class="navbar-brand" href="<?php echo URL_ROOT ?>">
                        <img src="<?php echo URL_ROOT ?>templates/default/images/logo.png" />
                    </a>
                </p>
                <p>
                    <a href="#"><img src="<?php echo URL_ROOT ?>templates/default/images/iconFacebookDark.svg" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="#"><img src="<?php echo URL_ROOT ?>templates/default/images/iconYoutubeDark.svg" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="#"><img src="<?php echo URL_ROOT ?>templates/default/images/iconTwitterDark.svg" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="#"><img src="<?php echo URL_ROOT ?>templates/default/images/iconTelegramDark.svg" /></a>
                </p>
            </div><!-- /.col-lg-4-->
            <div class="col-lg-9">
                <?php if ($tmpl->count_block('menu-footer-position')) { ?>
                    <?php $tmpl->load_position('menu-footer-position'); ?>
                <?php } ?>
            </div>
        </div><!-- /.row-->
    </div><!-- /.container-->
    <div class="footer-rights text-center">
        2022 New Moon. All Rights Reserved
    </div>
</footer>