<?php
/**
 * @author vangiangfly
 * @final 21/04/2013
 */ 
class DownloadModelsDownload extends FSModels
{
    var $limit;
    var $prefix;
    function __construct()
    {
        parent::__construct();
        $this->limit = 20;
        $this->view = 'about';
        $this->table_category_name = 'fs_download_categories';
        $this->table_types = 'fs_download_types';
        $this->arr_img_paths = array(
            array('tiny', 370, 370, 'resize_image_fix'),
        );
        $this->table_name = 'fs_download';
        $this->img_folder = 'images/downloads/' . date('Y/m');
        $this->check_alias = 0;
        $this->field_img = 'image';
    }
    function setQuery()
    {
        // ordering
        $ordering = "";
        $where = SQL_FILTER_BY_ADLANG;
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
        $row = array();
        if($_FILES["file"]["name"]){
            $path = PATH_BASE.$this->img_folder;
            $fsFile = FSFactory::getClass('FsFiles');
            $file_upload_name = $fsFile -> uploadFile("file", $path ,10000000, '_'.time());
            if($file_upload_name){
                $row['file'] = $this->img_folder.'/'.$file_upload_name;
            }
        }
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
                        $cat = $this->get_record_by_id($field_value_new, $this->table_category_name);
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
}
?>