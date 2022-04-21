<?php
/**
 * @author vangiangfly
 * @category Contronller
 */ 
require_once(PATH_BASE.'blocks/products/models/products.php');
class ProductsBControllersProducts{
    function display($parameters, $title, $blockId = 0){
        global $tmpl;
        $style = $parameters->getParams('style');
        $style = $style ? $style : 'default';
        
        $model = new ProductsBModelsProducts();
        
        $suffix = $parameters->getParams('suffix');
        
        $where = $parameters->getParams('where');
        $model->where = $where ? $where : 'default';
        
        $order_by = $parameters->getParams('order_by');
        $model->order_by = $order_by ? $order_by : 'default';
        
        $limit = $parameters->getParams('limit');
        $model->limit = $limit ? $limit : 6;
        
        $margin_pos = $parameters->getParams('margin_pos' );
		$margin_value = (int)$parameters->getParams('margin_value' );
        
        $cssText = '';
        if($margin_value)
            $cssText .= $margin_pos.':'.$margin_value.'px;';

        $bLink = FSRoute::_('index.php?module=product&view=home');
        if($style == 'default' && $where == 'hot')
            $bLink = FSRoute::_('index.php?module=product&view=home&where=hot');

        $category_id = $parameters->getParams('category_id');
        $model->category_id = $category_id ? $category_id : 0;
        if ($model->category_id) {
            $cat = $model->getCategory();
            $bLink = FSRoute::_('index.php?module=product&view=cat&id=' . $cat->id . '&ccode=' . $cat->alias);
        }

        $list = $model->getProducts();
        require(PATH_BASE.'blocks/products/views/'.$style.'.php');
    }
}