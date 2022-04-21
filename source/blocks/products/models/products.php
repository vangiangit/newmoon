<?php
class ProductsBModelsProducts{
    var $where;
    var $order_by;
    var $limit;
    var $category_id;

    function __construct(){
		$this->table_name  = 'fs_products';
		$this->table_category  = 'fs_products_categories';
    }
    
    /**
     * Điều kiện lấy sản phẩm
     * 
     * @return string
     */ 
    function getWhere(){
        $where = 'published = 1 '.SQL_LANG;
        switch($this->where){
            case 'new':
                $where .= ' AND `new` = 1';
                break;
            case 'hot':
                $where .= ' AND hot = 1';
                break;
            case 'sales':
                $where .= ' AND discount > 0';
                break;
            default:
                $where .= '';
        }

        if($this->category_id)
            $where .= ' AND category_id_wrapper LIKE \'%,'.$this->category_id.',%\'';
        
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
            case 'increase':
                $where .= ' price_old ASC';
                break;
            case 'discounts':
                $where .= ' price_old DESC';
                break;
            default:
                $where .= ' ordering DESC';
        }
        return $where;
    }
    
    function getProducts(){
        global $db;
        $query = '  SELECT id, name, summary, price, price_old, discount, discount_unit, image, alias, category_alias, hot, new, status, hits, color_choices, origin_title
                    FROM '.$this->table_name.' 
                    WHERE '.$this->getWhere().'
                    ORDER BY '.$this->getOrdering().'
                    LIMIT '.$this->limit;
        $sql = $db->query($query);
		$result = $db->getObjectList();
		return $result;
    }

    function getCategory(){
        global $db;
        $query = '  SELECT id, name, alias, alias_wrapper, parent_id, list_parents, icon
                    FROM '.$this->table_category.' 
                    WHERE id IN ('.$this->category_id.')';
        $sql = $db->query($query);
        return $db->getObject();
    }
}