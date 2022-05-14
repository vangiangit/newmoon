<!-- HEAD -->
	<?php 
	
	$title = FSText :: _('Configuration'); 
	global $toolbar;
	$toolbar->setTitle($title);
	$toolbar->addButton('Save',FSText :: _('Save'),'','save.png'); 
	?>
<!-- END HEAD-->

<!-- BODY-->
<div class="form_body">
    <div class="form-contents">
	<form action="index.php?module=config" name="adminForm" method="post" enctype="multipart/form-data">
		<table cellspacing="1" class="admintable" style="width: 100%">
		<?php 
        foreach($data as $item) {
            if($item->name == 'license')
                continue;
        ?>
			<tr>
				<td valign="top" class="key">
					<?php echo FSText::_($item->title); ?>
				</td>
				<td>
					<?php 
					switch ($item->data_type) {
						case "bool":
							if($item->value == 1)
							{
								$checktrue = " checked = 'checked' ";	
								$checkfalse = "";
							}
							else
							{
								$checkfalse = " checked = 'checked' ";	
								$checktrue = "";
							}
							echo "<input type='radio' name='$item->name' $checktrue value='1'  /> ".FSText::_('Yes');
							echo "<input type='radio' name='$item->name' $checkfalse value='0' />".FSText::_('No');
							break;	
						case "editor":
							$oFCKeditor = new FCKeditor("$item->name") ;
							$oFCKeditor->BasePath	=  '../libraries/wysiwyg_editor/' ;
							$oFCKeditor->Value		= @$item->value;
							$oFCKeditor->Width = 650;
							$oFCKeditor->Height = 450;
							$oFCKeditor->Create() ;
							break;
                        case "image":
                            if($item -> value){
                                echo '<p><img width="120px" src="'.URL_ROOT.$item -> value.'" /></p>';
                            }
                            echo "<input type='file' name='$item->name' size='70' /> ";
                            break;
                        case 'textarea':
                            echo '<textarea style="width: 100%; height: 250px" name="'.$item->name.'">'.$item->value.'</textarea>';
                            break;
                        case "text":
                        default:
                            echo "<input type='text' name='$item->name' value='$item->value' size='70' /> ";
                            break;
                    }
					?>
				</td>
			</tr>
		<?php } ?>	
		</table>
		<?php if(@$data->id) { ?>
		<input type="hidden" value="<?php echo $data->id; ?>" name="cid">
		<?php }?>
		<input type="hidden" value="config" name="module">
		<input type="hidden" value="" name="task">
		<input type="hidden" value="0" name="boxchecked">
	</form>
    </div><!--end: .form-contents-->
</div>
<!-- END BODY-->
