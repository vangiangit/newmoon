<?php
/**
 * @author vangiangfly
 * @category Controller
 */
class AlbumControllersAlbum extends FSControllers{
    function __construct(){
        parent::__construct();    
    }
    
    function display(){
        $data = $this->model->getData();
        if(!$data)
            setRedirect(URL_ROOT);
        $listImages = $this->model->getListOtherImages($data->id);
        /* Thêm thanh điều hướng */
        global $tmpl;
        $breadcrumbs = array();
        $breadcrumbs[] = array(0=>FSText::_('Album ảnh'), 1=>'');
		$tmpl -> assign('breadcrumbs', $breadcrumbs);
        $tmpl->canonical = FSRoute::_('index.php?module=album&view=album&code='.$data->alias.'&id='.$data->id.'&ccode='.$data->category_alias);
        require(PATH_BASE.'modules/' . $this->module . '/views/' . $this->view . '/default.php');
    }
} 