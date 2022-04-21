<?php
require_once(PATH_BASE.'blocks/members/models/members.php');
class MembersBControllersMembers{
    function display($parameters, $title, $blockId = 0){
        $height = (int)$parameters->getParams('height');
        $cssText = '';
        
        $float = $parameters->getParams('float' );
        $cssText .= 'float:'.$float.';';
        
        $model = new MembersBModelsMembers();
        $model->limit = 6;
        
        $list = $model->getList();
        require(PATH_BASE.'blocks/members/views/default.php');
    }
}