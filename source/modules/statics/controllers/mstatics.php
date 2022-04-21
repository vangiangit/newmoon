<?php
/**
 * @author vangiangfly
 * @category Controller
 */
class StaticsControllersMstatics extends FSControllers{
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
        $otherList = $model->getOtherNewsList($data->category_id);
        preg_match_all('#{quick_order}#is', $data->content, $arrSearch);
        if(isset($arrSearch[0]) && count($arrSearch[0])){
            $total = count($arrSearch[0]);
            $arrReplace = array();
            for($i=0; $i < $total; $i++){
                $arrReplace[] = createOrderForm($i, $data->title);
            }
            for($i=0; $i < $total; $i++){
                $data->content =  preg_replace('#{quick_order}#is', $arrReplace[$i], $data->content, 1);
            }
        }
        /* Thêm thanh điều hướng */
        global $tmpl;
        $breadcrumbs = array();
		$tmpl -> assign('breadcrumbs', $breadcrumbs);
        require(PATH_BASE.'modules/' . $this->module . '/views/statics/mdefault.php');
    }
} 