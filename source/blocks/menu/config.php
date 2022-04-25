<?php 
$params = array(
	'suffix' => array(
		'name' => 'Hậu tố',
		'type' => 'text',
		'default' => '_menu'
	),
	'group' => array(
		'name'  =>'Danh mục',
		'type'  => 'select',
		'value' => getGroups()
	),
    'order_by'=> array(
		'name'=>'Sắp xếp theo',
		'type' => 'select',
		'value' => array(
			'default' => 'Default',
		)
	),
    'style' => array(
    	'name'=>'Style',
    	'type' => 'select',
    	'value' => array(
            'default' => 'Default',
            'nav' => 'Nav',
            'cats' => 'Cats',
        )
	),
	'class' => array(
		'name' => 'class',
		'type' => 'text',
		'default' => ''
	),
);

function getGroups(){
	global $db;
	$query = " SELECT * FROM fs_menus_groups ORDER BY ordering";
	$db->query($query);
	$list = $db->getObjectList();
	$arr_group = array('0'=>'Chọn nhóm');
	if(!$list)
		return;
	foreach($list as $item){
		$arr_group[$item -> id] = $item -> group_name;
	}
	return $arr_group;
}