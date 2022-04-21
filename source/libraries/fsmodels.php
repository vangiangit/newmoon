<?php
class FSModels {
	var $limit;
	var $page;
    var $where;
    var $order_by;
    
	function __construct($params = '', $active_record = null) {
		$page = FSInput::get ( 'page', 0, 'int' );
		$limit = FSInput::get ( 'limit', 10, 'int' );
		$this->page = $page;
		$this->limit = $limit;
	}
	function _update($row, $table_name, $where = '', $use_mysql_real_escape_string = 1) {
		$total = count ( $row );
		if (! $total || ! $table_name)
			return;
		$sql = 'UPDATE ' . $table_name . ' SET ';
		$i = 0;
		foreach ( $row as $key => $value ) {
			if ($use_mysql_real_escape_string)
				$sql .= "`" . $key . "` = '" . mysql_real_escape_string ( $value ) . "'";
			else
				$sql .= "`" . $key . "` = '" . $value . "'";
			if ($i < $total - 1)
				$sql .= ',';
			$i ++;
		}
		if($where)
			$where = ' WHERE '.$where;
		$sql .= $where;
		global $db;
		$db->query ( $sql );
		$rows = $db->affected_rows ();
		return $rows;
	}
	function _add($row, $table_name, $use_mysql_real_escape_string = 0) {
		if (! $table_name)
			return false;
		$str_fields = array ();
		$str_values = array ();
		if (! count ( $row ))
			return;
		foreach ( $row as $field => $value ) {
			$str_fields [] = "`" . $field . "`";
			if ($use_mysql_real_escape_string) {
				$value = mysql_real_escape_string ( $value );
			} else {
				$value = htmlspecialchars_decode ( $value );
			}
			//			$value = htmlspecialchars($value);
			//			$value = mysql_real_escape_string($value);
			$str_values [] = "'" . $value . "'";
		}
		$str_fields = implode ( ',', $str_fields );
		$str_values = implode ( ',', $str_values );
		global $db;
		$sql = ' INSERT INTO  ' . $table_name;
		$sql .= '(' . $str_fields . ") ";
		$sql .= 'VALUES (' . $str_values . ") ";
		$db->query ( $sql );
		$id = $db->insert ();
		return $id;
	}
	
/*
    * Value need remove
    */
    function _remove($where = '', $table_name = '')
    {
        $sql_where = '';
        if ($where)
            $sql_where .= ' WHERE ' . $where;
        if (!$table_name)
            $table_name = $this->table_name;
        $sql = " DELETE FROM " . $table_name . $sql_where;
        global $db;
        $db->query($sql);
        $rows = $db->affected_rows();
        return $rows;
    }
	/*
    * Remove img
    */
	// remove image of id IN str_id
	function remove_image($where, $path_arr = array(), $field = 'image', $table_name = '') {
		if (! $where || ! count ( $path_arr ))
			return;
		if (! $table_name)
			return false;
		$sql = " SELECT " . $field . "
					 FROM " . $table_name . "
					 WHERE  " . $where;
		global $db;
		$db->query ( $sql );
		$list = $db->getObjectList ();
		for($i = 0; $i < count ( $list ); $i ++) {
			$image = $list [$i]->$field;
			if ($image)
				for($j = 0; $j < count ( $path_arr ); $j ++) {
					if (! @unlink ( $path_arr [$j] . $image )) {
						//						$fserrors = FSFactory::getClass('Errors');
					//						$fserrors -> _('Not remove image'.$path_arr[$j].$image);
					//						return false;
					}
				}
		}
		return true;
	}
	/*
    * Get wrapper of list id
    * ex: get parent_ids from fs_category where id IN ()
    * return string of wrapper
    */
	function _get_wrapper($tablename, $field_wrapper, $where_value, $where_field = 'id', $where_type = 'IN') {
		if (! $tablename || ! $field_wrapper || ! $where_value)
			return;
		$sql = ' SELECT  ' . $field_wrapper;
		$sql .= ' FROM ' . $tablename;
		if ($where_type == 'IN') {
			$sql .= ' WHERE  ' . $where_field . ' IN (' . $where_value . ') ';
		} else {
			$sql .= ' WHERE  ' . $where_field . $where_type . $where_value;
		}
		global $db;
		$db->query ( $sql );
		$list = $db->getObjectlist ();
		$str_wrapper = '';
		for($i = 0; $i < count ( $list ); $i ++) {
			$item = $list [$i];
			if ($item->$field_wrapper) {
				if ($str_wrapper)
					$str_wrapper .= ',';
				$str_wrapper .= $item->$field_wrapper;
			}
		}
		if (! $str_wrapper)
			return;
		$arr_wrapper = explode ( ',', $str_wrapper );
		$arr_wrapper = array_unique ( $arr_wrapper );
		return implode ( $arr_wrapper, ',' );
	}
	function get_estore() {
		$estore_id = $_SESSION ['estore_id'];
		if (! $estore_id)
			return;
		global $db;
		$sql = " SELECT id,category_ids,estore_name,estore_url,category_ids_wrapper,product_categories_wrapper, city_id, district_id,destination_ids,username,etemplate
				FROM fs_estores
				WHERE `id`  = '$estore_id' 
				";
		$db->query ( $sql );
		return $db->getObject ();
	}
	/*
    * get Destination
    * default: Hoan kiem, Ha Noi
    */
	function get_destination($district_id = '1478') {
		if (! $district_id)
			return false;
		global $db;
		$sql = " SELECT id, name FROM fs_destination
				WHERE district_id = $district_id ";
		$db->query ( $sql );
		return $db->getObjectList ();
	}
	function alert_error($msg) {
		echo "<script type='text/javascript'>alert('" . $msg . "'); </script>";
	}
	function get_estore_by_ids($str_estore_id) {
		if (! $str_estore_id)
			return;
		global $db;
		$sql = " SELECT id,estore_name,username,estore_url FROM fs_estores
				WHERE id IN (" . $str_estore_id . ") 
				AND published = 1";
		$db->query ( $sql );
		return $list = $db->getObjectListByKey ( 'id' );
	}
	function get_estore_by_id($estore_id) {
		if (! $estore_id)
			return;
		global $db;
		$sql = " SELECT id,estore_name,username,estore_url FROM fs_estores
				WHERE id = (" . $estore_id . ") 
				AND published = 1";
		$db->query ( $sql );
		return $list = $db->getObject ();
	}
	/*
    * get record by rid
    */
	function get_record_by_id($id, $table_name = '', $select = '*') {
		if (! $id)
			return;
		if (! $table_name)
			$table_name = $this->table_name;
		$query = " SELECT " . $select . "
					  FROM " . $table_name . "
					  WHERE id = $id ";
		global $db;
		$sql = $db->query ( $query );
		$result = $db->getObject ();
		return $result;
	}
	/*
    * Return result
    */
	function get_result($where = '', $table_name = '', $field = 'id') {
		if (! $where)
			return;
		if (! $table_name)
			$table_name = $this->table_name;
		$select = " SELECT " . $field . " ";
		$query = $select . "  FROM " . $table_name . "
					  WHERE " . $where;
		global $db;
		$sql = $db->query ( $query );
		$result = $db->getResult ();
		return $result;
	}
	/*
    * select count(...) thỏa mãn điều kiện
    */
	function get_count($where = '', $table_name = '', $select = '*') {
		if (! $where)
			return;
		if (! $table_name)
			$table_name = $this->table_name;
		$query = ' SELECT count(' . $select . ')
					  FROM ' . $table_name . '
					  WHERE ' . $where;
		global $db;
		$sql = $db->query ( $query );
		$result = $db->getResult ();
		return $result;
	}
	/*
    * get record by rid
    */
	function get_record($where = '', $table_name = '', $select = '*') {
		if (! $where)
			return;
		if (! $table_name)
			$table_name = $this->table_name;
		$query = " SELECT " . $select . "
					  FROM " . $table_name . "
					  WHERE " . $where;
		global $db;
		$db->query ( $query );
		$result = $db->getObject ();
		return $result;
	}
	/*
    * get records
    */
	function get_records($where = '', $table_name = '', $select = '*', $ordering = '', $limit = '', $field_key = '') {
		$sql_where = " ";
		if ($where) {
			$sql_where .= ' WHERE ' . $where;
		}
		if (! $table_name)
			$table_name = $this->table_name;
		$query = " SELECT " . $select . "
					  FROM " . $table_name . $sql_where;
		if ($ordering)
			$query .= ' ORDER BY ' . $ordering;
		if ($limit)
			$query .= ' LIMIT ' . $limit;
		
		//		echo $query;
		global $db;
		$sql = $db->query ( $query );
		if (! $field_key)
			$result = $db->getObjectList ();
		else
			$result = $db->getObjectListByKey ( $field_key );
		return $result;
	}
	/*
    * save into table
    */
	function _save($row = array(), $table_name = '', $use_mysql_real_escape_string = 0) {
		$id = FSInput::get ( 'id', 0, 'int' );
		if (! $id)
			return $this->_add ( $row, $table_name, $use_mysql_real_escape_string );
		else
			return $this->_update ( $row, $table_name, ' WHERE id = ' . $id, $use_mysql_real_escape_string );
	}
	function get_countries() {
		global $db;
		$sql = " SELECT id, name FROM fs_countries
				WHERE published = 1
				ORDER BY `ordering`
				";
		$db->query ( $sql );
		return $db->getObjectList ();
	}
	/*
    * get list District
    * default: Ha Noi
    */
	function get_districts($city_id) {
		if (! $city_id)
			return;
		global $db;
		$sql = " SELECT id, name FROM fs_districts
				WHERE city_id = $city_id 
				AND published = 1
				ORDER BY `ordering`
				";
		$db->query ( $sql );
		return $db->getObjectList ();
	}
	function get_cities($country_id = 0) {
		global $db;
		$where = ' published = 1 ';
		if ($country_id)
			$where .= ' AND country_id = "' . $country_id . '"';
		
		$sql = " SELECT id, name FROM fs_cities 
				WHERE " . $where . "
				ORDER BY `ordering`";
		$db->query ( $sql );
		return $db->getObjectList ();
	}
	function get_communes($district_id = 66) {
		global $db;
		$sql = " SELECT id, name FROM fs_commune
				WHERE district_id = $district_id 
				AND published = 1
				ORDER BY `ordering`";
		$db->query ( $sql );
		return $db->getObjectList ();
	}
	function get_sitemap($level = 0) {
		$where = '';
		if ($level)
			$where .= ' AND level < "' . $level . '" ';
		global $db;
		$sql = " SELECT name,alias, level, parent_id,module, record_id as id,id as sitemap_id
				FROM fs_sitemap
				WHERE published  = 1
				" . $where . "
				ORDER BY module,ordering";
		$db->query ( $sql );
		$list = $db->getObjectList ();
		if (! $list)
			return;
		$tree_class = FSFactory::getClass ( 'tree', 'tree/' );
		// call views
		$arr_sitemap = array ();
		foreach ( $list as $item ) {
			if (! isset ( $arr_sitemap [$item->module] ))
				$arr_sitemap [$item->module] = array ();
			$arr_sitemap [$item->module] [] = $item;
		}
		if (! count ( $arr_sitemap ))
			return;
		foreach ( $arr_sitemap as $key => $items ) {
			$arr_sitemap [$key] = $tree_class->indentRows ( $items );
		}
		return $arr_sitemap;
	}
	function check_exist($value, $id = '', $field = 'alias', $table_name = '') {
		if (! $value)
			return true;
		if (! $table_name)
			$table_name = $this->table_name;
		$query = " SELECT count(*)
					  FROM " . $table_name . " 
					WHERE 
						$field = '" . $value . "' ";
		if ($id)
			$query .= ' AND id <> ' . $id . ' ';
		global $db;
		$sql = $db->query ( $query );
		$result = $db->getResult ();
		return $result;
	}
	
