<?php
/**
 * @author vangiangfly
 * @category Controller
 */ 
class NewsControllersHome extends FSControllers{
    function __construct(){
        parent::__construct();
    }

    function display(){
        $total = $this->model->getTotal();
        $pagination = $this->model->getPagination($total);
        $listNews = $this->model->getNewsList();
        $listCats = $this->model->getListCats();
        global $tmpl;
        /* Thêm thanh điều hướng */
        $breadcrumbs = array();
		$breadcrumbs[] = array(0=>FSText::_('Tin tức'), 1=>FSRoute::_('index.php?module=news&view=home&Itemid=7'));
		$tmpl -> assign('breadcrumbs', $breadcrumbs);
        require(PATH_BASE.'modules/'.$this->module.'/views/'.$this->view.'/default.php');
    }
}