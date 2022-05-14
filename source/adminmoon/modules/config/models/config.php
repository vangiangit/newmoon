<?php 
	class ConfigModelsConfig   extends FSModels
	{

		function __construct()
		{
			parent::__construct();
		}
		
		function getData()
		{
			global $db;
			$query = $this->setQuery();
			if(!$query)
				return array();
				
			$sql = $db->query($query);
			$result = $db->getObjectList();
			
			return $result;
		}
		function setQuery()
		{
			$query = " SELECT *
						  FROM 
						  	fs_config
						  WHERE published = 1 ".' AND lang = \''.$_SESSION['adlang'].'\''."
						  ORDER BY ordering
						 ";
						
			return $query;
		}
		
		/*
		 * 
		 * Save
		 */
		function save()
		{
		    // var_dump($_FILES);die;
			$data = $this->getData();
			global $db;
			foreach($data as $item)
			{
                if($item->name == 'license')
                    continue;
				if($item->data_type == 'editor')
					$value = htmlspecialchars_decode(FSInput::get("$item->name"));
				else if($item->data_type == 'image'){
                    if(isset($_FILES[$item->name]['name']) && !empty($_FILES[$item->name]['name'])){
                        $fsFile = FSFactory::getClass('FsFiles');
                        $path = PATH_BASE.'images'.DS.'config'.DS;
                        $image = $fsFile -> uploadImage($item->name, $path, 2000000, $item->name.'_'.time());
                        if(!$image)
                            continue;
                        $value = 'images/config/'.$image;
                    }else{
                        continue;
                    }
                } else
                    $value = FSInput::get("$item->name");
				
				$sql = " UPDATE fs_config SET 
						value = '$value'
						WHERE name = '$item->name' ";
				$db->query($sql);
				$rows = $db->affected_rows();
			}
			return true;
			
		}
		
		
	}
	
?>