	function get_total($query_body) {
		if (! $query_body)
			return;
		global $db;
		$query = "SELECT count(*)";
		$query .= $query_body;
		$sql = $db->query ( $query );
		$total = $db->getResult ();
		return $total;
	}
    function upload_image($image_tag_name = 'image', $suffix = '', $max_size = 2000000, $arr_img_paths = array()){
        $img_folder = $this->img_folder;
        $img_link = str_replace('\\', '/', $img_folder);
        $img_folder = str_replace('/', DS, $img_folder);
        $img_folder = PATH_BASE . $img_folder . DS;
        $fsFile = FSFactory::getClass('FsFiles');
        $path = $img_folder . 'original' . DS;
        if (!$fsFile->create_folder($path))
        {
            Errors::setError("Not create folder " . $path);
            return false;
        }
        $image = $fsFile->uploadImage($image_tag_name, $path, $max_size, $suffix);
        if (!$image)
            return false;
        $img_link = $img_link . '/original/' . $image;
        if (!count($arr_img_paths))
            $arr_img_paths = $this->arr_img_paths;
        if (!count($arr_img_paths))
            return $img_link;
        foreach ($arr_img_paths as $item)
        {
            $path_resize = str_replace(DS . 'original' . DS, DS . $item[0] . DS, $path);
            $fsFile->create_folder($path_resize);
            $method_resize = $item[3] ? $item[3] : 'resized_not_crop';
            if (!$fsFile->$method_resize($path . $image, $path_resize . $image, $item[1], $item[2]))
                return false;
        }
        return $img_link;
    }
    
    /**
     * Phân trang
     * @return Object
     */ 
    function getPagination($total){
		FSFactory::include_class('Pagination');
		$pagination = new Pagination($this->limit, $total, $this->page);
		return $pagination;
	}
}