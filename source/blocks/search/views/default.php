<?php
$text_default = 'Từ khóa tìm kiếm...';
$keyword = $text_default;
$module = FSInput::get('module');
if($module == 'product'){
	$key = FSInput::get('keyword');
    $key = str_replace('-', ' ', $key); 
	if($key){
		$keyword = $key;
	}
}
$link = '/tim-kiem';
?>

<form class="d-flex" role="search" action="<?php echo $link?>" onsubmit="return submitSearch();">
    <input class="form-control me-2" type="text" id="keyword" name="keyword" placeholder="<?php echo $text_default ?>" name="keyword">
    <button class="btn btn-outline-success" type="submit">Search</button>
    <input type="hidden" id="link_search" value="<?php echo $link ?>" />
</form>