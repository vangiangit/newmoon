<?php  
	global $toolbar;
	$toolbar->setTitle(FSText :: _('Background') );
	$toolbar->addButton('add',FSText :: _('Add'),'','add.png'); 
	$toolbar->addButton('edit',FSText :: _('Edit'),FSText :: _('You must select at least one record'),'edit.png'); 
	$toolbar->addButton('remove',FSText :: _('Remove'),FSText :: _('You must select at least one record'),'remove.png'); 
	$toolbar->addButton('published',FSText :: _('Published'),FSText :: _('You must select at least one record'),'published.png');
	$toolbar->addButton('unpublished',FSText :: _('Unpublished'),FSText :: _('You must select at least one record'),'unpublished.png');
?>
<div class="form_body">
	<form action="index.php?module=<?php echo $this -> module;?>&view=<?php echo $this -> view;?>" name="adminForm" method="post">
		
		<!--	FILTER	-->
		<?php 
			$filter_config  = array();
			$fitler_config['search'] = 1; 
			echo $this -> genarate_filter($fitler_config);
		?>
		<!--	END FILTER	-->
		
		<div class="form-contents">
			<table border="1" class="tbl_form_contents">
				<thead>
					<tr>
					<th width="3%">
						#
					</th>
					<th width="3%">
						<input type="checkbox" onclick="checkAll(<?php echo count($list); ?>);" value="" name="toggle">
					</th>
					<th class="title">
						<?php echo FSText :: _('Default'); ?>
					</th>
					<th class="title">
						<?php echo FSText :: _('Name'); ?>
					</th>
					<th class="title" width="7%">
						<?php echo FSText :: _('Image'); ?>
					</th>
					<th class="title" width="7%">
						<?php echo FSText :: _('Edit'); ?>
					</th>
					<th class="title" width="7%">
						<?php echo  TemplateHelper::orderTable(FSText :: _('Created time'), 'created_time',@$sort_field,@$sort_direct) ; ?>
					</th>
					<th class="title" width="7%">
						<?php echo  TemplateHelper::orderTable(FSText :: _('Id'), 'id',@$sort_field,@$sort_direct) ; ?>
					</th>
				</thead>
				<tbody>
					
					<?php $i = 0; ?>
					<?php if(@$list){?>
						<?php foreach ($list as $row) { ?>
							<?php $link_view = "index.php?module=".$this -> module."&view=".$this -> view."&task=edit&id=".$row->id; ?>
							<tr class="row<?php echo $i%2; ?>">
								<td><?php echo $i+1; ?></td>
								<td>
									<input type="checkbox" onclick="isChecked(this.checked);" value="<?php echo $row->id; ?>"  name="id[]" id="cb<?php echo $i; ?>">
								</td>
								<td>
									<?php echo $row -> is_default ? 'yes' : 'no'; ?>
								</td>
								<td>
									<a href="<?php echo $link_view;?>"  /> <?php echo $row -> name; ?></a>
								</td>
								
								<td>
									<?php if(@$row->image){?>
										<img alt="<?php echo $row->name?>" src="<?php echo URL_IMG_BACKGROUND.$row->image; ?>" width="200" height="200" /><br/>
									<?php }?>
								</td>
<!--								<td><?php echo TemplateHelper::published("cb".($i),$row->published?"unpublished":"published"); ?></td>-->
								<td> <?php echo TemplateHelper::edit($link_view); ?></td>
								<td> <?php echo date('d/m/Y H:i',strtotime($row->created_time))?></td>
								<td><?php echo $row->id; ?></td>
							</tr>
							<?php $i++; ?>
						<?php }?>
					<?php }?>
				</tbody>
			</table>
		</div>
		<div class="footer_form">
			<?php if(@$pagination) {?>
			<?php echo $pagination->showPagination();?>
			<?php } ?>
		</div>
		
		<input type="hidden" value="<?php echo @$sort_field; ?>" name="sort_field">
		<input type="hidden" value="<?php echo @$sort_direct; ?>" name="sort_direct">
		<input type="hidden" value="<?php echo $this -> module;?>" name="module">
		<input type="hidden" value="<?php echo $this -> view;?>" name="view">
		<input type="hidden" value="" name="task">
		<input type="hidden" value="0" name="boxchecked">
	</form>
</div>