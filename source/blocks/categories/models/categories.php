<?php
class CategoriesBModelsCategories{
    var $category_id;
    var $order_by;
    var $limit;
    var $banner_category;
    
    function __construct(){
		$this->table_name  = 'fs_products';
		$this->table_category  = 'fs_products_categories';
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
    
    /**
     * Lấy danh mục
     * @return Object list
     */ 
    public function getCategories(){
        global $db;
        $query = '  SELECT id, name, alias, level, parent_id, list_parents, icon, total_products
                    FROM '.$this->table_category.'
                    WHERE published = 1 AND show_in_homepage = 1 '.SQL_LANG.'
                    ORDER BY ordering ASC';
        $result = $db->query($query);
        return $db->getObjectList();
    }
}