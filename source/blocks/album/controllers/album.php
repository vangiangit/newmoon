<?php
/**
 * @author vangiangfly
 * @category Contronller
 */ 
require_once(PATH_BASE.'blocks/album/models/album.php');
class AlbumBControllersAlbum{
    function display($parameters, $title, $blockId = 0){
        $Itemid = 6;
        $style = $parameters->getParams('style');
        $style = $style ? $style : 'default';
        
        $model = new AlbumBModelsAlbum();
        
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
        if ($model->category_id) {
            $cat = $model->getCategory();
            // $bLink = FSRoute::_('index.php?module=news&view=cat&id=' . $cat->id . '&ccode=' . $cat->alias . '&Itemid=' . $Itemid);
        }
        $list = $model->getList();

        require(PATH_BASE.'blocks/album/views/'.$style.'.php');
    }
}