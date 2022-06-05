<?php
/**
 * @author vangiangfly
 * @final 21/04/2013
 */ 
class NewsModelsNews extends FSModels
{
    var $limit;
    var $prefix;
    function __construct()
    {
        parent::__construct();
        $this->limit = 20;
        $this->view = 'news';
        $this->table_category_name = 'fs_news_categories';
        $this->table_types = 'fs_news_types';
        $this->arr_img_paths = array(
            array('tiny', 540, 306, 'resize_image_fix'),
            array('small', 1200, 675, 'resize_image_fix'),
            array('og-image', 600, 314, 'resize_image_fix'),
        );
        $this->table_name = 'fs_news';
        $this->img_folder = 'images/news/' . date('Y/m');
        $this->check_alias = 0;
        $this->field_img = 'image';
    }
    function setQuery()
    {
        // ordering
        $ordering = "";
        $where =  SQL_FILTER_BY_ADLANG;
        if (isset($_SESSION[$this->prefix . 'sort_field']))
        {
            $sort_field = $_SESSION[$this->prefix . 'sort_field'];
            $sort_direct = $_SESSION[$this->prefix . 'sort_direct'];
            $sort_direct = $sort_direct ? $sort_direct : 'asc';
            $ordering = '';
            if ($sort_field)
                $ordering .= " ORDER BY $sort_field $sort_direct, created_time DESC, id DESC ";
        }
        // estore
        if (isset($_SESSION[$this->prefix . 'filter0']))
        {
            $filter = $_SESSION[$this->prefix . 'filter0'];
            if ($filter)
            {
                $where .= ' AND a.category_id_wrapper like  "%,' . $filter . ',%" ';
            }
        }
        if (!$ordering)
            $ordering .= " ORDER BY created_time DESC , id DESC ";
        if (isset($_SESSION[$this->prefix . 'keysearch']))
        {
            if ($_SESSION[$this->prefix . 'keysearch'])
            {
                $keysearch = $_SESSION[$this->prefix . 'keysearch'];
                $where .= " AND a.title LIKE '%" . $keysearch . "%' ";
            }
        }
        if(@$_SESSION['ad_userid']!=9){
            $where .= " AND a.creator_id = '" . $_SESSION['ad_userid'] . "' ";
        }
        $query = " SELECT a.*
						  FROM 
						  	" . $this->table_name . " AS a
						  	WHERE 1=1 " . $where . $ordering . " ";
        return $query;
    }

