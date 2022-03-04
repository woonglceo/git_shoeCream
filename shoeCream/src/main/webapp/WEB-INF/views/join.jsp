<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<link rel="stylesheet" href="resources/css/top.css">
<script src="https://kit.fontawesome.com/c32a0a7a55.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="join">
	<h2 class="join_title">회원가입</h2>
	
	<div class="input_email">
		<h3 class="input_title">이메일 주소*</h3>
		<input type="text" class="input_txt" placeholder="예) shoe@kream.co.kr" autocomplete="off">
		<p class="input_err">이메일 주소를 정확히 입력해 주세요.</p>
	</div>
	
	<div class="pwd_box">
		<h3 class="input_title">비밀번호*</h3>
		<input type="password" class="input_txt" id="input_pwd" placeholder="예) 영문, 숫자, 특수문자 조합 8-16자" autocomplete="off">
		<p class="input_err" id="input_err_pwd"></p>
	</div>
	
	<div class="join_terms">
		<div class="terms_box">
			<div class="check_main_1">
				<div class="checkbox_item">
					<input type="checkbox" id="group_1">
					<span>[필수] 만 14세 이상이며 모두 동의합니다.</span>
					<button id="btn_1"><i class="fa-solid fa-plus"></i></button>
				</div>
			</div>
			<div class="check_sub_1">
				<div class="checkbox_item">
					<input type="checkbox" class="checkbox" id="agreement">
					<span>이용약관 동의</span>
					<a href="#" class="btn_view" id="btn_agreement">내용보기</a>
				</div>
				<div class="checkbox_item">
					<input type="checkbox" class="checkbox" id="privacy">
					<span>개인정보 수집 및 이용 동의</span>
					<a href="#" class="btn_view" id="btn_privacy">내용보기</a>
				</div>
			</div>
		</div>
		<div class="terms_box">
			<div class="check_main_2">
				<div class="checkbox_item">
					<input type="checkbox" id="group_2">
					<span>[선택] 광고성 정보 수신에 모두 동의합니다.</span>
					<button id="btn_2"><i class="fa-solid fa-plus"></i></button>
				</div>
			</div>
			<div class="check_sub_2">
				<div class="checkbox_item">
					<input type="checkbox" class="checkbox" id="allow_app">
					<span>앱 푸시</span>
				</div>
				<div class="checkbox_item">
					<input type="checkbox" class="checkbox" id="allow_sms">
					<span>문자 메시지</span>
				</div>
				<div class="checkbox_item">
					<input type="checkbox" class="checkbox" id="allow_email">
					<span>이메일</span>
				</div>
			</div>
		</div>
	</div>
	
	<input type="button" class="join_btn" value="가입하기">
	
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	<!-- 토글 -->
	$('#btn_1').click(function(){
		$('.check_sub_1').toggle();
		$('#btn_1 i').toggleClass('fa-solid fa-minus fa-solid fa-plus');
	});
	
	$('#btn_2').click(function(){
		$('.check_sub_2').toggle();
		$('#btn_2 i').toggleClass('fa-solid fa-minus fa-solid fa-plus');
	});
	
	<!-- 체크박스 전체선택/해제 -->
	$('#group_1').click(function(){
		// $('.check_sub_1').show();
		if($('#group_1').prop('checked')){
			$('.check_sub_1 input:checkbox').prop('checked', true);		
		}else{
			$('.check_sub_1 input:checkbox').prop('checked', false);
		}
	});
	
	$('#group_2').click(function(){
		// $('.check_sub_1').show();
		if($('#group_2').prop('checked')){
			$('.check_sub_2 input:checkbox').prop('checked', true);		
		}else{
			$('.check_sub_2 input:checkbox').prop('checked', false);
		}
	});
	
	<!-- 서브 체크박스가 모두 체크되면 그룹 체크박스 체크/하나라도 체크가 해제되면 그룹 체크박스 언체크 -->
	$('.checkbox').click(function(){
		if($('.check_sub_1 input:checkbox').length==$('.check_sub_1 input:checkbox:checked').length){
			$('#group_1').prop('checked', true);
		}else{
			$('#group_1').prop('checked', false);
		}
		
		if($('.check_sub_2 input:checkbox').length==$('.check_sub_2 input:checkbox:checked').length){
			$('#group_2').prop('checked', true);
		}else{
			$('#group_2').prop('checked', false);
		}
	});
	
	<!-- 이메일 유효성 검사 -->
	$('#input_email').on('input', function() {
	    // alert($(this).val());
		$('#input_err_email').text('');

	    $('#input_err_email').text('이메일 주소를 정확히 입력해 주세요.');
	});
		
	<!-- 비밀번호 유효성 검사 -->
	$('#input_pwd').on('input', function() {
	    if(!checkPwd()){
		    $('#input_err_pwd').text('영문, 숫자, 특수문자를 조합하여 입력해주세요. (8-16자)');
		    $('.pwd_box').attr('class', 'pwd_box_err');
		    $('#input_pwd').setAttribute('validation', false);
	    }else{
	    	$('.pwd_box_err').attr('class', 'pwd_box_fill');
	    	$('#input_pwd').setAttribute('validation', true);
	    }	
	    	$('#input_err_pwd').text('');
	});	    

	function checkPwd(){
		const pwd = $('#input_pwd').val();
		const num = pwd.search(/[0-9]/g);
		const eng = pwd.search(/[a-z]/ig);
		const spe = pwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		
		if(pwd.length < 8 || pwd.length > 16){
		  	return false;
		}else if(pwd.search(/\s/) != -1){
			return false;
		}else if(num < 0 || eng < 0 || spe < 0 ){
			return false;
		}else{
			return true;
		}
	}
	
});	

</script>
</body>
</html>