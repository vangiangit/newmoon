<?php
class MembersBModelsMembers{
    var $where;
    var $order_by;
    var $limit;
    var $category_id;
    function __construct(){
		$this->table_name  = 'fs_members';
    }
    
    function getList(){
        global $db;
        $query = '  SELECT id, username, avatar, level_text, point
                    FROM '.$this->table_name.' 
                    WHERE published = 1
                    ORDER BY point DESC
                    LIMIT '.$this->limit;
        $sql = $db->query($query);
		$result = $db->getObjectList();
		return $result;
    }
}