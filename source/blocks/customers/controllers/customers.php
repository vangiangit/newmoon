<?php
/**
 * @author vangiangfly
 * @category Contronller
 */ 
require_once(PATH_BASE.'blocks/customers/models/customers.php');
class CustomersBControllersCustomers{
    function display($parameters, $title, $blockId = 0){
        $style = $parameters->getParams('style');
        $style = $style ? $style : 'default';
        
        $model = new CustomersBModelsCustomers();
        
        $suffix = $parameters->getParams('suffix');
        
        $where = $parameters->getParams('where');
        $model->where = $where ? $where : 'default';
        
        $order_by = $parameters->getParams('order_by');
        $model->order_by = $order_by ? $order_by : 'default';
        
        $limit = $parameters->getParams('limit');
        $model->limit = $limit ? $limit : 6;
        
        $width = (int)$parameters->getParams('width' );
        $float = $parameters->getParams('float' );
        $margin_pos = $parameters->getParams('margin_pos' );
		$margin_value = (int)$parameters->getParams('margin_value' );
        
        $cssText = '';
        $cssText .= 'float:'.$float.';';
        if($margin_value)
            $cssText .= $margin_pos.':'.$margin_value.'px;';
        if($width)
            $cssText .= 'width:'.$width.'px;';
            
        $category_id = $parameters->getParams('category_id'); 
        $model->category_id = $category_id ? $category_id : 0;
        
        $linkAll = FSRoute::_('index.php?module=customers&view=home');
        $cat = $model->getCategory();
        if($cat){
            $linkAll = FSRoute::_('index.php?module=customers&view=cat&ccode='.$cat->alias.'&id='.$cat->id);
        }
        
        $list = $model->getNews();
        require(PATH_BASE.'blocks/customers/views/'.$style.'.php');
    }
}