<?php
/**
 * @author vangiangfly
 * @category controller
 */ 
class ContactControllersContact
{
    var $module;
    var $view;
    function __construct()
    {
        $this->module = 'contact';
        $this->view = 'contact';
        include PATH_BASE.'modules/' . $this->module . '/models/' . $this->view . '.php';
    }
    function display()
    {
        $model = new ContactModelsContact();
        $submitbt = FSInput::get('submitbt');
        $msg = '';
        $breadcrumbs = array();
        $breadcrumbs[] = array(0 => FSText::_('Liên hệ'), 1 => '');
        global $tmpl;
        $tmpl->assign('breadcrumbs', $breadcrumbs);
        include PATH_BASE.'modules/' . $this->module . '/views/' . $this->view . '/' .'default.php';
    }
    function save(){
        $_SESSION['contact'] = $_REQUEST;
        if (!$this->check_captcha()){
            
            $this->display();
            echo "<script type='text/javascript'>alert('Bạn nhập sai mã hiển thị'); </script>";
            return;
        }
        $model = new ContactModelsContact();
        $id = $model->save();
        if ($id){
            $link = FSRoute::_("index.php?module=contact&Itemid=14");
            $msg = "Cám ơn bạn đã gửi liên hệ cho chúng tôi";
            setRedirect($link, $msg);
            return;
        } else{
            echo "<script type='text/javascript'>alert('Xin lỗi bạn không thể gửi được cho BQT'); </script>";
            $this->display();
            return;
        }
    }
    function check_captcha()
    {
        $captcha = FSInput::get('txtCaptcha');
        if ($captcha == $_SESSION["security_code"])
        {
            return true;
        } else
        {
        }
        return false;
    }
}
?>