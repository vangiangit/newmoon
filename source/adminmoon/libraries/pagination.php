<?php
/*
 * Huy write
 */

class Pagination
{
	var $limit;
	var $total;
	var $page;
	var $url;
	
	function __construct($limit,$total,$page,$url = ''){
		$this->limit = $limit;
		$this->total = $total;
		$this->page = $page;
		if($url){
			$this->url = URL_ROOT.'ytv_adminn/'.$url;
		}else
		{
			$url = $_SERVER['REQUEST_URI'];
			$url = substr($url,strlen(URL_ROOT_REDUCE));
			$url =  trim(preg_replace('/&page=[0-9]+/i', '', $url));
			$this->url = URL_ROOT.$url;
		}
		
	}
	
	function create_link_with_page($url,$page){
		$url =  trim(preg_replace('/&page=[0-9]+/i', '', $url));
		if(!$page || $page == 1){
			return $url;
		} else {
			return $url.'&page='.$page;
		}
	}
	
	/*
	 * maxpage is max page is show. But It is not last pageg.
	 * ex: 1,2,3,4..100.=> 4 is max page 
	 */
	function showPagination($maxpage = 5)
	{
//		$previous = "&lsaquo;";
		$previous = "<img src='".URL_ADMIN."images/page_previous.gif' alt='previous page'>";
//		$next = "&rsaquo;";
		$next = "<img src='".URL_ADMIN."images/page_next.gif' alt='previous page'>";
//		$first_page = "&#171; ";
		$first_page = "<img src='".URL_ADMIN."images/page_first.gif' alt='first page'> ";
		$last_page = "<img src='".URL_ADMIN."images/page_last.gif' alt='last page'>";
		
		$current_page = FSInput::get('page');
		if(!$current_page || $current_page < 0)
			$current_page = 1;
		$html  = "";
		if($this->limit < $this->total)
		{
			$num_of_page = ceil( $this->total / $this -> limit );
			
			$start_page = $current_page - $maxpage;
			if($start_page <= 0)
				 $start_page = 1;
			
			$end_page = $current_page + $maxpage;
			
			if($end_page > $num_of_page) 
				$end_page = $num_of_page;
			
			//WRITE prefix on screen
			$html  .= "<div class='pagination'>";
			$html .=  "<font class='title_pagination'>" . FSText :: _('Page') . "</font> ";
			//Write Previous
			if(($current_page > 1) && ($num_of_page > 1)){
				$html .= "<a title='first_page' href='" . Pagination::create_link_with_page($this->url,0) . "' title='".FSText :: _('First page')."' >" . $first_page . "</a>";
				$html .= "<a title='pre_page' href='" . Pagination::create_link_with_page($this->url , ($current_page-1)) . "' title='".FSText :: _('Previous')."' >" . $previous . "</a>";
				if($start_page !=1)
					 $html .= " <b>..</b> ";
			}
			for($i=$start_page; $i<=$end_page; $i++){
				if($i != $current_page){
					if($i == 1)
					 	$html .= "<a title='Page " . $i . "' href='" . Pagination::create_link_with_page($this->url,0 ) . "' >" . $i . "</a>";
					 else
					 	$html .= "<a title='Page " . $i . "' href='" . Pagination::create_link_with_page($this->url,$i ) . "' >" . $i . "</a>"; 
				}
				else{
					 $html .= "<font title='Page " . $i . "' class='current'>[" . $i . "]</font>";
				}
			}
			//Write Next
			if(($current_page < $num_of_page) && ($num_of_page > 1)){
				if($end_page < $num_of_page) 
					$html .= " <b>..</b> ";
				$html .= "<a title='Next page' href='" . Pagination :: create_link_with_page ($this -> url ,($current_page+1)) . "' >" . $next . "</a>";
				$html .= "<a title='Last page' href='" . Pagination :: create_link_with_page ($this -> url ,$num_of_page) . "' >" . $last_page . "</a>";
			}
			$html .= "</div>";
		}
		
		return $html;
	}
}