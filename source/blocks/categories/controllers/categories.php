<?php
/**
 * @author vangiangfly
 * @category Contronller
 */ 
require_once(PATH_BASE.'blocks/categories/models/categories.php');
class CategoriesBControllersCategories{
    function display($parameters, $title, $blockId = 0){
        global $tmpl;
        
        $style = $parameters->getParams('style');
        $style = $style ? $style : 'default';
        
        $model = new CategoriesBModelsCategories();

        $suffix = $parameters->getParams('suffix');
        
        $order_by = $parameters->getParams('order_by');
        $model->order_by = $order_by ? $order_by : 'default';
        
        $limit = $parameters->getParams('limit');
        $model->limit = $limit ? $limit : 10;
        
        $margin_pos = $parameters->getParams('margin_pos' );
		$margin_value = (int)$parameters->getParams('margin_value' );
        
        $cssText = '';
        if($margin_value)
            $cssText .= $margin_pos.':'.$margin_value.'px;';

        $cats = $model->getCategories();
        if(!$cats)
            return;

        require(PATH_BASE.'blocks/categories/views/'.$style.'.php');
    }
}