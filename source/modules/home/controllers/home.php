<?php
/**
 * @author vangiangfly
 * @copyright 2013
 */
class HomeControllersHome extends FSControllers{
    function __construct(){
        parent::__construct();
    }
    
    function display(){
        
        require(PATH_BASE.'modules/'.$this->module.'/views/default.php');
    }

} 