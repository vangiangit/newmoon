<?php
global $config; 
global $tmpl;
$tmpl -> addScript('contact','modules/contact/assets/js');
$tmpl -> addStylesheet('contact','modules/contact/assets/css');
$tmpl -> addTitle(FSText::_('Contact us'));
$Itemid = FSInput::get('Itemid', 0);
?>
<div class="container">
    <h1 class="content-title post-title text-uppercase"><?php echo FSText::_('Contact Info')?></h1>
    <div class="row">
        <div class="col-lg-7 contact-form">
            <?php echo $config['contact']?>
            <form id="frm_contact" method="post" action="#" name="contact" onsubmit="return validContact()" >
                <div class="form-group mb-3">
                    <input class="form-control" value="<?php if(isset($_SESSION['contact']['contact_name'])) echo $_SESSION['contact']['contact_name']; ?>" name="contact_name" id="contact_name" placeholder="Fullname*" type="text" />
                </div><!--end: .bound-input-->
                <div class="form-group mb-3">
                    <input class="form-control" value="<?php if(isset($_SESSION['contact']['contact_address'])) echo $_SESSION['contact']['contact_address']; ?>" name="contact_address" id="contact_address" placeholder="Address*" type="text" />
                </div><!--end: .bound-input-->
                <div class="form-group mb-3">
                    <input class="form-control" value="<?php if(isset($_SESSION['contact']['contact_phone'])) echo $_SESSION['contact']['contact_phone']; ?>" name="contact_phone" id="contact_phone" placeholder="Phone*" type="text" />
                </div><!--end: .bound-input-->
                <div class="form-group mb-3">
                    <input class="form-control" value="<?php if(isset($_SESSION['contact']['contact_email'])) echo $_SESSION['contact']['contact_email']; ?>" name="contact_email" id="contact_email" placeholder="EMAIL*" type="text" />
                </div><!--end: .bound-input-->
                <div class="form-group mb-3">
                    <textarea class="form-control" name='message' id='message' placeholder="NỘI DUNG*"><?php if(isset($_SESSION['contact']['message'])) echo $_SESSION['contact']['message']; ?></textarea>
                </div><!--end: .bound-input-->
                <div class="group-button text-center">
                    <a style="text-decoration: none;" class="btn-submit" href="javascript:void(0);" onclick="validContact();" title="Send">Send</a>
                </div><!--end: .bound-input-->
                <input type="hidden" name="module" value="contact"/>
                <input type="hidden" name="task" value="save"/>
                <input type="hidden" name="view" value="contact"/>
                <input type="hidden" name="Itemid" value="<?php echo $Itemid; ?>"/>
            </form>
        </div>
        <div class="col-lg-5 contact-info">
            <?php echo $config['contact_map']?>
        </div>
    </div>
</div><!-- /.container-->