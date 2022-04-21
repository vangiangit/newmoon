<?php
/**
 * @author vangiangfly
 * @category Model
 */
class AlbumModelsAlbum extends FSModels{
    var $category_id = 0;

    function __construct(){
        parent::__construct();
		$this->table_name  = 'fs_album';
		$this->table_category  = 'fs_album_categories';
    }
    
    function getData(){
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
                    WHERE published = 1
                    '.$where.SQL_LANG;
		$sql = $db->query($query);
		$result = $db->getObject();
		return $result;
    }
    
    function getCategoryById($catId = 0){
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
    function getList($catId = 0){
        global $db;
        $code = FSInput::get('code');
        if ($catId)
            $sqlWhere = ' AND n.category_id_wrapper LIKE \'%,'.$catId.',%\' AND alias <> \''.$code.'\'';
        else
            $sqlWhere = '';
        $query = '  SELECT n.id, n.title, n.image, n.alias, n.created_time, n.category_id , n.category_alias, n.summary 
                    FROM '.$this->table_name.' AS n
                    WHERE n.published = 1 '.$sqlWhere.SQL_PUBLISH.SQL_LANG.'
                    ORDER BY n.ordering DESC';
        $result = $db->query($query); 
        return $db->getObjectList();
    }

    function getListOtherImages($id = 0){
        global $db;
        $query = '  SELECT *
                    FROM fs_album_images
                    WHERE record_id = '.$id.'
                    ORDER BY ordering';
        $sql = $db->query($query);
        $result = $db->getObjectList();
        return $result;
    }
}