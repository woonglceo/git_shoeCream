<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<link rel="stylesheet" href="resources/css/top.css">
<link rel="stylesheet" href="/shoeCream/resources/css/join.css">
<script src="https://kit.fontawesome.com/c32a0a7a55.js" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="top.jsp"></jsp:include>
<form id="join_form">
<div class="join">
	<h2 class="join_title">회원가입</h2>
	
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
			<input type="password" class="input_txt" id="input_pwd" placeholder="예) 영문, 숫자, 특수문자 조합 8-16자" autocomplete="off">
			<p class="input_err" id="input_err_pwd"></p>
		</div>
	</div>
	
	<div class="input_box">
		<div class="nickname_box">
			<h3 class="input_title">이름*</h3>
			<input type="text" class="input_txt" id="input_nickname" autocomplete="off">
			<p class="input_err" id="input_err_nickname"></p>
		</div>
	</div>
	
	<div class="join_terms">
		<div class="check_main">
			<div class="checkbox_item">
			<label for="group_1" class="check_label">
				<input type="checkbox" class="checkbox" id="group_1">
				<span>[필수] 만 14세 이상이며 모두 동의합니다.</span>
			</label>
			<a href="#" class="btn essential"><i class="fa-solid fa-plus"></i></a>
			</div>
		</div>
		<div class="check_sub" id="check_sub_essential">
			<div class="checkbox_item">
			<label for="allow_agreement" class="check_label">
				<input type="checkbox" class="checkbox" id="allow_agreement" name="check_essential">
				<span>이용약관 동의</span>
				<a href="#" class="btn_view" id="btn_agreement">내용보기</a>
			</label>
			</div>
			<div class="checkbox_item">
			<label for="allow_privacy" class="check_label">
				<input type="checkbox" class="checkbox" id="allow_privacy" name="check_essential">
				<span>개인정보 수집 및 이용 동의</span>
				<a href="#" class="btn_view" id="btn_privacy">내용보기</a>
			</label>
			</div>
		</div>
			
		<div class="check_main">
			<div class="checkbox_item">
				<label for="group_2" class="check_label">
					<input type="checkbox" class="checkbox" id="group_2">
					<span class="span_txt">[선택] 광고성 정보 수신에 모두 동의합니다.</span>
				</label>
				<a href="#" class="btn option"><i class="fa-solid fa-plus"></i></a>
			</div>
		</div>
		<div class="check_sub" id="check_sub_option">
			<div class="checkbox_item">
				<label for="allow_app" class="check_label">
					<input type="checkbox" class="checkbox" id="allow_app" name="check_option">
					<span>앱 푸시</span>
				</label>
			</div>
			<div class="checkbox_item">
				<label for="allow_sms" class="check_label">
					<input type="checkbox" class="checkbox" id="allow_sms" name="check_option">
					<span>문자 메시지</span>
				</label>
			</div>
			<div class="checkbox_item">
				<label for="allow_email" class="check_label">
					<input type="checkbox" class="checkbox" id="allow_email" name="check_option">
					<span>이메일</span>
				</label>
			</div>
		</div>
	</div>
	<input type="button" class="join_btn" value="가입하기">
