<?php 
	class ProductsModelsProducts extends FSModels{
		var $limit;
		var $prefix ;
		function __construct(){
			parent::__construct();
			$this -> limit = 20;
			$this -> view = 'products';
			$this -> type = 'products';
			$this -> table_name = 'fs_products';
			$this -> table_category = 'fs_'.$this -> type.'_categories';
			$this -> arr_img_paths = array(array('tiny', 395, 475, 'resize_image_fix'));
			$this -> arr_img_paths_other = array(array('tiny', 395, 475, 'resize_image_fix'));
			$cyear = date('Y');
			$cmonth = date('m');
			$cday = date('d');
			$this -> img_folder = 'images/'.$this -> type.'/'.$cyear.'/'.$cmonth.'/'.$cday;
			$this -> check_alias = 1;
			$this -> field_img = 'image';
		}

		function setQuery(){
			$ordering = "";
			$where = SQL_FILTER_BY_ADLANG;
			if(isset($_SESSION[$this -> prefix.'sort_field']))
			{
				$sort_field = $_SESSION[$this -> prefix.'sort_field'];
				$sort_direct = $_SESSION[$this -> prefix.'sort_direct'];
				$sort_direct = $sort_direct?$sort_direct:'asc';
				$ordering = '';
				if($sort_field)
					$ordering .= " ORDER BY $sort_field $sort_direct, id DESC ";
			}
			if(isset($_SESSION[$this -> prefix.'filter0'])){
				$filter = $_SESSION[$this -> prefix.'filter0'];
				if($filter){
					$where .= ' AND a.category_id_wrapper like   "%,'.$filter.',%" ';
				}
			}
            if(isset($_SESSION[$this -> prefix.'filter1'])){
				$filter = $_SESSION[$this -> prefix.'filter1'];
				if($filter){
				    $filter--;
					$where .= ' AND a.status = '.$filter;
				}
			}
			if(!$ordering)
				$ordering .= " ORDER BY created_time DESC , id DESC ";
			if(isset($_SESSION[$this -> prefix.'keysearch'] ))
			{
				if($_SESSION[$this -> prefix.'keysearch'] )
				{
					$keysearch = $_SESSION[$this -> prefix.'keysearch'];
					$where .= " AND ( a.name LIKE '%".$keysearch."%' OR a.alias LIKE '%".$keysearch."%' )";
				}
			}
			$query = " SELECT a.*
						  FROM 
						  	".$this -> table_name." AS a
						  	WHERE 1=1 ".
						 $where.
						 $ordering. " ";
			return $query;
		}
		/*
		 * select in category
		 */
		function get_categories_tree(){
			global $db ;
			$sql = " SELECT id, name, parent_id AS parent_id 
				FROM ".$this -> table_category;
			$db->query($sql);
			$categories =  $db->getObjectList();
			$tree  = FSFactory::getClass('tree','tree/');
			$rs = $tree -> indentRows($categories,1); 
			return $rs;
		}

		function save(){
			$name = FSInput::get('name');
			if(!$name){
				Errors::_('You must entere name');
				return false;
			}	
			$id = FSInput::get('id',0,'int');	
			$alias= FSInput::get('alias');
			$fsstring = FSFactory::getClass('FSString','','../');
			if(!$alias){
				$row['alias'] = $fsstring -> stringStandart($name);
			} else {
				$row['alias'] = $fsstring -> stringStandart($alias);
			}
			$category_id = FSInput::get('category_id',0,'int');
			if(!$category_id)
				return false;
			$cat =  $this->get_record_by_id($category_id,$this -> table_category);
			$row['category_id_wrapper'] = $cat -> list_parents;
			$row['category_root_alias'] = $cat -> root_alias;
			$row['category_alias_wrapper'] = $cat -> alias_wrapper;
			$row['category_name'] = $cat -> name;
			$row['category_alias'] = $cat -> alias;
            $row['origin'] = FSInput::get('origin');
            $origin = $this->getOriginById(FSInput::get('origin'));
            $row['origin_title'] = $origin->title;
            /*$color = FSInput::get('color',array(),'array');
            $row['color'] = implode(',', $color);
            $size = FSInput::get('size',array(),'array');
            $row['size'] = implode(',', $size);*/
			$arr_types = FSInput::get('types',array(),'array');
			if(count($arr_types)){
				$str_values = implode(',',$arr_types);
				$row['types'] = count($arr_types)?','.$str_values.',':'';
			}
			$price_old = FSInput::get('price_old',0,'int');
			$discount = FSInput::get('discount',0,'int');
			$discount_unit = FSInput::get('discount_unit','percent');
            $row['description'] = htmlspecialchars_decode(FSInput::get('description'));
			if($discount_unit == 'percent'){
				if($discount > 100 || $discount < 0){
					$row['price_old'] = $price_old;								
					$row['price'] = $price_old;								
					$row['discount'] = 0;								
				}else{
					$row['price']  = $price_old * (100 - $discount)/100;
				}
			}else{
				if($discount > $price_old || $discount < 0){
					$row['price_old'] = $price_old;								
					$row['price'] = $price_old;								
					$row['discount'] = 0;									
				}else{
					$row['price']  = $price_old - $discount;
				}
			}
			if(!$this -> save_exist_images()){
			}
			$file_upload = @$_FILES["file_upload1"]["name"];
			if($file_upload){
				$path_original = 'images'.DS.'products'.DS.'upload'.DS.md5(date('d-m-Y')).DS;
				$path = PATH_BASE.$path_original;
				// remove old if exists record and img
				if($id){
					$img_paths = array();
					$img_paths[] = $path_original;
					$this -> remove_file($id);
				}
				$fsFile = FSFactory::getClass('FsFiles');
				// upload
				$file_upload_name = $fsFile -> upload_doc("file_upload1", $path ,10000000, '_'.time());
				if($file_upload_name){
					$row['file_upload'] = 	str_replace(DS,'/',$path_original).$file_upload_name;
				}
				//echo $row['file_upload'];
			}
			$id =  parent::save($row);
			if(!$id){
				Errors::setError('Not save');
				return false;
			}
            $this->updateProductImages($id);
			$this->updateProductsCategories($cat->list_parents);
			return $id;
		}

		function updateProductsCategories($category_id_wrapper){
			global $db;
			$category_id_wrapper = explode(',', $category_id_wrapper);
			foreach ($category_id_wrapper as $cID)
				if(intval($cID)){
					$total = $this->get_count('published = 1 AND category_id_wrapper LIKE "%,'.$cID.',%"', 'fs_products');
					
					$this->_update(array(
						'total_products' => $total
					), 'fs_products_categories','id='.intval($cID));
				}
		}
		/*
		 * Add data, select data from foreign table
		 */
		function add_foreign($row,$foreign_id,$foreign_name,$foreign_alias,$foreign_table,$foreign_other){
			$row[$foreign_id] = FSInput::get($foreign_id);
			if(!$row[$foreign_id]){
				$other_author = trim(FSInput::get($foreign_other));
				if($other_author){
					$record_exist = $this -> get_record('name = "'.$other_author.'"',$foreign_table);
					// if not exit then add
					if(!$record_exist){ 
						$row2 = array();
						$row2['name'] = $other_author;
						$row2['published'] = 1;
						$fsstring = FSFactory::getClass('FSString','','../');
						$row2['alias'] = $fsstring -> stringStandart($row2['name']);
						$record_new_id = $this -> _add($row2, $foreign_table);
						if($record_new_id){ 
							$row[$foreign_alias] = $row2['alias'];
							$row[$foreign_name] = $row2['name'];
							$row[$foreign_id] = $record_new_id;
						}
					}else{
						$row[$foreign_alias] = $record_exist -> alias;
						$row[$foreign_name] = $record_exist -> name;
						$row[$foreign_id] = $record_exist -> id;
					}
				}
			}else {
				$author = $this -> get_record_by_id($row[$foreign_id],$foreign_table);
				$row[$foreign_alias] = $author -> alias;
				$row[$foreign_name] = $author -> name;
			}
			return $row;
		}
		/*
		 * Chèn từ khóa vào mô tả
		 */
		function insert_link_keyword(){
			$description = htmlspecialchars_decode($_POST['description']);
			$arr_keyword_name = $this -> get_records('published = 1','fs_keywords','name');
			if(count($arr_keyword_name)){
				foreach($arr_keyword_name as $item){
//					preg_match('#<a[^>]*>(.*?)'.$item ->name.'(.*?)</a>#is',$description,$rs);
//					preg_match('#<a[^>]*>([^<]*?)'.$item ->name.'([^>]*?)</a>#is',$description,$rs);
					preg_match('#<a[^>]*>((^((?!</a>).)*$)*?)'.$item ->name.'(((^((?!<a>).)*$))*?)</a>#is',$description,$rs);
					if(count($rs))
						continue;
					$link = '/tim-kiem-sach/tat-ca/'.$item ->name.'.html';
					$description  = str_replace($item -> name,'<a href="'.$link.'" class="follow">'.$item -> name.'</a>',$description);
				}
			}
			return $description;
		}
		
		/*
		 * Xóa file upload
		 */
		function remove_file($id){
			$file_upload = $this -> get_result('id = '.$id,'fs_products','file_upload');
			if(!$file_upload)
				return true;
			$path_file = PATH_BASE.str_replace('/',DS,$file_upload);
			$fsFile = FSFactory::getClass('FsFiles');
			return $fsFile -> remove_file_by_path($path_file);
		}
		function save_all(){
	        $total = FSInput::get('total',0,'int');
	        if(!$total)
	           return true;
	        $field_change = FSInput::get('field_change');
	        if(!$field_change)
	           return false;
          	// 	calculate filters: 
			$arr_table_name_changed = array();	
	        $field_change_arr = explode(',',$field_change);
	        $total_field_change = count($field_change_arr);
	        $record_change_success = 0;
	        for($i = 0; $i < $total; $i ++){
	        	$str_update = '';
	        	$update = 0;
	        	$row = array();
	        	foreach($field_change_arr as $field_item){
	        	      $field_value_original = FSInput::get($field_item.'_'.$i.'_original')	;
	        	      $field_value_new = FSInput::get($field_item.'_'.$i)	;
	        	      if(is_array($field_value_new)){
        	      			$field_value_new = count($field_value_new)?','.implode(',',$field_value_new).',':'';
	        	      }
	        	      if($field_value_original != $field_value_new){
	        	          $update =1;
//	        	          $row[$field_item] = htmlspecialchars_decode($field_value_new);
	        	          echo $row[$field_item] = htmlspecialchars_decode($field_value_new);
//	        	          echo $row[$field_item] = $field_value_new;
//	        	          die;
//	        	          $str_update[] = "`".$field_item."` = '".$field_value_new."'";
	        	      }    
	        	}
	        	if($update){
	        		// update price when change discount
	        		/* $discount = FSInput::get('discount_'.$i);
	        		$discount_unit = FSInput::get('discount_unit_'.$i);
	        		$price_old = FSInput::get('price_old_'.$i);
		        	if($discount_unit == 'percent'){
						if($discount > 100 || $discount < 0){
						}else{
							$row['price']  = $price_old * (100 - $discount)/100;
						}
					}else{
						if($discount > $price_old || $discount < 0){
						}else{
							$row['price']  = $price_old - $discount;
						}
					}*/
	        		$id = FSInput::get('id_'.$i, 0, 'int');
					$rs = $this -> _update($row,$this ->  table_name, 'id = '.$id,0 );
					if($this -> use_table_extend){
	        			$record = $this -> get_record('id = '.$id,$this ->  table_name);
	        			$table_extend = $record -> tablename;
	        			// calculate filters:
	        			$arr_table_name_changed[] = $table_extend;
	        			global $db;
	        			if($db -> checkExistTable($table_extend)){
	        				$rs = $this -> _update($row,$table_extend, 'record_id = '.$id );
	        			}
					}
		        	//synchronize
					$array_synchronize = $this -> array_synchronize;
					if(count($array_synchronize)){
						foreach($array_synchronize as $table_name => $fields){
							$i = 0;
							$syn = 0;
							$row5 = array();
							//$where = ' WHERE ';
							foreach($fields as $cur_field => $syn_field){
								if(!$i){
									$where .= $syn_field .' = '.$id;
								}else{
									if(isset($row[$cur_field])){
										$row5[$syn_field] = $row[$cur_field];
										$syn = 1;
									}
								}
								$i ++;
							}
							if($syn)
								$rs = $this -> _update($row5,$table_name, $where,0 );
						}
					}
		            if($rs)
		            	$record_change_success ++;
	        	}
	        }
	     	// calculate filters:
			if($this -> calculate_filters){
				$this -> caculate_filter($arr_table_name_changed);
			}
	        return $record_change_success;  
	    }
		/*
		Can xoa image_other
		*/
		function remove(){
			$cids = FSInput::get('id',array(),'array');
			if(!count($cids))
				return false;
			$str_cids = '';
			$i = 0;
			foreach ($cids as $cid){
				if($i)
					$str_cids .= ',';
				$str_cids .= $cid ;
			}
			if(!$str_cids)
				return;
			// remove other image
			$list_img = $this -> get_records( ' product_id IN ('.$str_cids.') ','fs_'.$this->type.'_images' );
			if(!count($list_img)){
				foreach($list_img as $img){
					$field_img = $img -> image;
					$arr_img_paths = $this -> arr_img_paths_other;
					if(count($arr_img_paths)){
						foreach($arr_img_paths as $item_path){
							$path_resize = str_replace('/original/', '/'.$item_path[0].'/', $field_img);
							$path_resize = PATH_BASE.str_replace('/',DS,$path_resize);
							unlink($path_resize); 
						}	
					}
				}	
			}
			return parent::remove();
		}
		function save_accessories_incentives($product_id){
			if(!$product_id)
				return;
			global $db;
			$query = ' SELECT id,product_incenty_id,product_id,price_old 
						FROM fs_products_incentives
						WHERE product_id =  '.$product_id ;
			$db->query($query);
			$list = $db->getObjectList();
			if(count($list)){
				foreach($list as $item){
					$product_incenty_id = $item -> product_incenty_id;
					$discount = FSInput::get('discount_'.$product_incenty_id);
					$discount_begin = FSInput::get('discount_'.$product_incenty_id."_begin");
					$discount_unit = FSInput::get('discount_unit_'.$product_incenty_id);
					$discount_unit_begin = FSInput::get('discount_unit_'.$product_incenty_id."_begin");
					if($discount != $discount_begin || $discount_unit != $discount_unit_begin){
						$row = array();
						if($discount_unit == 'percent'){
							if($discount > 100 || $discount < 0){
								continue;								
							}
							$row['price_new']  = ($item -> price_old) * (100 - $discount)/100;
						}else{
							if($discount > $item -> price_old || $discount < 0){
								continue;								
							}
							$row['price_new']  = ($item -> price_old) - $discount;
						}
						$row['discount'] = $discount;
						$row['discount_unit'] = $discount_unit;
						$this -> _update($row, 'fs_products_incentives','WHERE product_id =    '.$product_id.' AND product_incenty_id = '.$product_incenty_id);
					}
				}
			}
		}
		/*
		 * get data from fs_product_images
		 */
		function get_product_images($product_id){
			if(!$product_id)
				return;
			$query   = " SELECT image,id,title,type,ordering 
						FROM fs_products_images
						WHERE record_id = $product_id";
			global $db;
			$sql = $db->query($query);
			$result = $db->getObjectList();
			return $result;
		}
			/*
		 * upload other images for product
		 * These images is not main images. 
		 */
		function upload_other_images($product_id)
		{
			global $db;
			$fsFile = FSFactory::getClass('FsFiles','');
			for($i = 0 ; $i < 5; $i ++)
			{
				$upload_area   = "other_image_".$i;
				if($_FILES[$upload_area]["name"])
				{
					$row = array();
					$image = $this -> upload_image($upload_area,'_'.time(),2000000,$this -> arr_img_paths_other);
					$row['name'] = FSInput::get('new_name_'.$i);
					$row['type'] = FSInput::get('new_type_'.$i);
					$row['ordering'] = FSInput::get('new_ordering_'.$i);
					$row['product_id'] = $product_id;
					$row['image'] = $image;
					$rs = $this -> _add($row, 'fs_'.$this->type.'_images');
				}
			}
			return true;
		}
		/*
		 * Lưu ảnh đã tồn tại
		 */
		function save_exist_images(){
			global $db;
			// EXIST FIELD
			$images_exist_total = FSInput::get('images_exist_total');
			$sql_alter = "";
			$arr_sql_alter = array();
			$rs = 0;
			for($i= 0 ; $i < $images_exist_total ; $i++){
				$id_exist = FSInput::get('id_exist_'.$i);
				$name_exist = FSInput::get('name_exist_'.$i);
				$name_exist_begin = FSInput::get('name_exist_'.$i."_begin");
				$type_exist = FSInput::get('type_exist_'.$i);
				$type_exist_begin = FSInput::get('type_exist_'.$i.'_begin');
				$ordering_exist = FSInput::get('ordering_exist_'.$i);
				$ordering_exist_begin = FSInput::get('ordering_'.$i.'_begin');
				if( ($name_exist != $name_exist_begin) || ($type_exist != $type_exist_begin) || ($ordering_exist != $ordering_exist_begin) ) {
					$row = array();
					$row['name'] = $name_exist;
					$row['type'] = $type_exist;
					$row['ordering'] = $ordering_exist;
					$u = $this -> _update($row, 'fs_products_images','WHERE id='.$id_exist);
					if($u)
						$rs ++;
				}
			}
			return $rs;
			// END EXIST FIELD
		}
		function getManufactories($tablename)
		{
			if(!$tablename)
				return;
			global $db;
			$query = " SELECT id,name
						FROM fs_manufactories 
						";
			$sql = $db->query($query);
			$alias = $db->getObjectList();
			return $alias;
		}
		function get_products_by_ids($str_products_together){
			if(!$str_products_together)
				return;
			$query   = " SELECT name,id 
						FROM fs_products
						WHERE id IN (0".$str_products_together."0) ";
			global $db;
			$sql = $db->query($query);
			$result = $db->getObjectList();
			return $result;	
		}
		function get_products_incentives($product_id){
			$query   = " SELECT b.name,b.id, a.price_old,a.price_new,a.product_incenty_id,a.discount,a.discount_unit  
						FROM fs_products_incentives AS a
						LEFT JOIN fs_products AS b ON a.product_incenty_id = b.id
						WHERE a.product_id = $product_id";
			global $db;
			$sql = $db->query($query);
			$result = $db->getObjectList();
			return $result;	
		}
		function remove_together(){
			$id = FSInput::get('id',0,'int');
			$product_together_id = FSInput::get('product_together_id',0,'int');
			if(!$id || !$product_together_id)	
				return;
			$sql = " SELECT products_together 
				FROM fs_products 
				WHERE id = $id
					";
			global $db ;
			$db->query($sql);
			$rs =  $db->getResult();
			if(!$rs)	
				return;
			$arr = explode( ',',$rs);
			if(!count($arr))
				return;
			$str = '';
			$i  = 0;
			foreach($arr as $item){
				if($item != $product_together_id){
					if($i > 0)
						$str .= ',';
					$str .= $item;
					$i ++;
				}
			}	
			$row['products_together'] = $str;
			return $this -> _update($row,'fs_products',' WHERE id = '.$id .'');
		}
		function remove_incentives(){
			$id = FSInput::get('id',0,'int');
			$product_incentives_id = FSInput::get('product_incentives_id',0,'int');
			if(!$id || !$product_incentives_id)	
				return;
			$sql = " SELECT products_incentives 
				FROM fs_products 
				WHERE id = $id
					";
			global $db ;
			$db->query($sql);
			$rs =  $db->getResult();
			if(!$rs)	
				return;
			$arr = explode( ',',$rs);
			if(!count($arr))
				return;
			$str = '';
			$i  = 0;
			foreach($arr as $item){
				if($item != $product_incentives_id){
					if($i > 0)
						$str .= ',';
					$str .= $item;
					$i ++;
				}
			}	
			$row['products_incentives'] = $str;
			// remove from fs_products_incentives
			$this -> remove_from_products_incentives($id ,$product_incentives_id);			
			return $this -> _update($row,'fs_products',' WHERE id = '.$id .'');
		}
		function remove_from_products_incentives($id ,$product_incentives_id){
			$sql = " DELETE FROM fs_products_incentives
						WHERE product_id = $id
							AND product_incenty_id = $product_incentives_id " ;
			global $db;
			$db->query($sql);
			$rows = $db->affected_rows();
		}
		function bookmark()
		{
			$ids = FSInput::get('id',array(),'array');
			if(!count($ids))
				return;
			$rs = 0;
			foreach($ids as $id){
				$product = $this -> get_record('id = '.$id,$this -> table_name);
				if(!$product)
					continue;
				$row = array();
				$row['product_id'] = $product -> id;
				$row['price'] = $product -> price_old;
				$row['total_money'] = $product -> price_old;
				$row['discount'] = 0;
				$row['quantity'] = 1;
				$check_exit = $this -> check_exist($product -> id,'','product_id','fs_products_bookmark');
				if($check_exit)
					continue;
				if($this -> _add($row,'fs_products_bookmark' ))
					$rs ++;
			}
			return $rs;
		}
        
        /**
         * Lấy danh sách màu.
         * 
         * @return Object list
         */ 
        function getColors(){
            global $db;
            $query = "  SELECT *
                        FROM fs_products_colors
                        WHERE published = 1
                        ORDER BY ordering ASC, id DESC";
            $db->query($query);
			$result = $db->getObjectList();
            return $result;
        }
        
        /**
         * Lấy danh sách size
         * 
         * @return Object list
         */ 
        function getSizes(){
            $size = array(  array('id'=>6, 'title'=>'XXS'),
                            array('id'=>7, 'title'=>'XS'),
                            array('id'=>1, 'title'=>'S'),
                            array('id'=>2, 'title'=>'M'),
                            array('id'=>3, 'title'=>'L'),
                            array('id'=>4, 'title'=>'XL'),
                            array('id'=>5, 'title'=>'XXL'),
                            array('id'=>8, 'title'=>'XXXL'),
                            array('id'=>9, 'title'=>'F (FREE SIZE)'));
            return json_decode(json_encode($size));
        }
        
        /**
         * Lấy danh sách size
         * 
         * @return Object list
         */ 
        function getStatus(){
            $size = array(  array('id'=>1, 'title'=>'Hết hàng'),
                            array('id'=>2, 'title'=>'Còn hàng'));
            return json_decode(json_encode($size));
        }
        
        /**
         * Upload và resize ảnh
         * 
         * @return Bool
         */ 
        function uploadProductImages(){
			global $db;
			$path = PATH_BASE.$this->img_folder.'/original/';
            require_once(PATH_BASE.'libraries/upload.php');
            $upload = new  Upload();
            $file_name = $upload -> uploadImage('Filedata', $path);
            if(is_string($file_name) and $file_name!='' and !empty($this->arr_img_paths_other)){
	        	foreach ( $this->arr_img_paths_other as $item ) {
					$path_resize = str_replace ( '/original/', '/'. $item [0].'/', $path );
					$upload->create_folder ( $path_resize );
					$method_resize = $item [3] ? $item [3] : 'resized_not_crop';
					$upload->$method_resize ( $path . $file_name, $path_resize . $file_name, $item [1], $item [2] );
				}
	        }
            $data = base64_decode(FSInput::get('data'));
            $data = explode('|', $data);
            $row = array();
            if($data[0] == 'add')
                $row['tmp'] = $data[1];
            else
                $row['record_id'] = $data[1];
			$row['image'] = $this->img_folder.'/original/'.$file_name;;
			$rs = $this -> _add($row, 'fs_'.$this->type.'_images');
			return true;
		}
        
        /**
         * Lấy danh sách ảnh
         * 
         * @return Object list
         */ 
        function getProductImages(){
            $data = base64_decode(FSInput::get('data'));
            $data = explode('|', $data);
            $where = 'record_id = '.$data[1];
            if($data[0] == 'add')
                $where = 'tmp = \''.$data[1].'\'';
            global $db;
            $query = '  SELECT *
                        FROM '.'fs_'.$this->type.'_images'.' 
                        WHERE '.$where.'
                        ORDER BY ordering, id DESC';
    		$sql = $db->query($query);
    		return $db->getObjectList();
        }
        
        /**
         * Update product id vào images
         */ 
        function updateProductImages($id=0){
            global $db;
            $session_id = FSInput::get('session_id');
            $query = '  UPDATE fs_'.$this->type.'_images SET record_id = '.$id.', tmp = \'\'
                        WHERE tmp = \''.$session_id.'\'';
            $db->query($query);
            $rows = $db->affected_rows();
            return $rows;
        }
        
        function deleteOtherImage($product_id = 0){
            global $db;
            if($product_id)
                $where = 'product_id = \''.$product_id.'\'';
            else{
                $data = FSInput::get('data', 0);
                $where = 'id = \''.$data.'\'';
            }
            $query = '  SELECT *
                        FROM fs_'.$this->type.'_images
                        WHERE '.$where;
            $db->query($query);
            $listImages = $db->getObjectList();
            if($listImages){
                foreach($listImages as $item){
                    $query = '  DELETE FROM fs_'.$this->type.'_images
                                WHERE id = \''.$item->id.'\'';
                    $db->query($query);
                    $path = PATH_BASE.$item->image;
                    @unlink($path);
                    foreach ( $this->arr_img_paths_other as $image){
    					@unlink(str_replace ( '/original/', '/'. $image[0] .'/', $path));
    				}
                }
            }
        }
        
        function sortProductImages(){
            global $db;
            if(isset($_POST["sort"])){
            	if(is_array($_POST["sort"])){
            		foreach($_POST["sort"] as $key=>$value){
            			$db->query("UPDATE fs_products_images SET ordering = $key WHERE id = $value");
            		}
            	}
            }
        }
        
        function getProductsExport(){
            global $db;
            $query = '  SELECT id, code, name, price_old, discount, status, ordering, category_name     
                        FROM '.$this->table_name.'
                        ORDER BY id DESC';
            $db->query($query);
			$result = $db->getObjectList();
            return $result;
        }
        
        function getOriginById($id = 0){
            global $db;
            $query = "  SELECT *
                        FROM fs_products_origins
                        WHERE published = 1 AND id = '$id'
                        LIMIT 1";
            $db->query($query);
			$result = $db->getObject();
            return $result;
        }
        
        function getOrigins(){
            global $db;
            $query = "  SELECT *
                        FROM fs_products_origins
                        WHERE published = 1
                        ORDER BY ordering ASC, id DESC";
            $db->query($query);
			$result = $db->getObjectList();
            return $result;
        }
	}
?>