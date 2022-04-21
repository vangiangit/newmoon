<?php
/**
 * @author vangiangfly
 * @category Contronller
 */ 
require_once(PATH_BASE.'blocks/news/models/news.php');
class NewsBControllersNews{
    function display($parameters, $title, $blockId = 0){
        $Itemid = 6;
        $style = $parameters->getParams('style');
        $style = $style ? $style : 'default';
        
        $model = new NewsBModelsNews();
        
        $suffix = $parameters->getParams('suffix');
        
        $where = $parameters->getParams('where');
        $model->where = $where ? $where : 'default';
        
        $order_by = $parameters->getParams('order_by');
        $model->order_by = $order_by ? $order_by : 'default';
        
        $limit = $parameters->getParams('limit');
        $model->limit = $limit ? $limit : 4;
        
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
        $bLink = FSRoute::_('index.php?module=news&view=home&Itemid='.$Itemid);

        $model->category_id = $category_id ? $category_id : 0;

        $cat = $cats = false;
        if ($model->category_id) {
            $cat = $model->getCategory();
        }else
            $cats = $model->getCategories();

        $list = $model->getList();

        require(PATH_BASE.'blocks/news/views/'.$style.'.php');
    }
}