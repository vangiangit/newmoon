<?php
/**
 * @author vangiangfly
 * @category Models
 */ 
class AlbumModelsHome extends FSModels{

    function __construct(){
        parent::__construct();
        $this->table_name = 'fs_album';
        $this->table_category = 'fs_album_categories';
        $this->limit = 6;
    }
    
    /**
     * Lấy danh sách tin
     * @return Object list
     */ 
    function getList($catId = 0){
        global $db;
        if ($catId)
            $sqlWhere = ' AND category_id_wrapper LIKE \'%,'.$catId.',%\'';
        else
            $sqlWhere = '';
        $query = '  SELECT id, title, image, summary, alias, created_time, category_id, category_name, category_alias, total_images
                    FROM '.$this->table_name.'
                    WHERE published = 1 '.$sqlWhere.SQL_PUBLISH.SQL_LANG.'
                    ORDER BY ordering DESC';
        $result = $db->query_limit($query, $this->limit, $this->page); 
        return $db->getObjectList();
    }
    
    /**
     * Lấy tổng số tin
     * @return Int
     */
    function getTotal($catId = 0){
        global $db;
        if ($catId)
            $sqlWhere = ' AND category_id = '.$catId;
        else
            $sqlWhere = '';
        $query = '  SELECT count(id)
                    FROM '.$this->table_name.'
                    WHERE published = 1 '.$sqlWhere.SQL_PUBLISH.SQL_LANG;
        $result = $db->query($query);
        $total = $db->getResult();
		return $total;
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