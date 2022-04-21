<?php 
$title = isset($data)?"S&#7917;a b&#7843;ng":"Tạo mới bảng"; 
global $toolbar;
$toolbar->setTitle($title);
if(isset($data)){
	$toolbar->addButton('filter',FSText::_("B&#7897; l&#7885;c"),'','filter-export.png');
	$toolbar->addButton('apply_edit',FSText::_('L&#432;u t&#7841;m'),'','apply.png'); 
	$toolbar->addButton('save_edit',FSText::_('L&#432;u'),'','save.png'); 
	$tablename = FSInput::get('tablename');
} else {
	$toolbar->addButton('apply_new',FSText::_('L&#432;u t&#7841;m'),'','apply.png'); 
	$toolbar->addButton('save_new',FSText::_('L&#432;u'),'','save.png'); 
}
$toolbar->addButton('cancel',FSText::_('Tho&#225;t'),'','cancel.png');
$max_ordering = 0;
?>
<div class="form_body">
	<form class="form-contents" action="index.php?module=<?php echo $this -> module;?>&view=<?php echo $this -> view;?>" name="adminForm" method="post" enctype="multipart/form-data">
		<fieldset>
			<legend>Tạo tên bảng</legend>
			<div id="tabs">
				<p class="notice">Tên bảng chỉ chứa các: chữ cái, số, gạch dưới. Tránh các bảng đặc biệt gồm : <strong>tables, categories, filters, favourites, images</strong>
				</p>
				<table>
					<tr>
						<td>Tên bảng&nbsp;</td>
						<td>
						<?php if(isset($data)){ ?> 	
							fs_extends_<input type="text" name = "table_name"  value = "<?php echo substr($tablename,11); ?>"  <?php echo $default_table?'disabled="disabled" ':''?> />
							<input type="hidden" name = "table_name_begin"  value = "<?php echo substr($tablename,11); ?>" />
						<?php } else { ?>
							 fs_extends_<input type="text" name = "table_name"  />
						<?php } ?>
						</td>
					</tr>
				</table>
			</div>
		</fieldset>
		<fieldset>
			<legend>Tạo trường cho bảng </legend>
			<div id="tabs">
		    	<p class="notice">Tên trường chỉ chứa các: chữ cái, số ,gạch dưới. Không đặt tên trường (kể cả viết hoa) là: <strong>id, productid, cateogoryid, manufactory, fields_groups, models.</strong></p>
		    	<br/>
		        <table cellpadding="5" class="field_tbl" width="100%" border="1" bordercolor="red">
		        	<tr>
		        		<td>Tên hiển thị</td>
		        		<td>Tên trường</td>
		        		<td>Kiểu dữ liệu</td>
		        		<td>Xóa trường</td>
		        	</tr>
		        	<?php $i = 0;?>
		        	<?php if(count($data)) { 
		        			foreach ($data as $field) { 
									$field_name = $field->field_name;
					?>
								<?php if(!$field -> is_default){?>
									<tr id="extend_field_exist_<?php echo $i; ?>">
										<td valign="top" class="left_col">
											<input type="text" name='fshow_exist_<?php echo $i;?>' value="<?php echo $field->field_name_display; ?>" />
											<input type="hidden" name='fshow_exist_<?php echo $i;?>_begin' value="<?php echo $field->field_name_display; ?>" />
										</td>
										<td valign="top" class="left_col">
											<input type="text" name='fname_exist_<?php echo $i;?>' value="<?php echo $field_name; ?>" class='fname' onblur="javascript: check_field_name();" />
											<input type="hidden" name='fname_exist_<?php echo $i;?>_begin' value="<?php echo $field_name; ?>" />
										</td>
										<td class="right_col">
											<select name='ftype_exist_<?php echo $i;?>' >
												<option value="varchar" <?php echo  $field->field_type == "varchar" ? "selected=\"selected\"":""; ?>>VARCHAR</option>
												<option value="int" <?php echo  $field->field_type == "int" ? "selected=\"selected\"":""; ?>>INT</option>
												<option value="datetime" <?php echo  $field->field_type == "datetime" ? "selected=\"selected\"":""; ?>>DATETIME</option>
												<option value="text" <?php echo  $field->field_type == "text" ? "selected=\"selected\"":""; ?>>TEXT</option>
											</select>
											<input type="hidden" name='ftype_exist_<?php echo $i;?>_begin' value="<?php echo $field->field_type; ?>" />
										</td>
										<td>
											<a href="javascript: void(0)" onclick="javascript: remove_extend_field(<?php echo $i?>,'<?php echo $field_name; ?>')" ><?php echo  FSText :: _("Remove")?></a>
										</td>
									</tr>
								<?php } else {?>
									<tr id="extend_field_exist_<?php echo $i; ?>">
										<td valign="top" class="left_col">
											<input type="text" name='fshow_exist_<?php echo $i;?>' value="<?php echo $field->field_name_display; ?>" disabled="disabled" />
										</td>
										<td valign="top" class="left_col">
											<input type="text" name='fname_exist_<?php echo $i;?>' value="<?php echo $field_name; ?>" disabled="disabled"  class='fname' />
										</td>
										<td class="right_col">
											<input type="text" name='ftype_exist_<?php echo $i;?>' value="<?php echo strtoupper($field->field_type); ?>" disabled="disabled"  />
										</td>
										<td>
											&nbsp;
										</td>
									</tr>
								<?php }?>
							<?php } ?>
						<?php $i ++ ;?>
						<?php }?>
					<?php for( $i = 0 ; $i< 10; $i ++ ) {?>
					<tr id="tr<?php echo $i; ?>" ></tr>
					<?php }?>
				</table>
				<a href="javascript:void(0);" onclick="addField()" > <?php echo FSText :: _("Thêm trường"); ?> </a>
			</div>
		</fieldset>
		<input type="hidden" value="" name="field_remove" id="field_remove" />
		<input type="hidden" value="<?php echo count($data); ?>" name="field_extend_exist_total" id="field_extend_exist_total" />
		<input type="hidden" value="" name="new_field_total" id="new_field_total" />
		<input type="hidden" value="<?php echo $this -> module;?>" name="module">
		<input type="hidden" value="<?php echo $this -> view;?>" name="view">
		<input type="hidden" value="<?php echo FSInput::get('tablename');?>" name="tablename" />
		<input type="hidden" value="" name="task" />
		<input type="hidden" value="0" name="boxchecked" />
	</form>
