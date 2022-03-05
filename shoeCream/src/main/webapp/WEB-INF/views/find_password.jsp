<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="/shoeCream/resources/css/find_password.css">
</head>
<body>
<jsp:include page="top.jsp"></jsp:include>
<form id="help">
<div class="help">
	<h2 class="help_title">비밀번호 찾기</h2>
	
	<div class="help_notice">
		<p class="notice_txt">
		 가입 시 등록한 휴대폰 번호와 이메일을 입력하시면,
		 <br>
		 휴대폰으로 임시 비밀번호를 전송해 드립니다.
		</p>
	</div>
	
	<div class="input_box">
		<div class="phone_box">
			<h3 class="input_title">휴대폰 번호</h3>
			<input type="text" class="input_txt" id="input_phoneNum" placeholder="가입하신 휴대폰 번호" autocomplete="off">
		</div>
	</div>
	<div class="input_box">
		<div class="email_box">
			<h3 class="input_title">이메일 주소</h3>
			<input type="text" class="input_txt" id="input_email" placeholder="예) shoe@kream.co.kr" autocomplete="off">
			<p class="input_err" id="input_err_email"></p>
		</div>
	</div>
	
	<input type="button" class="btn" value="문자 발송하기">
</div>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	<!-- 숫자만 입력 -->
	$('#input_phoneNum').on('input', function(e){
		$(this).val($(this).val().replace(/[^0-9]/g,""));

		let text = $(this).val();
		
		if (text.length > 9) {
			$('.btn').addClass('btn_able');
			$('.btn').removeClass('btn_disabled');
			$(this).attr('validation', 'true');
		}else{
			$('.btn').addClass('btn_disabled');
		}
			
	});
	
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
	
	
	<!-- 버튼 활성화 -->
	$('.input_txt').on('input', function(){
		if($('#input_phoneNum').attr('validation')&&$('#input_email').attr('validation')){
			$('.btn').addClass('btn_able');
			$('.btn').removeClass('btn_disabled');
		}else{
			$('.btn').addClass('btn_disabled');
		}
	});
	
	<!-- 마스킹 처리 -->
	
});
</script>
</body>
</html>