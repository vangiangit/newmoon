<?php 
$params = array(
	'suffix' => array(
		'name' => 'Hậu tố',
		'type' => 'text',
		'default' => '_products'
	),
	'where' => array(
		'name'=>'Sản phẩm',
		'type' => 'select',
		'value' => array(
			'default' => 'Default',
			'hot' =>'Nổi bật',
			'new' => 'Sản phẩm mới'
		)
	),
	'category_id' => array(
		'name'  =>'Danh mục',
		'type'  => 'select',
		'value' => getProductsCategories(),
		'attr' => array('multiple' => 'multiple')
	),
	'limit' =>array(
		'name' => 'Limit',
		'type' => 'text',
		'default' => '5'
	),
    'order_by'=> array(
		'name'=>'Sắp xếp theo',
		'type' => 'select',
		'value' => array('default' => 'Default',
			'increase' =>'Giá tăng dần',
			'discounts' =>'Giá giảm dần'
		)
	),
    'style' => array(
    	'name'=>'Style',
    	'type' => 'select',
    	'value' => array(
            'default' => 'Default',
			'cat' => 'Category',
        )
	),
    'margin_pos' => array (
		'name' => 'Nới cách',
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

function getProductsCategories(){
	global $db;
	$query = " SELECT name, id, parent_id FROM fs_products_categories ORDER BY ordering";
	$db->query($query);
	$list = $db->getObjectList();
	$arr_group = array('0'=>'Chọn danh mục');
	if(!$list)
		return;
	$tree  = FSFactory::getClass('tree','tree/');
	$list = $tree -> indentRows2($list);
	foreach($list as $item){
		$arr_group[$item -> id] = $item -> treename;
	}
	return $arr_group;
}