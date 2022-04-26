<?php
/**
 * @author vangiangfly
 * @category Controller
 */ 
class ProjectsControllersHome extends FSControllers{
    function __construct(){
        parent::__construct();
    }

    function display(){
        $listCats = $this->model->getListCats();
        global $tmpl;
        /* Thêm thanh điều hướng */
        $breadcrumbs = array();
		$breadcrumbs[] = array(0=>FSText::_('News'), 1=>FSRoute::_('index.php?module=news&view=home&Itemid=7'));
		$tmpl -> assign('breadcrumbs', $breadcrumbs);
        require(PATH_BASE.'modules/'.$this->module.'/views/'.$this->view.'/default.php');
    }
}