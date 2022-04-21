<?php 
$params = array(
	'suffix' => array(
				'name' => 'Hậu tố',
				'type' => 'text',
				'default' => '_customers'
				),
    'order_by'=> array(
			'name'=>'Sắp xếp theo',
			'type' => 'select',
			'value' => array('default' => 'Default')
	),
    'style' => array(
    	'name'=>'Style',
    	'type' => 'select',
    	'value' => array(
            'default' => 'Default',
        )
	),
    'limit' =>array(
    	'name' => 'Limit',
    	'type' => 'text',
    	'default' => '4'
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