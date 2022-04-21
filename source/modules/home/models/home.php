<?php
/**
 * @author vangiangfly
 * @copyright 2013
 */
class HomeModelsHome extends FSModels{
    function __construct(){
        parent::__construct();
        $this->table_name = 'fs_lands';
        $this->table_category = 'fs_lands_categories';
        $this->limit = 10;
    }
    
    /**
     * Lấy danh sách tin
     * @return Object list
     */ 
    function getList(){
        global $db;
        $query = '  SELECT id, title, image, alias, created_time, category_id, category_alias, category_name
                    FROM '.$this->table_name.'
                    WHERE published = 1 '.SQL_LANG.'
                    ORDER BY id DESC';
        $result = $db->query_limit($query, $this->limit, $this->page); 
        return $db->getObjectList();
    }
    
    /**
     * Lấy tổng số tin
     * @return Int
     */
    function getTotal(){
        global $db;
        $query = '  SELECT count(id)
                    FROM '.$this->table_name.'
                    WHERE published = 1 '.SQL_LANG;
        $result = $db->query($query);
        $total = $db->getResult();
		return $total;
    } 
} 