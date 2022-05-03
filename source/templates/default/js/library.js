var is_rewrite = 0;
var root = '/';

function fsAlert($option){
    $option = $option||{};
    var box = $("<div></div>");
    box.html($option.msg).dialog({
        modal: true, 
        title: 'Alert', 
        buttons: { 
            Ok: function() {
                $.isFunction($option.func) && ($option.func)();
                $(this).dialog('destroy').remove();
            }
        }
    }).dialog('open');
    return false;
}

function changeCaptcha(){
	var date = new Date();
	var captcha_time = date.getTime();
	$("#imgCaptcha").attr({src:root+'libraries/jquery/ajax_captcha/create_image.php?'+captcha_time});
}

function isEmail(email) {
	var re = /^(\w|[^_]\.[^_]|[\-])+(([^_])(\@){1}([^_]))(([a-z]|[\d]|[_]|[\-])+|([^_]\.[^_])*)+\.[a-z]{2,3}$/i
	return re.test(email);
}

function isPhone(elemid){
	elem  = $('#'+elemid);
	var numericExpression = /^[0-9 .]+$/;
	if(elem.val().match(numericExpression) && elem.val().length >7 && elem.val().length < 13){
		return true;
	}else{
		return false;
	}
}

function isEmpty(elemid){
	elem  = $('#'+elemid);
	if(elem.val().length == 0){
		elem.focus(); // set the focus to this input
		return false;
	}
	else
	{
		return true;
	}
}

function submitSearch(){
	url = '';
	var keyword = $('#keyword').val();
	keyword  = keyword.replace(/[ ]/g,'-');
	var link_search = $('#link_search').val();
	if(keyword!= '' && keyword != '')	{
		url += 	'&keyword='+keyword;
		var check = 1;
	}else{
		var check =0;
	}
	if(check == 0){
		alert('You must enter a search keyword');
		return false;
	}
	if(link_search.indexOf("&") == '-1')
		var link = link_search+'/'+keyword;
	else
		var link = link_search+'&keyword='+keyword;
	    window.location.href=link;
	    return false;
}

function submitSearchmobile(){
	url = '';
	var keyword = $('#keywordmobile').val();
	keyword  = keyword.replace(/[ ]/g,'-');
	var link_search = $('#link_searchmobile').val();
	if(keyword!= '' && keyword != '')	{
		url += 	'&keyword='+keyword;
		var check = 1;
	}else{
		var check =0;
	}
	if(check == 0){
		alert('You must enter a search keyword');
		return false;
	}
	if(link_search.indexOf("&") == '-1')
		var link = link_search+'/'+keyword;
	else
		var link = link_search+'&keyword='+keyword;
	window.location.href=link;
	return false;
}

function isInteger(value) {
    for (i = 0; i < value.length; i++) {
        if ((value.charAt(i) < '0') || (value.charAt(i) > '9')) return false
    }
    return true;
}
	
$('a#gotop').click(function(){
    $('html, body').animate({scrollTop:0},'slow');
})


function fsAlert($msg){
    $('#fs-alert-msg').html($msg);
    $('#fs-alert').modal();
}

function goSetIdTop($id){
	offset = $('#'+$id).offset();
	$("html,body").animate({scrollTop:offset.top}, 200);
}

jQuery(document).ready(function($){
	// browser window scroll (in pixels) after which the "back to top" link is shown
	var offset = 300,
	//browser window scroll (in pixels) after which the "back to top" link opacity is reduced
		offset_opacity = 1200,
	//duration of the top scrolling animation (in ms)
		scroll_top_duration = 700,
	//grab the "back to top" link
		$back_to_top = $('.cd-top');

	//hide or show the "back to top" link
	$(window).scroll(function(){
		( $(this).scrollTop() > offset ) ? $back_to_top.addClass('cd-is-visible') : $back_to_top.removeClass('cd-is-visible cd-fade-out');
		if( $(this).scrollTop() > offset_opacity ) {
			$back_to_top.addClass('cd-fade-out');
		}
	});

	//smooth scroll to top
	$back_to_top.on('click', function(event){
		event.preventDefault();
		$('body,html').animate({
				scrollTop: 0 ,
			}, scroll_top_duration
		);
	});

	$('.menu-toggle').click(function(){
		var $showMenu = $(this).attr('show-menu');
		if($showMenu == '0') {
			$('.header-menu').animate({"left": "0"});
			$(this).attr('show-menu', '1');
		}else{
			$('.header-menu').animate({"left": "-280px"});
			$(this).attr('show-menu', '0');
		}
	});

    $('.searchMobileWrapper').hover(function(){

    },function(){
        $('.searchMobileWrapper').toggleClass('show')
    })
});
