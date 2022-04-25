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
        global $tmpl;
        /* Thêm thanh điều hướng */
        $breadcrumbs = array();
		$breadcrumbs[] = array(0=>FSText::_('News'), 1=>FSRoute::_('index.php?module=news&view=home&Itemid=7'));
		$tmpl -> assign('breadcrumbs', $breadcrumbs);
        require(PATH_BASE.'modules/'.$this->module.'/views/'.$this->view.'/default.php');
    }

    public function author()
    {
        $author = $this->model->getAuthor();
        if(!$author){
            echo 'Mục này không tồn tại';
            return;   
        }
        $total = $this->model->getTotal();
        $pagination = $this->model->getPagination($total);
        $listNews = $this->model->getNewsList();
        global $tmpl;
        /* Thêm thanh điều hướng */
        $breadcrumbs = array();
		$breadcrumbs[] = array(0=>FSText::_('News'), 1=>FSRoute::_('index.php?module=news&view=home&Itemid=7'));
		$tmpl -> assign('breadcrumbs', $breadcrumbs);
        require(PATH_BASE.'modules/'.$this->module.'/views/'.$this->view.'/author.php');
    }

    public function tag()
    {
        $total = $this->model->getTotal();
        $pagination = $this->model->getPagination($total);
        $listNews = $this->model->getNewsList();
        $keyword = FSInput::get('keyword');
        global $tmpl;
        /* Thêm thanh điều hướng */
        $breadcrumbs = array();
		$breadcrumbs[] = array(0=>FSText::_('News'), 1=>FSRoute::_('index.php?module=news&view=home&Itemid=7'));
		$tmpl -> assign('breadcrumbs', $breadcrumbs);
        require(PATH_BASE.'modules/'.$this->module.'/views/'.$this->view.'/tag.php');
    }
}