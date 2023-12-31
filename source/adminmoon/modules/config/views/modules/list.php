<?php  
	global $toolbar;
	$toolbar->setTitle(FSText :: _('Cấu hình SEO, Modules') );
?>
<div class="form_body">
	<form action="index.php?module=<?php echo $this -> module;?>&view=<?php echo $this -> view;?>" name="adminForm" method="post">
		
		<div class="form-contents">
			<table border="1" class="tbl_form_contents" width="100%" cellpadding="5" bordercolor="#cccccc">
				<thead>
					<tr>
					<th width="3%">
						#
					</th>
					<th class="title">
						<?php echo FSText :: _('Module'); ?>
					</th>
					<th class="title" width="17%">
						<?php echo FSText :: _('Cấu hình Seo, Module'); ?>
					</th>
					<th class="title" width="17%">
						<?php echo FSText :: _('Thời gian Cache'); ?>
					</th>
					<th class="title" width="17%">
						<?php echo FSText :: _('Xóa cache'); ?>
					</th>
				</thead>
				<tbody>
					
					<?php $i = 0; ?>
					<?php if(@$list):?>
						<?php $module_current = '';?>
						<?php foreach ($list as $row) : ?>
							<?php if($row -> module != $module_current){?>
								<?php $module_current = $row -> module; ?>
								<tr class="row<?php echo $i%2; ?>">
									<td><?php echo $i+1; ?></td>
									<td align="left">
										<strong><?php echo ucfirst(FSText::_($module_current));?></strong>
									</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td><a href="<?php echo "index.php?module=".$this -> module."&view=".$this -> view."&task=clean_cache&module=".$module_current;?>"  /> Xóa cache</a></td>
								</tr>
							<?php } else { ?>
								<?php $link_view = "index.php?module=".$this -> module."&view=".$this -> view."&task=edit&id=".$row->id; ?>
								<tr class="row<?php echo $i%2; ?>">
									<td><?php echo $i+1; ?></td>
									<td align="left">
										<a href="<?php echo $link_view;?>"  /> .&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<sup>|_</sup>&nbsp;<?php echo $row -> title; ?></a>
									</td>
									<td> <?php echo TemplateHelper::edit($link_view); ?></td>
									<td> <?php echo $row -> cache; ?></td>
									<td>&nbsp;</td>
								</tr>
							<?php }?>
							<?php $i++; ?>
						<?php endforeach;?>
					<?php endif;?>
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