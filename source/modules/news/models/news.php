<?php
/**
 * @author vangiangfly
 * @category Model
 */
class NewsModelsNews extends FSModels{
    var $category_id = 0;

    function __construct(){
        parent::__construct();
		$this->table_name  = 'fs_news';
		$this->table_category  = 'fs_news_categories';
    }
    
    function getNews(){
        global $db;
        $code = FSInput::get('code');
		if($code){
            $where = ' AND alias = \''.$code.'\'';
		} else {
			$id = FSInput::get('id',0,'int');
			$where = ' AND id = '.$id;	
		}
        $query = '  SELECT *
                    FROM '.$this->table_name.' 
                    WHERE published = 1 '.SQL_LANG.'
                    '.$where;
		$sql = $db->query($query);
		$result = $db->getObject();
		return $result;
    }
    
    function getCategoryById($catId = 0)
	{
        global $db;
        if(!$catId)
            return '';
        $query = '  SELECT id, name, alias, icon, updated_time
                    FROM '.$this->table_category.'  
                    WHERE id = '.$catId.SQL_LANG;
        
        $sql = $db->query($query);
        $result = $db->getObject();
        return $result;
	}
    
    /**
     * Lấy danh sách dự án
     * @return Object list
     */ 
    function getOtherNewsList($catId = 0)
    {
        global $db;
        $code = FSInput::get('code');
        if ($catId)
            $sqlWhere = ''; // ' AND n.category_id_wrapper LIKE \'%,'.$catId.',%\' AND alias <> \''.$code.'\'';
        else
            $sqlWhere = '';
        $query = '  SELECT n.id, n.title, n.image, n.alias, n.created_time, n.category_id , n.category_alias, n.summary 
                    FROM '.$this->table_name.' AS n
                    WHERE n.published = 1 '.$sqlWhere.SQL_PUBLISH.SQL_LANG.'
                    ORDER BY RAND()
                    LIMIT 3';
        $result = $db->query($query); 
        return $db->getObjectList();
    }
    
    function getLatestNews(){
        global $db;
        $code = FSInput::get('code');
        $query = '  SELECT n.id, n.title, n.image, n.alias, n.created_time, n.category_id , n.category_alias, n.summary 
                    FROM '.$this->table_name.' AS n
                    WHERE n.published = 1 AND n.alias <> \''.$code.'\' '.SQL_PUBLISH.' AND n.category_id_wrapper LIKE \'%,'.$this->category_id.',%\'
                    ORDER BY n.ordering DESC
                    LIMIT 6';
        $result = $db->query($query); 
        return $db->getObjectList();
    }
    
    function getPreviousNews($id = 0, $latest_ids = 0){
        global $db;
        $code = FSInput::get('code');
        $query = '  SELECT n.id, n.title, n.image, n.alias, n.created_time, n.category_id , n.category_alias, n.summary 
                    FROM '.$this->table_name.' AS n
                    WHERE n.published = 1 AND n.id < \''.$id.'\' AND n.id NOT IN ('.$latest_ids.')'.SQL_PUBLISH.' AND n.category_id_wrapper LIKE \'%,'.$this->category_id.',%\'
                    ORDER BY n.ordering DESC
                    LIMIT 6';
        $result = $db->query($query); 
        return $db->getObjectList();
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
        $categories = $db->getObjectList();
        $tree_class  = FSFactory::getClass('tree','tree/');
		return $list = $tree_class -> indentRows($categories, 3);
    }
    
    function getListProduct($where = '', $limit = 3){
        global $db;
        $query = '  SELECT id, name, summary, price, price_old, discount, discount_unit, image, alias, category_alias, hot, new, origin_title, status
                    FROM fs_products
                    WHERE published = 1 '.$where.SQL_LANG.'
                    ORDER BY ordering DESC
                    LIMIT '.$limit;
		$sql = $db->query($query);
		$result = $db->getObjectList();
		return $result;
    }
    
    function getCommentsByNews($id){
        global $db;
        $query = '  SELECT *
                    FROM fs_news_comments 
                    WHERE published = 1 AND record_id = '.$id.'
                    ORDER BY id DESC';
		$sql = $db->query($query);
		$result = $db->getObjectList();
		return $result;
    }

    function getMenuList($id){
        global $db;
        $query = '  SELECT *
                    FROM fs_news_menus 
                    WHERE post_id = '.$id.'
                    ORDER BY parent_id ASC, ordering ASC';
		$sql = $db->query($query);
		$result = $db->getObjectListByKey('id');
        // $tree_class  = FSFactory::getClass('tree','tree/');
		// return $list = $tree_class -> indentRows($result);
		return $result;
    }
    
    function products_suggest(){
        global $db;
        $limitSuggest = 4;
        $listId = '0';
        $list = array();
        if(isset($_SESSION['products-viewed'])){
            /* Lấy các sản phẩm đã xem */
            $listCats = '0';
            $query = '  SELECT id, name, summary, price, price_old, discount, discount_unit, image, alias, category_id, category_alias, hot, new
                        FROM fs_products 
                        WHERE published = 1 AND id IN ('.$_SESSION['products-viewed'].')
                        ORDER BY ordering DESC
                        LIMIT '.$limitSuggest;
            $sql = $db->query($query);
    		$result = $db->getObjectList();
            foreach($result as $item){
                $list[] = $item;
                $listId .= ','.$item->id;
                $listCats .= ','.$item->category_id;
            }
            $total = count($list);
            if($total >= $limitSuggest)
                return $list;
            $limitSuggest = $limitSuggest-$total;
            /* Lấy sản phẩm cùng chuyên mục sản phẩm đã xem */
            $query = '  SELECT id, name, summary, price, price_old, discount, discount_unit, image, alias, category_id, category_alias, hot, new
                        FROM fs_products 
                        WHERE published = 1 AND category_id IN ('.$listCats.') AND id NOT IN ('.$listId.')
                        ORDER BY ordering DESC
                        LIMIT '.$limitSuggest;
            $sql = $db->query($query);
    		$result = $db->getObjectList();
            foreach($result as $item){
                $list[] = $item;
                $listId .= ','.$item->id;
                $listCats .= ','.$item->category_id;
            }
            $total = count($list);
            if($total >= $limitSuggest)
                return $list;
            $limitSuggest = $limitSuggest-$total;
        }
        /* Nếu thiếu lấy ngẫu nhiên */
        $query = '  SELECT id, name, summary, price, price_old, discount, discount_unit, image, alias, category_alias, hot, new
                    FROM fs_products 
                    WHERE published = 1 AND id NOT IN ('.$listId.')
                    ORDER BY RAND()
                    LIMIT '.$limitSuggest;
        $sql = $db->query($query);
		$result = $db->getObjectList();
        foreach($result as $item){
            $list[] = $item;
        }
        return $list;
    }
}