<?php
$title = @$data ? FSText::_('Edit') : FSText::_('Add');
global $toolbar;
$toolbar->setTitle($title);
$toolbar->addButton('apply', FSText::_('Apply'), '', 'apply.png');
$toolbar->addButton('Save', FSText::_('Save'), '', 'save.png');
$toolbar->addButton('back', FSText::_('Cancel'), '', 'back.png');
$this->dt_form_begin();
TemplateHelper::dt_text(FSText::_('Sản phẩm'), $record->title);
TemplateHelper::dt_text(FSText::_('Danh mục'), $record->category_name);
TemplateHelper::dt_checkbox(FSText::_('Published'), 'published', @$data->published, 1);
TemplateHelper::dt_edit_text(FSText::_('Comment'), 'comment', @$data->comment,'', 100, 9);
TemplateHelper::dt_edit_text(FSText::_('Tên người gửi'), 'name', $data->name);
TemplateHelper::dt_edit_text(FSText::_('Email người gửi'), 'email', $data->email);
$this->dt_form_end(@$data);
?>