<?php
/**
 * @author vangiangfly
 * @category Controller
 */ 
class NewsControllersCat extends FSControllers{
    function __construct(){
        parent::__construct();
    }
    
    function display(){
        $page = FSInput::get('page', 1);
        $cat = $this->model->getCategory(); 
        if(!$cat){
            echo 'Danh mục này không tồn tại';
            return;   
        }
        $total = $this->model->getTotal($cat->id); 
		$pagination = $this->model->getPagination($total); 
        $listNews = $this->model->getNewsList($cat->id);
        $listCats = $this->model->getListCats();
        /* Thêm thanh điều hướng */
        global $tmpl;
        $breadcrumbs = array();
		$breadcrumbs[] = array(0=>$cat->name, 1 =>FSRoute::_('index.php?module=news&view=cat&id='.$cat->id.'&ccode='.$cat->alias));
		$tmpl -> assign('breadcrumbs', $breadcrumbs);
        require(PATH_BASE.'modules/'.$this->module.'/views/'.$this->view.'/default.php');
    }
}