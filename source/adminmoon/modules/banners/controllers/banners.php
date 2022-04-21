<?php
	class BannersControllersBanners  extends Controllers
	{
		function __construct()
		{
			$array_type = array(1 => 'Image', 3 => 'HTML');
			$this -> array_type = $array_type;
			$this->view = 'banners' ; 
			parent::__construct(); 
		}
		function display()
		{
			parent::display();
			$sort_field = $this -> sort_field;
			$sort_direct = $this -> sort_direct;
			
			$model  = $this -> model;
			$list = $model->get_data();
			
			$categories = $model -> get_all_record('fs_banners_categories');
			$pagination = $model->getPagination();
			include 'modules/'.$this->module.'/views/'.$this->view.'/list.php';
		}
		function add()
		{
			$model = $this -> model;
			$categories = $model -> get_all_record('fs_banners_categories');
			$maxOrdering = $model->getMaxOrdering();
			$array_type = $this -> array_type;
            $menus = $this->model->getMenus();
			$catProducts = false;
			include 'modules/'.$this->module.'/views/'.$this -> view.'/detail.php';
		}
		
		function edit()
		{
			$ids = FSInput::get('id',array(),'array');
			$id = $ids[0];
			$model = $this -> model;
			$categories = $model -> get_all_record('fs_banners_categories');
			$data = $model->get_record_by_id($id);
			$array_type = $this -> array_type;
            $menus = $this->model->getMenus(); 
            $catProducts = false;
			include 'modules/'.$this->module.'/views/'.$this->view.'/detail.php';
		}
	}
	
?>