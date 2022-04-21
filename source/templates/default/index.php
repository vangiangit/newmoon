<?php
global $tmpl, $config, $user;
$Itemid = FSInput::get('Itemid', 1, 'int');
$tmpl->addStylesheet('style');
$tmpl->addScript('bootstrap.min');
$tmpl->addScript('library');
?>

<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container">
        <a class="navbar-brand" href="<?php echo URL_ROOT ?>">
            <img src="<?php echo URL_ROOT ?>templates/default/images/logo.svg" />
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <?php if ($tmpl->count_block('menu-position')) { ?>
                <?php $tmpl->load_position('menu-position'); ?>
            <?php } ?>
        </div>
    </div>
</nav>

<?php if ($tmpl->count_block('header-position')) { ?>
    <?php $tmpl->load_position('header-position'); ?>
<?php } ?>

<?php if ($Itemid != 1) $tmpl->load_direct_blocks('breadcrumbs'); ?>

<?php echo $main_content ?>

<?php if ($tmpl->count_block('footer-position')) { ?>
    <?php $tmpl->load_position('footer-position'); ?>
<?php } ?>

<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-7">
                <p class="heading">Cuchay.vn - Chia sẻ kinh ngiệm hay trong cuộc sống</p>
                <p>Lưu ý: Các thông tin trên Cuchay.vn chỉ mang tính chất tham khảo. Chúng tôi tuyệt đối không chịu bất cứ trách nhiệm nào do việc tự ý áp dụng các thông tin trên Cuchay.vn gây ra.</p>
                <p><span class="icon email">Email: <a href="mailto:info@cuchay.vn">info@cuchay.vn</a></span></p>
            </div><!-- /.col-lg-7-->
            <div class="col-lg-5 text-right">
                <p class="heading"><?php echo FSText::_('Theo chúng tôi') ?></p>
                <p class="social">
                    <a class="facebook" rel="nofollow" href="<?php echo $config['link_facebook'] ?>"></a>
                    <a class="twitter" rel="nofollow" href="<?php echo $config['link_twitter'] ?>"></a>
                    <a class="youtube" rel="nofollow" href="<?php echo $config['link_youtube'] ?>"></a>
                </p>
            </div>
        </div><!-- /.row-->
    </div><!-- /.container-->
</footer>