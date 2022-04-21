<?php
class AjaxModelsAjax extends FSModels{
    function __construct(){
        parent::__construct();
    }
    
    function registerNewsletter(){
        $email = FSInput::get('email');
        $created_time = date("Y-m-d H:i:s");
        $sql = "INSERT INTO fs_newsletter (`email`, `created_time`)
                VALUES ('$email', '$created_time')";
        global $db;
        $db->query($sql);
        $id = $db->insert();
        return $id;
    }
    
    function checkEmailExists(){
        global $db;
        $email = FSInput::get('email');
        $query = '  SELECT count(id)
                    FROM fs_newsletter
                    WHERE email = \''.$email.'\''; echo $query;die;
        $result = $db->query($query);
        $total = $db->getResult();
		return $total;
    }
    
    function getTotalByCitiesZone($regions = 0){
        global $db;
        $query = '  SELECT city_id , count(id) AS total
                    FROM fs_lands
                    WHERE published = 1 AND regions_id = '.$regions.'
                    GROUP BY city_id';
        $result = $db->query($query);
        return $db->getObjectListByKey('city_id');
    }

    function get_stories_home(){
        global $db;
        $id = FSInput::get('id', 0);
        $where = '';
        if($id)
            $where = ' AND category_id='.$id;
        $query = '  SELECT id, title, image, summary, category_name
                    FROM fs_stories
                    WHERE published = 1 '.$where.'
                    GROUP BY id DESC';
        $result = $db->query_limit($query, 10, $this->page);
        return $db->getObjectList();
    }

    function get_categories(){
        global $db;
        $query = '  SELECT id, name
                    FROM fs_stories_categories
                    WHERE published = 1 
                    ORDER BY ordering ASC';
        $db->query_limit($query, 10, $this->page);
        return $db->getObjectList();
    }

    function get_stories_rand($id){
        global $db;
        $where = '';
        if($id)
            $where = ' AND category_id='.$id;
        $query = '  SELECT id, title, image, summary, category_name
                    FROM fs_stories
                    WHERE published = 1 '.$where.'
                    GROUP BY RAND()';
        $result = $db->query_limit($query, 10, $this->page);
        return $db->getObjectList();
    }
}