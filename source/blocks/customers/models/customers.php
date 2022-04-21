<?php
class CustomersBModelsCustomers{
    var $where;
    var $order_by;
    var $limit;
    var $category_id;
    function __construct(){
        $this->category_id = 0;
		$this->table_name  = 'fs_customers';
		$this->table_category  = 'fs_customers_categories';
    }
    
    /**
     * Điều kiện lấy sản phẩm
     * 
     * @return string
     */ 
    function getWhere(){
        $where = 'published = 1 '.SQL_LANG;
        return $where;
    }
    
    /**
     * Sắp xếp theo
     * 
     * @return string
     */ 
    function getOrdering(){
        $where = '';
        switch($this->order_by){
            case 'new':
                $where .= ' id DESC';
                break;
            default:
                $where .= ' ordering DESC';
        }
        return $where;
    }
    
    function getNews(){
        global $db;
        $where = $this->getWhere();
        if($this->category_id)
            $where .= ' AND category_id_wrapper LIKE \'%,'.$this->category_id.',%\'';
        $query = '  SELECT id, title, image, summary, alias, created_time, category_id, category_name, category_alias
                    FROM '.$this->table_name.' 
                    WHERE '.$where.SQL_PUBLISH.'
                    ORDER BY '.$this->getOrdering().'
                    LIMIT '.$this->limit;
        $sql = $db->query($query);
		$result = $db->getObjectList();
		return $result;
    }
    
    function getCategory(){ 
        global $db;
        $query = '  SELECT id, name, alias, alias_wrapper, parent_id, list_parents
                    FROM '.$this->table_category.' 
                    WHERE id = '.$this->category_id.'
                    ORDER BY ordering ASC';
        $db->query($query);
		return $db->getObject();
    }
}