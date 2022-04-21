<?php
/**
 * @author vangiangfly
 * @category Controller
 */ 
class AlbumControllersHome extends FSControllers{
    function __construct(){
        parent::__construct();
    }

    function display(){
        $total = $this->model->getTotal();
        $pagination = $this->model->getPagination($total);
        $list = $this->model->getList();
        global $tmpl;
        /* Thêm thanh điều hướng */
        $breadcrumbs = array();
		$breadcrumbs[] = array(0=>FSText::_('Album ảnh'), 1=>FSRoute::_('index.php?module=album&view=home&Itemid=7'));
		$tmpl -> assign('breadcrumbs', $breadcrumbs);
        require(PATH_BASE.'modules/'.$this->module.'/views/'.$this->view.'/default.php');
    }
}