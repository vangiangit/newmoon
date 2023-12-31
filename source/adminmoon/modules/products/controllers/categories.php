<?php
	// models 

		  
	class ProductsControllersCategories extends Controllers
	{
		function __construct()
		{
			$this->view = 'categories' ; 
			parent::__construct(); 
		}
		function display()
		{
			parent::display();
			$sort_field = $this -> sort_field;
			$sort_direct = $this -> sort_direct;
			
			$model  = $this -> model;
			$list = $this -> model->get_categories_tree();
			$pagination = $model->getPagination();
			include 'modules/'.$this->module.'/views/'.$this->view.'/list.php';
		}
		function add()
		{
			$model =  $this -> model;
			$categories = $model->get_categories_tree_all();
			$maxOrdering = $model->getMaxOrdering();
			include 'modules/'.$this->module.'/views/'.$this->view.'/detail.php';
		}
		function edit()
		{
			$model =  $this -> model;
			$ids = FSInput::get('id',array(),'array');
			$id = $ids[0];
			$data = $model->get_record_by_id($id);
			$categories = $model->get_categories_tree_all();
			include 'modules/'.$this->module.'/views/'.$this->view.'/detail.php';
		}
		/*
		 * create link edit table name
		 */
		function link_edit_tablename($table_name){
			$link = 'index.php?module='.$this -> module.'&view=tables&task=edit&tablename='.$table_name;
			return '<a href="'.$link.'" title="Sửa bảng" >'.$table_name.'</a>';
		}
	}
	
?>