<?php
/**
 * @author vangiangfly
 * @category Controller
 */
class NewsControllersNews extends FSControllers{
    function __construct(){
        parent::__construct();    
    }
    
    function display(){
        $data = $this->model->getNews();
        if(!$data)
            setRedirect(URL_ROOT);
        $cat = $this->model->getCategoryById($data->category_id);
        $otherList = $this->model->getOtherNewsList($data->category_id);
        $menus = $this->model->getMenuList($data->id);
        /* Thêm thanh điều hướng */
        global $tmpl;
        $breadcrumbs = array();
		$breadcrumbs[] = array(0=>$cat->name, 1=>FSRoute::_('index.php?module=news&view=cat&id='.$cat->id.'&ccode='.$cat->alias.'&Itemid=2'));
		$tmpl -> assign('breadcrumbs', $breadcrumbs);
        $tmpl->canonical = FSRoute::_('index.php?module=news&view=news&code='.$data->alias.'&id='.$data->id.'&ccode='.$data->category_alias);
        require(PATH_BASE.'modules/' . $this->module . '/views/' . $this->view . '/default.php');
    }
} 