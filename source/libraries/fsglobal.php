<?php
class FsGlobal
{
    function __construct()
    {

    }
    function getConfig($name)
    {
        global $db;
        $sql = " SELECT value FROM fs_config WHERE name = '$name' ".SQL_LANG;
        $db->query($sql);
        return $db->getResult();
    }
    function get_all_config()
    {
        global $db;
        $sql = " SELECT * FROM fs_config
				WHERE is_common = 1
			 ".SQL_LANG;
        $db->query($sql);
        $list = $db->getObjectList();
        $array_config = array();
        foreach ($list as $item){
            $array_config[$item->name] = $item->value;
        }
        return $array_config;
    }
}