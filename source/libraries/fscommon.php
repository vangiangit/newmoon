<?php 
class FSCommon{
    /**
     * Vùng miền
     */ 
    var $regions = array(
        1 => 'Miền Bắc',
        2 => 'Miền Trung',
        3 => 'Miền Nam'
    ); 
    
    /**
     * Tỉnh/thành phố
     */ 
    var $cities = array();  
    
    var $cities_regions = array(
        1 => array(),
        2 => array(),
        3 => array()
    );  
    
    /**
     * Tỉnh/thành phố
     */ 
    var $member_type = array(
        1 => 'Chính chủ',
        2 => 'Môi giới',
        3 => 'Chủ dự án',
        4 => 'Khác'
    );
    
    /**
     * Kiểu BĐS
     */ 
    var $land_style = array(
        1 => 'Pent House',
        2 => 'Biệt thự / Villa',
        3 => 'Nhà mặt tiền',
        4 => 'Nhà trong hẻm'
    );
    
    /**
     * Cần bán
     */ 
    var $land_sale = array();
    
    /**
     * Cho thuê
     */ 
    var $land_rent = array();
    
    /**
     * Sang nhượng
     */ 
    var $land_transfer = array();
    
    /**
     * Hình thức BĐS
     */ 
    var $land_form = array(
        1 => 'BĐS cá nhân',
        2 => 'Dự án'
    );
    
    /**
     * Tình trạng pháp lý
     */
    var $land_legal_status = array(
        1 => 'SĐCC'
    );
    
    /**
     * Hướng nhà
     */
    var $land_direction = array(
        1 => 'Đông',
        2 => 'Tây',
        3 => 'Nam',
        4 => 'Bắc',
        5 => 'Đông-Bắc',
        6 => 'Tây-Bắc',
        7 => 'Tây-Nam',
        8 => 'Đông-Nam'
    );
    
    /**
     * Loại bất động sản
     */
    var $land_type = array(
        'sale' => 'BĐS Bán',
        'rent' => 'BĐS Cho thuê',
        'transfer' => 'Sang nhượng',
        'project' => 'Dự án'
    ); 
    
    function __construct(){
        global $db;
        $treeClass  = FSFactory::getClass('tree','tree/');
            
        $cities = $db->get_records('', 'fs_local_cities','id, regions_id, name');
        foreach($cities as $item){
            $this->cities[$item->id] = $item->name;
            $this->cities_regions[$item->regions_id][$item->id] = $item->name;
        }
        
        $land_sale = $db->get_records(' `type` = \'sale\'', 'fs_lands_categories','id, name, alias, level, parent_id, alias, list_parents', 'ordering ASC');
        $land_sale = $treeClass->indentRows($land_sale, 3);
        foreach($land_sale as $item)
            $this->land_sale[$item->id] = $item->treename;
            
        $land_rent = $db->get_records(' `type` = \'rent\'', 'fs_lands_categories','id, name, alias, level, parent_id, alias, list_parents', 'ordering ASC');
        $land_rent = $treeClass->indentRows($land_rent, 3);
        foreach($land_rent as $item)
            $this->land_rent[$item->id] = $item->treename;
            
        $land_transfer = $db->get_records(' `type` = \'transfer\'', 'fs_lands_categories','id, name, alias, level, parent_id, alias, list_parents', 'ordering ASC');
        $land_transfer = $treeClass->indentRows($land_transfer, 3);
        foreach($land_transfer as $item)
            $this->land_transfer[$item->id] = $item->treename;
    }
}