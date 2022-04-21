function validateBRegister(){
    if($('#breg_email').val()==''){
		Boxy.alert('Bạn vui lòng nhập địa chỉ email.',function(){$('#breg_email').focus();},{title:'Thông báo.',afterShow: function() { $('#boxy_button_OK').focus();} });
		return false;
	}
    if(!isEmail($('#breg_email').val())){
		Boxy.alert('Địa chỉ email không đúng.',function(){$('#breg_email').focus();},{title:'Thông báo.',afterShow: function() { $('#boxy_button_OK').focus();} });
		return false;
	}
    if($('#breg_password').val()==''){
		Boxy.alert('Bạn vui lòng nhập mật khẩu.',function(){$('#breg_password').focus();},{title:'Thông báo.',afterShow: function() { $('#boxy_button_OK').focus();} });
		return false;
	}
    if($('#breg_password').val()!=$('#breg_repassword').val()){
		Boxy.alert('Bạn vui lòng nhập mật khẩu.',function(){$('#breg_repassword').focus();},{title:'Thông báo.',afterShow: function() { $('#boxy_button_OK').focus();} });
		return false;
	}
    if(!isPhone('breg_phone')){
		Boxy.alert('Số điện thoại không đúng.',function(){$('#breg_phone').focus();},{title:'Thông báo.',afterShow: function() { $('#boxy_button_OK').focus();} });
		return false;
	}
    var $data = $('form#frmBRegister').serialize(); 
    $.ajax({
		type : 'POST',
        dataType: 'json',
		url : '/index.php?module=members&view=members&raw=1&task=do_bregister',
		data: $data,
        success : function(data){
            if (data.error==true){
                Boxy.alert(data.message,function(){},{title:'Thông báo.',afterShow: function() { $('#boxy_button_OK').focus();} });
            }else{
                Boxy.alert(data.message,function(){
                    $('.register,.blur').fadeOut();
                    $('.login,.blur').fadeIn();
                },{title:'Thông báo.',afterShow: function() { $('#boxy_button_OK').focus();} });
            }
        },
        error : function(XMLHttpRequest, textStatus, errorThrown) {Boxy.alert('Có lỗi trong quá trình đưa lên máy chủ. Xin bạn vui lòng kiểm tra lại kết nối.',function(){ },{title:'Thông báo.',afterShow: function() {$('#boxy_button_OK').focus();}});}
	});
    return false;
}

function validateBLogin(){
    if($('#blog_username').val()==''){
		Boxy.alert('Bạn vui lòng nhập tên đăng nhập.',function(){$('#blog_username').focus();},{title:'Thông báo.',afterShow: function() { $('#boxy_button_OK').focus();} });
		return false;
	}
    if($('#blog_password').val()==''){
		Boxy.alert('Bạn vui lòng nhập mật khẩu.',function(){$('#blog_password').focus();},{title:'Thông báo.',afterShow: function() { $('#boxy_button_OK').focus();} });
		return false;
	}
    var $data = $('form#frmBLogin').serialize();
    $.ajax({
		type : 'POST',
        dataType: 'json',
		url : '/index.php?module=members&view=members&raw=1&task=do_login',
		data: $data,
        success : function(data){
            if (data.error==true){
                Boxy.alert(data.message,function(){},{title:'Thông báo.',afterShow: function() { $('#boxy_button_OK').focus();} });
            }else{
                $(window.location).attr('href', data.redirect);
            }
        },
        error : function(XMLHttpRequest, textStatus, errorThrown) {Boxy.alert('Có lỗi trong quá trình đưa lên máy chủ. Xin bạn vui lòng kiểm tra lại kết nối.',function(){ },{title:'Thông báo.',afterShow: function() {$('#boxy_button_OK').focus();}});}
	});
    return false;
}