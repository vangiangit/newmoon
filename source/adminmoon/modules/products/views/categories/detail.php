<?php 
$title = @$data ? FSText::_('Edit'): FSText::_('Add'); 
global $toolbar;
$toolbar->setTitle($title);
$toolbar->addButton('save_add',FSText :: _('Save and new'),'','save_add.png'); 
$toolbar->addButton('apply',FSText::_('Apply'),'','apply.png'); 
$toolbar->addButton('save',FSText::_('Save'),'','save.png'); 
$toolbar->addButton('cancel',FSText::_('Cancel'),'','cancel.png');   
$this -> dt_form_begin();
TemplateHelper::dt_edit_text(FSText :: _('Name'),'name',@$data -> name);
TemplateHelper::dt_edit_text(FSText :: _('Alias'),'alias',@$data -> alias,'',60,1,0,FSText::_("Can auto generate"));
//TemplateHelper::dt_edit_image(FSText :: _('Ảnh'),'icon',URL_ROOT.@$data -> icon);
//TemplateHelper::dt_edit_image(FSText :: _('Banner (width 958px)'),'image',URL_ROOT.@$data -> image, 500);
TemplateHelper::dt_edit_selectbox(FSText::_('Parent'),'parent_id',@$data -> parent_id,0,$categories,$field_value = 'id', $field_label='treename',$size = 10,0,1);
TemplateHelper::dt_edit_text(FSText :: _('Content'),'content',@$data -> content,'',650,450,1);
TemplateHelper::dt_checkbox(FSText::_('Published'),'published',@$data -> published,1);
//TemplateHelper::dt_checkbox(FSText::_('Hiển thị trang chủ'),'show_in_homepage',@$data -> show_in_homepage,0);
TemplateHelper::dt_edit_text(FSText :: _('Ordering'),'ordering',@$data -> ordering,@$maxOrdering,'20');
$this -> dt_form_end(@$data,1,1);
?>