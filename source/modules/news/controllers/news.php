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
        $htmlMenus = $this->menu($menus);
        /* Thêm thanh điều hướng */
        global $tmpl;
        $breadcrumbs = array();
		$breadcrumbs[] = array(0=>$cat->name, 1=>FSRoute::_('index.php?module=news&view=cat&id='.$cat->id.'&ccode='.$cat->alias.'&Itemid=2'));
		$tmpl -> assign('breadcrumbs', $breadcrumbs);
        $tmpl->canonical = FSRoute::_('index.php?module=news&view=news&code='.$data->alias.'&id='.$data->id.'&ccode='.$data->category_alias);
        require(PATH_BASE.'modules/' . $this->module . '/views/' . $this->view . '/default.php');
    }

    public function menu($menus, $parent_id = 0){
        $html = '<ul>';
        foreach($menus as $key=>$menu){
            if($menu->parent_id == $parent_id){
                $html .= '
                <li>
                    <div onclick="goSetIdTop(\''.$menu->link.'\')" data-id="'.$menu->link.'" class="d-flex">
                        '.($parent_id==0?'<span class="textNumber">'.$menu->ordering.'. </span>':'<img src="/templates/default/images/iconSendLight.svg" />').'
                        <span class="ml-2">'.$menu->name.'</span>
                    </div>
                ';
                unset($menus[$key]);
                $html .= $this->menu($menus, $menu->id);
                $html .= '</li>';
            }
        }
        $html .= '</ul>';
        return $html;
    }
} 