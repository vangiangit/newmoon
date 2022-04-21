<?php
$title = @$data ? FSText :: _('Edit'): FSText :: _('Add'); 
global $toolbar;
$toolbar->setTitle($title);
$toolbar->addButton('save_add',FSText :: _('Save and new'),'','save_add.png'); 
$toolbar->addButton('apply',FSText :: _('Apply'),'','apply.png'); 
$toolbar->addButton('Save',FSText :: _('Save'),'','save.png'); 
$toolbar->addButton('back',FSText :: _('Cancel'),'','back.png');   
$this -> dt_form_begin(0);
$strPath = '';
foreach ($this->model->arr_img_paths_other as $val){
    if($strPath == '')
        $strPath = implode(',', $val);
    else
        $strPath .= ';'.implode(',', $val);
}
?>
<link rel="stylesheet" type="text/css" href="<?php echo URL_ADMIN?>templates/default/js/dropzone/dropzone.css"/>
<input type="hidden" id="dropzone_config" name="dropzone_config" value="<?php if(isset($data)) echo fsEncode('edit|'.$data->id.'|products|'.$strPath); else echo fsEncode('add|'.session_id().'|products|'.$strPath); ?>" />
<input type="hidden" name="data_id" value="<?php if(isset($data)) echo $data->id; else 0; ?>" />
<div id="tabs">
    <ul>
        <li><a href="#fragment-1"><?php echo FSText::_("Thông tin cơ bản"); ?></a></li>
        <li><a href="#fragment-2"><?php echo FSText::_("Chi tiết"); ?></a></li>
        <li><a href="#fragment-3"><?php echo FSText::_("SEO"); ?></a></li>
    </ul>
    <div id="fragment-1">
        <table cellspacing="1" class="admintable">
            <?php
            TemplateHelper::dt_edit_selectbox(FSText::_('Loại sản phẩm'),'category_id',@$data -> category_id,0,$categories,$field_value = 'id', $field_label='treename',$size = 1,0);
            TemplateHelper::dt_edit_text(FSText :: _('Name'),'name',@$data -> name);?>
            <?php
            TemplateHelper::dt_edit_text(FSText :: _('Summary'),'summary',@$data -> summary,'',100,9);
            //TemplateHelper::dt_edit_text(FSText :: _('Giá'),'price_old',@$data -> price_old, 0, '20');
            //TemplateHelper::dt_edit_selectbox('Loại giảm giá','discount_unit',@$data -> discount_unit,0,array('price'=>'Giá trị'),$field_value = '', $field_label='');
            //TemplateHelper::dt_edit_text(FSText :: _('Giảm giá'), 'discount', @$data -> discount, 0, '20');
            TemplateHelper::dt_edit_image(FSText :: _('Image'),'image',str_replace('/original/','/tiny/',URL_ROOT.@$data->image), '100px');
            TemplateHelper::dt_edit_text(FSText :: _('Ordering'),'ordering',@$data -> ordering,@$maxOrdering,'10');
            //TemplateHelper::dt_checkbox(FSText::_('Tình trạng'),'status',@$data -> status,1);
            TemplateHelper::dt_checkbox(FSText::_('Nổi bật'), 'hot', @$data -> hot, 0);
            //TemplateHelper::dt_checkbox(FSText::_('Mới'), 'new', @$data->new, 0);
            TemplateHelper::dt_checkbox(FSText::_('Published'),'published',@$data -> published,1);
            ?>
        </table>
    </div><!--end: #fragment-1-->
    <div id="fragment-2">
        <table cellspacing="1" class="admintable" style="width: 100%">
            <?php
            TemplateHelper::dt_edit_text(FSText :: _('Chi tiết'), 'description', @$data -> description, '', 700, 600, 1);
            ?>
            <tr style="display: none">
                <td class="label key">Thêm ảnh</td>
                <td class="value">
                    <div id="dropzone-image">
                        <div class="dropzone-image dropzone">
                            <div class="dropzone-thumb">

                            </div>
                        </div>
                        <a class="btn-upload" href="javascript:void(0);">Thêm ảnh</a>
                    </div>
                </td>
            </tr>
        </table>
    </div><!--end: #fragment-2-->
    <div id="fragment-3">
        <table cellspacing="1" class="admintable">
            <?php
            TemplateHelper::dt_edit_text(FSText :: _('Alias'),'alias',@$data -> alias,'',60,1,0,FSText::_("Can auto generate"));
            TemplateHelper::dt_edit_text(FSText :: _('Title'),'seo_title',@$data -> seo_title,'',100,1);
            TemplateHelper::dt_edit_text(FSText :: _('Meta keyword'),'seo_keyword',@$data -> seo_keyword,'',100,1);
            TemplateHelper::dt_edit_text(FSText :: _('Meta description'),'seo_description',@$data -> seo_description,'',100,9);
            ?>
        </table>
    </div><!--end: #fragment-3-->
</div>
<input type="hidden" name="session_id" value="<?php echo session_id();?>" />
<?php 		        	
$this -> dt_form_end(@$data,0);
?>
<script type="text/javascript" src="<?php echo URL_ADMIN?>templates/default/js/dropzone/dropzone.js"></script>
<script type="text/javascript" src="<?php echo URL_ADMIN?>templates/default/js/dropzone/upload.js"></script>
<script type="text/javascript">
    $(document).ready(function(){ $("#tabs").tabs();});
</script>