<?php
/**
 * @author vangiangfly
 * @category Controller
 */
class StaticsControllersStatics extends FSControllers{
    function __construct()
    {
        parent::__construct();    
    }
    
    function display()
    {
        $model = $this->model;
        $data = $model->getNews();
        if(!$data)
            die('Không tồn tại bài viết này');
        $cat = $model->getCategoryById($data->category_id);
        /* Thêm thanh điều hướng */
        global $tmpl;
        $breadcrumbs = array();
        $breadcrumbs[] = array(0=>$data->title, 1=>'');
		$tmpl -> assign('breadcrumbs', $breadcrumbs);
        require(PATH_BASE.'modules/' . $this->module . '/views/' . $this->view . '/default.php');
    }
} 