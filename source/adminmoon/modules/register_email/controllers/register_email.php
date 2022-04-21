<?php
class Register_emailControllersRegister_email extends Controllers
{
	function __construct()
	{
		$this->view = 'register_email' ; 
		parent::__construct(); 
	}
	function display()
	{
		parent::display();
		$sort_field = $this -> sort_field;
		$sort_direct = $this -> sort_direct;
		
		$list = $this->model->get_data();
		$pagination = $this->model->getPagination();
        
		include 'modules/'.$this->module.'/views/'.$this->view.'/list.php';
	}
	function add()
	{
		$maxOrdering = $this->model->getMaxOrdering();
		
		include 'modules/'.$this->module.'/views/'.$this -> view.'/detail.php';
	}
	
	function edit()
	{
		$ids = FSInput::get('id',array(),'array');
		$id = $ids[0];
		$data = $this->model->get_record_by_id($id);
        
		include 'modules/'.$this->module.'/views/'.$this->view.'/detail.php';
	}
}
?>