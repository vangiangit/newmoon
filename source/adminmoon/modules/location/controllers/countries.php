<?php
	class LocationControllersCountries extends Controllers
	{
		function __construct()
		{
			$this->view = 'countries' ; 
			parent::__construct(); 
		}
		function display()
		{
			parent::display();
			$sort_field = $this -> sort_field;
			$sort_direct = $this -> sort_direct;
			
			$list = $this -> model->get_data();
			$pagination = $this -> model->getPagination();
			include 'modules/'.$this->module.'/views/'.$this->view.'/list.php';
		}
	}
	
?>