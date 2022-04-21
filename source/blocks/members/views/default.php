<?php 
global $tmpl, $user; 
$tmpl->addScript('default', 'blocks/members/assets/js');
?>
<?php if($user->userID){ ?>
    <?php 
    if($user->userType == 'members'){
        
    ?>
        <div class="member-login">
            <a href="<?php echo FSRoute::_('index.php?module=members&view='.$user->userType.'&Itemid=10')?>">
                <?php if($user->userInfo->fullname == ''){ ?>
                    Trang cá nhân
                <?php }else{ ?>
                    <?php echo $user->userInfo->fullname; ?>
                <?php } ?>
            </a>
            <button id="more"></button>
            <ul class="more-info tabs">
                <?php foreach($user->userTask as $key=>$val) { ?>
                    <a href="<?php echo FSRoute::_('index.php?module=members&view='.$user->userType.'&task='.$key.'&Itemid=10')?>"><li><?php echo $val ?></li></a>
                <?php } ?>
                <i></i>
            </ul>
        </div><!--end: .member-login-->
    <?php }else{ ?>
        <div class="member-login">
            <a href="<?php echo FSRoute::_('index.php?module=members&view='.$user->userType.'&Itemid=10')?>">
                <?php if($user->userInfo->fullname == ''){ ?>
                    Trang cá nhân
                <?php }else{ ?>
                    <?php echo $user->userInfo->fullname; ?>
                <?php } ?>
            </a>
            <button id="more"></button>
            <ul class="more-info tabs">
                <?php foreach($user->userTask as $key=>$val) { ?>
                    <a href="<?php echo FSRoute::_('index.php?module=members&view='.$user->userType.'&task='.$key.'&Itemid=10')?>"><li><?php echo $val ?></li></a>
                <?php } ?>
                <i></i>
            </ul>
        </div>
    <?php } ?>
<?php }else{ ?>
    <div class="user">
        <ul class="clearfix">
            <li><button id="login">Đăng nhập</button></li>
            <li><button id="register">Đăng kí</button></li>
        </ul>
    </div>
    <section class="register clearfix">
        <div class="form-reg">
            <center>Đăng Ký tài khoản</center>
            <form id="frmBRegister" name="frmBRegister" action="<?php echo FSRoute::_('index.php?module=members&view=members&task=do_bregister'); ?>" onsubmit="return validateBRegister();" method="POST" enctype="multipart/form-data">
                <table>
                    <tr>
                        <td><input type="text" name="email" id="breg_email" placeholder="Email của bạn" /></td>
                    </tr>
                    <tr>
                        <td><input type="password" name="password" id="breg_password" placeholder="Nhập mật khẩu" /></td>
                    </tr>
                    <tr>
                        <td><input type="password" name="repassword" id="breg_repassword" placeholder="Nhập lại mật khẩu" /></td>
                    </tr>
                    <tr>
                        <td><input type="text" name="mobile" id="breg_phone" placeholder="Điện thoại liên hệ" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="register-user" value="Đăng ký" /></td>
                    </tr>
                    <tr>
                        <td>Hoặc</td>
                    </tr>
                    <tr>
                        <td>Sử dụng 1 trong các tài khoản</td>
                    </tr>
                    <tr>
                        <td><a href=""><input type="button" name='fb-acc' value="Đăng ký qua facebook" /></a></td>
                    </tr>
                    <tr>
                        <td><a href=""><input type="button" name='ggp-acc' value="Đăng ký qua Google+" /></a></td>
                    </tr>
                </table>
                <input type="hidden" name="module" value="members"/>
            	<input type="hidden" name="task" value="do_bregister"/>
            	<input type="hidden" name="view" value="members"/>
            </form>
            <a href="javascript:void(0)" class="close-reg"></a>
        </div>
    </section><!-- end .register-->
    
    <section class="login clearfix">
        <div class="form-login">
            <center>Đăng nhập tài khoản</center>
            <form id="frmBLogin" action="<?php echo FSRoute::_('index.php?module=members&view=members&task=do_login'); ?>" onsubmit="return validateBLogin();" method="post">
                <table>
                    <tr>
                        <td><input type="text" name="email" id="blog_username" placeholder="Email của bạn" /></td>
                    </tr>
                    <tr>
                        <td><input type="password" name="password" id="blog_password" placeholder="Nhập mật khẩu" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="register-user" value="Đăng nhập" /></td>
                    </tr>
                    <tr>
                        <td><a href="">Quên mật khẩu?</a></td>
                    </tr>
                    <tr>
                        <td>Hoặc</td>
                    </tr>
                    <tr>
                        <td>Sử dụng 1 trong các tài khoản</td>
                    </tr>
                    <tr>
                        <td><a href=""><input type="button" name='fb-acc' value="Đăng nhập với facebook" /></a></td>
                    </tr>
                    <tr>
                        <td><a href=""><input type="button" name='ggp-acc' value="Đăng nhập với Google+" /></a></td>
                    </tr>
                </table>
                <input type="hidden" name="module" value="members"/>
            	<input type="hidden" name="task" value="do_login"/>
            	<input type="hidden" name="view" value="members"/>
                <input type="hidden" name="redirect" value="<?php echo FSInput::get('redirect', ''); ?>" />
            </form>
            <a href="javascript:void(0)" class="close-login"></a>
        </div>
    </section><!--end: .login-->
<?php } ?>