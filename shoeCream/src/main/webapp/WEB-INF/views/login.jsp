<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="/shoeCream/resources/css/login.css">
</head>
<body>
<jsp:include page="top.jsp"></jsp:include>
<form id="login_form">
<div class="login">
	<h3 class="login_title"><img class="login_logo" alt="logo" src="/shoeCream/resources/images/login_title.png"></h3>
	
	<div class="input_box">
		<div class="email_box">
			<h3 class="input_title">이메일 주소*</h3>
			<input type="text" class="input_txt" id="input_email" placeholder="예) shoe@kream.co.kr" autocomplete="off">
			<p class="input_err" id="input_err_email"></p>
		</div>
	</div>
	
	<div class="input_box">
		<div class="pwd_box">
			<h3 class="input_title">비밀번호*</h3>
			<input type="password" class="input_txt" id="input_pwd" autocomplete="off">
			<p class="input_err" id="input_err_pwd"></p>
		</div>
	</div>
	
	<div class="login_btn_box">
		<input type="button" class="login_btn" value="로그인">
	</div>
	
	<ul class="look_box">
		<li class="look_list"><a href="/shoeCream/user/join" class="look_link"> 이메일 가입 </a></li>
		<li class="look_list"><a href="/shoeCream/user/find_email" class="look_link"> 이메일 찾기 </a></li>
		<li class="look_list"><a href="/shoeCream/user/find_password" class="look_link"> 비밀번호 찾기 </a></li>
	</ul>
	
	<div class="social_login">
		<button class="btn btn_kakao_login">
			<img class="kakao_logo" alt="logo" src="/shoeCream/resources/images/kakao_logo.png">
			<h3 class="txt">카카오로 로그인</h3>
		</button>
	</div>
	
</div>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript">
$(function(){
	<!-- 이메일 유효성 검사 -->
	$('#input_email').on('input', function(){
	    const email = $(this).val();
	    const reg = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	    
	    if(!reg.test(email)){
	    	$('#input_err_email').text('이메일 주소를 정확히 입력해 주세요.');
	    	$('.email_box').css('color', '#d5624f');
	    	$('#input_email').attr('validation', false);
	    	
	    }else{
	    	$('#input_err_email').text('');
			$('.email_box').css('color', 'black');
	    	$('#input_email').attr('validation', true);
	    }
	});
		
	<!-- 비밀번호 유효성 검사 -->
	$('#input_pwd').on('input', function(){
		const pwd = $(this).val();
		const reg = RegExp(/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/);
		
	    if(!reg.test(pwd)){
		    $('#input_err_pwd').text('영문, 숫자, 특수문자를 조합하여 입력해주세요. (8-16자)');
		    $('.pwd_box').css('color', '#d5624f');
		    $('#input_pwd').attr('validation', false);
		    
	    }else{
	    	$('#input_err_pwd').text('');
	    	$('.pwd_box').css('color', 'black');
	    	$('#input_pwd').attr('validation', true);
	    }	
	});

	<!-- 로그인 -->
	$('.login_btn').click(function(){
		if($(this).hasClass('login_btn_able')){
			$.ajax({
				type:'post',
				url:'/shoeCream/user/signIn',
				data:{
					'email':$('#input_email').val(),
					'pwd':$('#input_pwd').val()
				},
				dataType:'text',
				success:function(data){
					if (data=='ok')
						location.href='';
					else if (data=='fail'){
						Swal.fire({
							text: '이메일 또는 비밀번호를 확인해주세요.',
							icon: 'warning'
						})
					}
				},
				error:function(){
					alert('Error:로그인실패');
				}
			});
		}
	});
	
	<!-- 로그인 버튼 활성화 -->
	$('.input_txt').on('input', function(){
		if($('#input_email').attr('validation')&&$('#input_pwd').attr('validation')){
			$('.login_btn').addClass('login_btn_able');
			$('.login_btn').removeClass('login_btn_disabled');
		}else{
			$('.login_btn').addClass('login_btn_disabled');
		}
	});
});

</script>
</body>
</html>