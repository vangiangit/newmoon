<div class="container-breadcrumb">
	<div class="container">
		<?php if(isset($breadcrumbs) && !empty($breadcrumbs)){?>
			<ul class="breadcrumb">
				<li itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
					<a itemprop="url" title="Trang chủ" rel="nofollow" href="<?php echo URL_ROOT;?>" itemprop="title"><?php echo FSText::_('Trang chủ'); ?></a>
				</li>
				<?php foreach($breadcrumbs as $item){ ?>
					<li itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
						<a itemprop="url" href="<?php echo $item[1];?>" title="<?php echo htmlspecialchars($item[0]);?>" itemprop="title"><?php echo $item[0];?></a>
					</li>
				<?php }?>
			</ul>
		<?php }?>
	</div>
</div><!-- /.container-breadcrumb-->