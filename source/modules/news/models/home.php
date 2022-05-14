<?php
/**
 * @author vangiangfly
 * @category Models
 */ 
class NewsModelsHome extends FSModels{

    function __construct(){
        parent::__construct();
        $this->table_name = 'fs_news';
        $this->table_category = 'fs_news_categories';
        $this->limit = 10;
    }
    
    /**
     * Lấy danh sách tin
     * @return Object list
     */ 
    function getNewsList($sqlWhere = ''){
        global $db;
        $query = '  SELECT id, title, image, summary, alias, created_time, category_id, category_name, category_alias, creator, creator_id, creator_name, creator_avatar
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
    function getTotal($sqlWhere = ''){
        global $db;
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
    
    /**
     * Lấy danh mục
     * @return Object list
     */ 
    public function getListCats(){
        global $db;
        $query = '  SELECT id, name, alias, level, parent_id, alias, list_parents
                    FROM '.$this->table_category.'
                    WHERE published = 1 '.SQL_LANG.'
                    ORDER BY ordering ASC';
        $result = $db->query($query);
        return $db->getObjectList();
    }

    /**
     * Lấy danh mục
     * @return Object
     */
    function getAuthor(){
        global $db;
		$code = FSInput::get('code');
		if($code){
			$where = ' AND username = \''.$code.'\'';
		} else {
			$id = FSInput::get('id',0,'int');
			if(!$id)
				die('Not exist this url');
			$where = ' AND id = '.$id.' ';
		}
        $query = '  SELECT id, username, fullname, avatar
                    FROM fs_users 
                    WHERE published = 1 '.$where;
		$db->query($query);
		return $db->getObject();
	}
}