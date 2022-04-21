<?php
class MenuBModelsMenu{
    function getList($group){
        global $db;
        if (!$group)
            return;
        $sql = 'SELECT id, link, name, image, level, parent_id, target
				FROM fs_menus_items
				WHERE published  = 1 AND group_id = '.intval($group).SQL_LANG.'
				ORDER BY ordering';
        $db->query($sql);
        $result = $db->getObjectList();
        $tree_class  = FSFactory::getClass('tree','tree/');
		return $list = $tree_class -> indentRows($result);
    }
}