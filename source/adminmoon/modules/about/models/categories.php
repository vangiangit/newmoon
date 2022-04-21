<?php
class AboutModelsCategories extends ModelsCategories{
    function __construct(){
        parent::__construct();
        $this->limit = 1000;
        $this->table_items = 'fs_about';
        $this->table_name = 'fs_about_categories';
        $this->check_alias = 1;
        $this->call_update_sitemap = 1;
        $this->field_except_when_duplicate = array(array('list_parents', 'id'), array('alias_wrapper', 'alias'));
    }
}