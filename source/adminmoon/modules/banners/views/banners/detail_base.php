<table cellspacing="1" class="admintable" style="width: 100%">
	<tr>
		<td valign="top" class="key">
			Danh mục
		</td>
		<td>
			<select name="category_id" id="category_id">
				<?php 
				// selected category
				$cat_compare  = 0;
				if(@$data->category_id)
				{
					$cat_compare = $data->category_id;
				} 
				$i = 0;
				foreach ($categories as $cat_item) {
					$checked = "";
					if(!$cat_compare && !$i){
						$checked = "selected=\"selected\"";
					} else {
						if($cat_compare == $cat_item->id)
							$checked = "selected=\"selected\"";
					}
				?>
					<option value="<?php echo $cat_item->id; ?>" <?php echo $checked; ?> ><?php echo $cat_item->name;  ?> </option>	
				<?php 
					$i ++;
				}?>
			</select>
		</td>
	</tr>		
	<tr>
		<td valign="top" class="key">
					<?php echo  FSText::_('Name'); ?>
				</td>
				<td>
					<input type="text" name='name' value="<?php echo @$data->name; ?>"  id="name" class="text">
					
				</td>
	</tr>
	<tr>
		<td valign="top" class="key">
					<?php echo  FSText::_('Link'); ?>
				</td>
				<td>
					<input type="text" name='link' value="<?php echo @$data->link; ?>"  id="link" class="text">
					
				</td>
	</tr>
	<tr>
		<td valign="top" class="key">
			Loại banner
		</td>
		<td>
			<select name="type" id="type" >
				<?php 
				// selected category
				$cat_compare  = 0;
				if(@$data->type)
				{
					$cat_compare = $data->type;
				} 
				$i = 0;
				foreach ($array_type as $key => $name) {
					$checked = "";
					if(!$cat_compare && !$i){
						$checked = "selected=\"selected\"";
					} else {
						if($cat_compare == $key)
							$checked = "selected=\"selected\"";
					}
						
				?>
					<option value="<?php echo $key; ?>" <?php echo $checked; ?> ><?php echo $name;  ?> </option>	
				<?php 
					$i ++;
				}?> 
			</select>
		</td>
	</tr>
	<tr>
		<td valign="top" class="key">
			<?php echo  FSText::_('Image'); ?> (Nếu bạn chọn loại banner là ảnh)
		</td>
		<td>
			<?php if(@$data->image){?>
			<img style="max-width: 500px;" alt="<?php echo $data->name?>" src="<?php echo URL_ROOT.$data->image; ?>" /><br/>
			<?php }?>
			<br/>
			<input type="file" name="image"  />
		</td>
	</tr>
	<tr>
		<td valign="top" class="key">
			<?php echo FSText :: _('Nội dung'); ?>  (Nếu bạn chọn loại banner là HTML)
		</td>
		<td>
			<?php
			$oFCKeditor1 = new FCKeditor('content') ;
			$oFCKeditor1->Value		= @$data->content;
			$oFCKeditor1->Width = 650;
			$oFCKeditor1->Height = 450;
			$oFCKeditor1->Create() ;
			?>
		</td>

	</tr>
    <?php 
    //TemplateHelper::dt_edit_selectbox(FSText::_('For menu'),'for_menu',@$data -> for_menu, 0, $menus, $field_value = 'id', $field_label='name', $size = 1, 0, 1);
    //TemplateHelper::dt_edit_selectbox(FSText::_('For product'),'for_product',@$data -> for_product, 0, $catProducts, $field_value = 'id', $field_label='name', $size = 1, 0, 1);
    TemplateHelper::dt_checkbox(FSText::_('Published'),'published',@$data -> published, 1);
    ?>
	<tr>
		<td valign="top" class="key">
			<?php echo FSText :: _('Ordering'); ?>
		</td>
		<td>
			<input type="text" name='ordering' value="<?php echo (isset($data->ordering)) ? @$data->ordering : @$maxOrdering; ?>"/>
		</td>
	</tr>
</table>