</div>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	const group1 = $('#group_1');
	const group2 = $('#group_2');
	const group1List = [$('#allow_agreement'), $('#allow_privacy')];
	const group2List = [$('#allow_app'), $('#allow_sms'), $('#allow_email')];
	const essentialList = [$('#input_email'), $('#input_pwd'), $('#input_nickname'), $('#group_1'), $('#allow_agreement'), $('#allow_privacy')];
	
	<!-- 토글버튼 -->
	$('.btn').click(function(){
		$(this).children('i').toggleClass('fa-solid fa-minus fa-solid fa-plus');

		if($(this).hasClass('essential')){
			$('#check_sub_essential').toggle();
		}else if($(this).hasClass('option')){
			$('#check_sub_option').toggle();
		}
	});
	
	<!-- 전체선택 -->
	function checkAll(list){
		list.forEach(function(item){
			$(item).prop('checked', true);
			$(item).attr('validation', true);
			//console.log($(item).attr('validation'));
		});
	}
	
	<!-- 전체해제 -->
	function resetAll(list){
		list.forEach(function(item){
			$(item).prop('checked', false);
			$(item).attr('validation', false);
			//console.log($(item).attr('validation'));
		});
	}
	
 	$('#group_1').click(function(){
 		$('#group_1').attr('validation', true);
		const checked = $('#group_1').is(':checked');
		
		if(checked){
			checkAll(group1List);
		}else{
			resetAll(group1List);
		}
	});
	
	$('#group_2').click(function(){
		$('#group_2').attr('validation', true);
		const checked = $('#group_2').is(':checked');
		
		if(checked){
			checkAll(group2List);
		}else{
			resetAll(group2List);
		}
	});
	
	<!-- 서브 체크박스가 모두 체크되면 그룹 체크박스 체크/하나라도 체크가 해제되면 그룹 체크박스 언체크 -->
	function setCheckbox(size, count, group){
		if(size==count){
			$(group).prop('checked', true);
			$(group).attr('validation', true);
			//console.log($(group).attr('validation'));
		}else{
			$(group).prop('checked', false);
			$(group).attr('validation', false);
			//console.log($(group).attr('validation'));
		}
	}
	
	$('input:checkbox[name="check_essential"]').click(function(){
		const listSize = $('input:checkbox[name="check_essential"]').length;
		const checkCount = $('input:checkbox[name="check_essential"]:checked').length;
		
		setCheckbox(listSize, checkCount, group1);
	});
	
	$('input:checkbox[name="check_option"]').click(function(){
		const listSize = $('input:checkbox[name="check_option"]').length;
		const checkCount = $('input:checkbox[name="check_option"]:checked').length;
		
		setCheckbox(listSize, checkCount, group2);
	});
	
	<!-- 체크박스 유효성 검사 -->
 	group1List.forEach(function(item){
		$(item).click(function(){
			if($(item).is(':checked')){
				$(item).attr('validation', true);
				//console.log($(item).attr('validation'));
			}else{
				$(item).attr('validation', false);
				//console.log($(item).attr('validation'));
			}
		});
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
	    	<!-- 이메일 중복 체크 -->
	    	$.ajax({
				type:'post',
				url:'/shoeCream/user/checkEmail',
				data:'email='+email,
				dataType:'text',
				success:function(data){
					if(data=='exist'){
						$('#input_err_email').text('이미 사용 중인 이메일입니다.');
				    	$('.email_box').css('color', '#d5624f');
				    	$('#input_email').attr('validation', false);
					}else if(data=='not_exist'){
						console.log(data);
						$('#input_err_email').text('');
						$('.email_box').css('color', 'black');
				    	$('#input_email').attr('validation', true);
					}
				},
				error:function(err){
					alert("Error:이메일중복체크");
				}
			}); // end ajax
	    	
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
		    //console.log($('#input_pwd').attr('validation'));
		    
	    }else{
	    	$('#input_err_pwd').text('');
	    	$('.pwd_box').css('color', 'black');
	    	$('#input_pwd').attr('validation', true);
	    	//console.log($('#input_pwd').attr('validation'));
	    }	
	});
	
	
	<!-- 이름 유효성 검사 -->
	$('#input_nickname').on('input', function(){
			if($(this).val()==''){
				$('#input_err_nickname').text('필수 정보입니다.');
				$('.nickname_box').css('color', '#d5624f');
				$('#input_nickname').attr('validation', false);
			}else{
				$('#input_err_nickname').text('');
		    	$('.nickname_box').css('color', 'black');
				$('#input_nickname').attr('validation', true);
			}
				
	});

	<!-- 회원가입 -->
	$('.join_btn').click(function(){
		if($(this).hasClass('join_btn_able')){
			$.ajax({
				type:'post',
				url:'/shoeCream/user/signUp',
				data:{
					'email':$('#input_email').val(),
					'pwd':$('#input_pwd').val(),
					'nickname':$('#input_nickname').val()
					//'phoneNum':$('#input_phoneNum').val()
				},
				success:function(){
					alert('회원가입 성공');	
				},
				error:function(){
					alert('Error:회원가입실패');
				}
			});			
		}
	});
	
	<!-- 회원가입 버튼 활성화 -->
	essentialList.forEach(function(item){
		$(item).on('input', function(){
			if($('#input_email').attr('validation')&&$('#input_pwd').attr('validation')&&$('#input_nickname').attr('validation')&&$('#group_1').attr('validation')&&$('#allow_agreement').attr('validation')&&$('#allow_privacy').attr('validation')){
				$('.join_btn').addClass('join_btn_able');
				$('.join_btn').removeClass('join_btn_disabled');
			}else{
				$('.join_btn').addClass('join_btn_disabled');
			}
		});
	});
	
	<!-- 약관 내용보기 -->
	$('#btn_agreement').click(function(){
		
	});

});

</script>
</body>
</html>