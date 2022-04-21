<?php
class SearchBControllersSearch{
    function display($parameters, $title, $blockId = 0){
        global $tmpl;
        $style = $parameters->getParams('style');
        $style = $style ? $style : 'default';
        include PATH_BASE.'blocks/search/views/' . $style . '.php';
    }
}