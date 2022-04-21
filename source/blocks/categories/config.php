<?php 
$params = array(
	'suffix' => array(
    	'name'  => 'Hậu tố',
    	'type'  => 'text',
    	'default'=> '_categories'
	),
    'limit' =>array(
    	'name'  => 'Limit',
    	'type'  => 'text',
    	'default'=> '3'
	),
    'style' => array(
    	'name'=>'Style',
    	'type' => 'select',
    	'value' => array(
            'default' => 'Default'
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