<?php
global $config; 
global $tmpl;
$tmpl -> addScript('contact','modules/contact/assets/js');
$tmpl -> addStylesheet('contact','modules/contact/assets/css');
$tmpl -> addTitle(FSText::_('Contact us'));
$Itemid = FSInput::get('Itemid', 0);
?>
<div class="container">
    <div style="max-width: 800px; margin: 0 auto;">
        <h1 class="content-title post-title text-uppercase"><?php echo FSText::_('Contact Us')?></h1>
        <p>Hello, please use the form below in order to get in touch with our team.</p>
        <form id="frm_contact" method="post" action="#" name="contact" onsubmit="return validContact()" >
            <div class="row mb-3">
                <div class="col-lg-6">
                    <label>Fullname *</label>
                    <input class="form-control" value="<?php if(isset($_SESSION['contact']['contact_name'])) echo $_SESSION['contact']['contact_name']; ?>" name="contact_name" id="contact_name" placeholder="" type="text" />
                </div>
                <div class="col-lg-6">
                    <label>Telegram Account *</label>
                    <input class="form-control" value="<?php if(isset($_SESSION['contact']['contact_address'])) echo $_SESSION['contact']['contact_address']; ?>" name="contact_address" id="contact_address" placeholder="" type="text" />
                </div>
            </div><!--end: .bound-input-->
            <div class="row mb-3">
                <div class="col-lg-6">
                    <label>Phone*</label>
                    <input class="form-control" value="<?php if(isset($_SESSION['contact']['contact_phone'])) echo $_SESSION['contact']['contact_phone']; ?>" name="contact_phone" id="contact_phone" placeholder="" type="text" />
                </div>
                <div class="col-lg-6">
                    <label>Email*</label>
                    <input class="form-control" value="<?php if(isset($_SESSION['contact']['contact_email'])) echo $_SESSION['contact']['contact_email']; ?>" name="contact_email" id="contact_email" placeholder="" type="text" />
                </div>
            </div><!--end: .bound-input-->
            <div class="form-group mb-3">
                <textarea style="height: 100px;" class="form-control" name='message' id='message' placeholder="NỘI DUNG*"><?php if(isset($_SESSION['contact']['message'])) echo $_SESSION['contact']['message']; ?></textarea>
            </div><!--end: .bound-input-->
            <div class="group-button text-center mb-3">
                <a style="text-decoration: none;" class="btn btn-primary btn-submit" href="javascript:void(0);" onclick="validContact();" title="Send message">Send message</a>
            </div><!--end: .bound-input-->
            <?php echo $config['contact'] ?>
            <input type="hidden" name="module" value="contact"/>
            <input type="hidden" name="task" value="save"/>
            <input type="hidden" name="view" value="contact"/>
            <input type="hidden" name="Itemid" value="<?php echo $Itemid; ?>"/>
        </form>
    </div>
</div><!-- /.container-->