<?php
/**
 * @author vangiangfly
 * @category Model
 */
class StaticsModelsMstatics extends FSModels{
    function __construct()
    {
        parent::__construct();    
        $fstable = FSFactory::getClass('fstable');
		$this->table_name  = $fstable->_('fs_statics');
		$this->table_category  = $fstable->_('fs_statics_categories');
    }
    
    function getNews(){
        global $db;
        $id = FSInput::get('id',0,'int');
		if($id){
			$where = ' AND id = '.$id;				
		} else {
			$code = FSInput::get('code');
			if(!$code)
				die('Not exist this url');
			$where = ' AND alias = \''.$code.'\'';
		}
        $query = '  SELECT *
                    FROM '.$this->table_name.' 
                    WHERE published = 1
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
                    WHERE id = '.$catId;
        
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
        if ($catId)
            $sqlWhere = ' AND n.category_id = '.$catId;
        else
            $sqlWhere = '';
        $query = '  SELECT n.id, n.title, n.image, n.alias, n.created_time, n.category_id , n.category_alias
                    FROM '.$this->table_name.' AS n
                        INNER JOIN '.$this->table_category.' AS nc ON (n.category_id = nc.id) 
                    WHERE n.published = 1 '.$sqlWhere.'
                    ORDER BY n.created_time DESC
                    LIMIT 7';
        $result = $db->query($query); 
        return $db->getObjectList();
    }
}