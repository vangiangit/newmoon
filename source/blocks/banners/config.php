<?php 
$params = array (
	'suffix' => array(
    	'name' => 'Hậu tố',
    	'type' => 'text',
    	'default' => '_banner'
	),
	'category_id' => array(
		'name'=>'Nhóm banner',
		'type' => 'select',
		'value' => getBannersCategory(),
	),
    'style' => array(
    	'name'=>'Style',
    	'type' => 'select',
    	'value' => array(
			'default' => 'Default',
			'default_text' => 'Default (Text)',
            'multiple' => 'Multiple',
			'comments' => 'Comments',
            'slideshow' =>'Slideshow (Next & Prev)',
            'slideshow_page' =>'Slideshow (Page)'
        )
	),
    
    'width' => array (
		'name' => 'Rộng (px)',
		'type' => 'text',
		'default'=>'0'
	),
    'float' => array (
		'name' => 'Canh (align)',
		'type' => 'select',
		'value'=>array(
            'none'=>'Không',
            'left'=>'Trái',
            'right'=>'Phải'
        )
	),
    'margin_pos' => array (
		'name' => 'Nơi cách',
		'type' => 'select',
		'value'=>array(
            '_'=>'Không',
            'margin-top'=>'Trên',
            'margin-left'=>'Trái',
            'margin-right'=>'Phải',
            'margin-bottom'=>'Dưới'
        )
	),
    'margin_value' => array (
		'name' => 'Khoảng cách (px)' ,
		'type' => 'text',
		'default' => '0'
	)
);
function getBannersCategory(){
	global $db;
	$query = "  SELECT name, id 
				FROM fs_banners_categories WHERE 1=1 ".SQL_FILTER_BY_ADLANG;
	$sql = $db->query($query);
	$result = $db->getObjectList();
	if(!$result)
	     return;
	$arr_group = array();
    foreach($result as $item){
    	$arr_group[$item -> id] = $item -> name;
    }
	return $arr_group;
}
?>