    function save()
    {
        $title = FSInput::get('title');
        if (!$title)
            return false;
        $id = FSInput::get('id', 0, 'int');
        $category_id = FSInput::get('category_id', 'int', 0);
        if (!$category_id)
        {
            Errors::_('Bạn phải chọn danh mục');
            return;
        }
        $cat = $this->get_record_by_id($category_id, 'fs_news_categories');
        $row['category_id_wrapper'] = $cat->list_parents;
        $row['category_alias_wrapper'] = $cat->alias_wrapper;
        $row['category_name'] = $cat->name;
        $row['category_alias'] = $cat->alias;

        $creator_id = FSInput::get('creator_id', '0');
        if($creator_id){
            $creator = $this->get_record_by_id($creator_id, 'fs_users');
            $row['creator'] = $creator->username;
            $row['creator_id'] = $creator->id;
            $row['creator_name'] = $creator->fullname;
            $row['creator_avatar'] = $creator->avatar;
        }else{
            $creator = $this->get_record_by_id($_SESSION['ad_userid'], 'fs_users');
            $row['creator'] = $creator->username;
            $row['creator_id'] = $creator->id;
            $row['creator_name'] = $creator->fullname;
            $row['creator_avatar'] = $creator->avatar;
        }
        $row['content'] = htmlspecialchars_decode(FSInput::get('content'));
        return parent::save($row);
    }
    /*
    * select in category of home
    */
    function get_categories_tree()
    {
        global $db;
        $query = " SELECT a.*
						  FROM 
						  	" . $this->table_category_name . " AS a WHERE 1=1 ".SQL_FILTER_BY_ADLANG."
						  	ORDER BY ordering ";
        $sql = $db->query($query);
        $result = $db->getObjectList();
        $tree = FSFactory::getClass('tree', 'tree/');
        $list = $tree->indentRows2($result);
        return $list;
    }
    /*
    * Save all record for list form
    */
    function save_all()
    {
        $total = FSInput::get('total', 0, 'int');
        if (!$total)
            return true;
        $field_change = FSInput::get('field_change');
        if (!$field_change)
            return false;
        $field_change_arr = explode(',', $field_change);
        $total_field_change = count($field_change_arr);
        $record_change_success = 0;
        for ($i = 0; $i < $total; $i++)
        {
            //	        	$str_update = '';
            $row = array();
            $update = 0;
            foreach ($field_change_arr as $field_item)
            {
                $field_value_original = FSInput::get($field_item . '_' . $i . '_original');
                $field_value_new = FSInput::get($field_item . '_' . $i);
                if (is_array($field_value_new))
                {
                    $field_value_new = count($field_value_new) ? ',' . implode(',', $field_value_new) .
                        ',' : '';
                }
                if ($field_value_original != $field_value_new)
                {
                    $update = 1;
                    // category
                    if ($field_item == 'category_id')
                    {
                        $cat = $this->get_record_by_id($field_value_new, 'fs_news_categories');
                        $row['category_id_wrapper'] = $cat->list_parents;
                        $row['category_alias_wrapper'] = $cat->alias_wrapper;
                        $row['category_name'] = $cat->name;
                        $row['category_alias'] = $cat->alias;
                        $row['category_id'] = $field_value_new;
                    } else
                    {
                        $row[$field_item] = $field_value_new;
                    }
                }
            }
            if ($update)
            {
                $id = FSInput::get('id_' . $i, 0, 'int');
                $str_update = '';
                global $db;
                $j = 0;
                foreach ($row as $key => $value)
                {
                    if ($j > 0)
                        $str_update .= ',';
                    $str_update .= "`" . $key . "` = '" . $value . "'";
                    $j++;
                }
                $sql = ' UPDATE  ' . $this->table_name . ' SET ';
                $sql .= $str_update;
                $sql .= ' WHERE id =    ' . $id . ' ';
                $db->query($sql);
                $rows = $db->affected_rows();
                if (!$rows)
                    return false;
                $record_change_success++;
            }
        }
        return $record_change_success;
    }

    function saveEditNews(){
		$string = FSFactory::getClass('FSString','','../');
		$row = array();
		$row['name'] = FSInput::get('news_name');
		$parent_id = FSInput::get('news_parent_id', 0);
		$data_parent_id = FSInput::get('data_parent_id', 0);
		if(!$parent_id) {
			$parent_id = $data_parent_id;
		}
        $row['link'] = FSInput::get('news_link');
		$row['parent_id'] = FSInput::get('news_parent_id', 0);
		$row['ordering'] = FSInput::get('news_ordering', 0);
		$row['published'] = FSInput::get('news_published', 0);
        $row['created_time'] = $row['updated_time'] = date('Y-m-d H:i:s');
        $row['post_id'] = $data_parent_id;
		$data_id = FSInput::get('data_id', 0);
		if($data_id)
			$this->_update($row, 'fs_news_menus', 'id='.$data_id);
		else{
			$data_id = $this->_add($row, 'fs_news_menus');
        }
	}

    function get_news_menu($id){
		global $db;
        if(!intval($id))
            return false;
		$query = " 	SELECT a.*
                    FROM 
                    fs_news_menus AS a WHERE post_id = $id
                    ORDER BY ordering ";
        $db->query($query);
		$result = $db->getObjectList();
		$tree  = FSFactory::getClass('tree','tree/');
		return $tree -> indentRows($result);
	}
}
?>