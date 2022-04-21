<?php
$title = @$data ? FSText :: _('Edit'): FSText :: _('Add'); 
global $toolbar;
$toolbar->setTitle($title);
$toolbar->addButton('apply',FSText :: _('Apply'),'','apply.png'); 
$toolbar->addButton('Save',FSText :: _('Save'),'','save.png'); 
$toolbar->addButton('back',FSText :: _('Cancel'),'','back.png');   
$this -> dt_form_begin(1);
//TemplateHelper::dt_edit_text(FSText :: _('ID'),'id',@$data -> id,'','20');
TemplateHelper::dt_edit_text(FSText :: _('Email'),'email',@$data -> email);
$this -> dt_form_end(@$data,1);
?>