</div><!--end: .form_body-->
<script type="text/javascript">
	var i = 0;
	function   addField()
	{
		area_id = "#tr"+i;
		htmlString = "<td>" ;
		htmlString +=  "<input type=\"text\" name='new_fshow_"+i+"' id='new_fshow_"+i+"'  />";
		htmlString += "</td>";
		htmlString += "<td>" ;
		htmlString +=  "<input type=\"text\" name='new_fname_"+i+"' id='new_fname_"+i+"' class='fname'  onblur='javascript: check_field_name();' />";
		htmlString += "</td>";
		htmlString += "<td>";
		htmlString += "<select name='new_ftype_"+i+"'>";
		htmlString += "<option value=\"varchar\" >VARCHAR</option>";
		htmlString += "<option value=\"int\" >INT</option>";
		htmlString += "<option value=\"datetime\" >DATETIME</option>";
		htmlString += "<option value=\"text\" >TEXT</option>";
		htmlString += "</select>";
		htmlString += "</td>";
		htmlString += "<td>";
		htmlString += "<a href=\"javascript: void(0)\" onclick=\"javascript: remove_new_field("+ i +")\" >" + " X&#243;a" + "</a>";
		htmlString += "</td>";
		$(area_id).html(htmlString);		
		i++;
		$("#new_field_total").val(i);
	}
	//remove extend field exits
	function remove_extend_field(area,fieldname)
	{
		if(confirm("You certain want remove this fiels"))
		{
			remove_field = "";
			remove_field = $('#field_remove').val();
			remove_field += ","+fieldname;
			$('#field_remove').val(remove_field);
			$('#extend_field_exist_'+area).html("");
		}
		return false;
	}
	//remove new extend field 
	function remove_new_field(area)
	{
		if(confirm("You certain want remove this fiels"))
		{
			area_id = "#tr"+area;
			$(area_id).html("");
		}
		return false;
	}
	function check_field_name(){
		var strExp = /^[0-9a-zA-Z_]+$/;
		$('.fname').blur(function(){
			// check regular:
			var val = $(this).val();
			if(!val.match(strExp)){
				$(this).addClass("redborder");
				alert('Chỉ nhập chữ, số và kí tự "_".');
				$(this).focus();
				return false;
			}else{
				$(this).removeClass("redborder");
			}
			// check exist
			var seen = {};
			$('.fname').each(function(){
				 var txt = $(this).val();
				 if (seen[txt]){
				     alert('Các trường không được trùng nhau');
				     $(this).addClass("redborder");
				     $(this).focus();
		     		 return false;
				 } else {
			        seen[txt] = true;
			        $(this).removeClass("redborder");
				 }
			});
		});
	}
</script>