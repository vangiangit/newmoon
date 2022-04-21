<?php
$cols = count($list);
$span = ceil(12/$cols);
?>
<div id="block-<?php echo $blockId; ?>" class="block-banner block-banner-<?php echo $style ?>" style="<?php echo $cssText?>">
	<div class="container">
		<div class="block-heading">
			<span class="heading"><?php echo $title ?></span>
		</div><!--end: .block-heading-->
		<p class="note">Khi chúng ta nói về tính bền vững, việc lựa chọn vật liệu thảm phù hợp là yếu tố quan trọng đối với cả văn phòng và môi trường của bạn </p>
		<div class="row">
			<?php $i = 0;
			foreach($list as $item){
				$i++;?>
				<div id="banner-<?php echo $item->id; ?>" class="item col-lg-<?php echo $span ?> col-md-<?php echo $span ?> col-sm-6 col-xs-6">
					<?php if($item -> type == 1){?>
						<?php if($item -> image){?>
							<a class="thumb" rel="nofollow" href="<?php echo $item -> link;?>" title='<?php echo $item -> name;?>'>
								<img class="img-responsive" alt="<?php echo $item -> name; ?>" src="<?php echo URL_ROOT.$item -> image;?>"/>
							</a>
							<a class="heading" rel="nofollow" href="<?php echo $item -> link;?>" title='<?php echo $item -> name;?>'>
								<?php echo $item -> name; ?>
							</a>
							<?php echo $item -> content; ?>
						<?php }?>
					<?php } else {?>
						<?php echo $item -> content; ?>
					<?php }?>
				</div>
			<?php }?>
		</div>
	</div>
</div><!--end: #block-<?php echo $blockId; ?>-->