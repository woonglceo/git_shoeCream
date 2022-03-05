<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<link rel="stylesheet" href="/shoeCream/resources/css/join_social.css">
<script src="https://kit.fontawesome.com/c32a0a7a55.js" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="top.jsp"></jsp:include>
<form id="join_form">
<div class="join">
	<h2 class="join_title">회원가입</h2>
	
	<div class="input_box">
		<div class="email_box">
			<h3 class="input_title">카카오 ID로 연결됨*</h3>
			<input type="text" class="input_txt" id="input_email" value="shoe@kream.com" readonly="readonly">
			<p class="input_sub" id="input_sub_text">카카오 계정 > 개인 정보 > 카카오계정으로 가입됩니다.</p>
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
			</label>
			<a href="#" class="btn_view" id="btn_agreement">내용보기</a>
			</div>
			<div class="checkbox_item">
			<label for="allow_privacy" class="check_label">
				<input type="checkbox" class="checkbox" id="allow_privacy" name="check_essential">
				<span>개인정보 수집 및 이용 동의</span>
			</label>
			<a href="#" class="btn_view" id="btn_privacy">내용보기</a>
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
	const essentialList = [$('#input_name'), $('#group_1'), $('#allow_agreement'), $('#allow_privacy')];
	
	<!-- 토글버튼 -->
	$('.btn').click(function(){
		$(this).children('i').toggleClass('fa-solid fa-minus fa-solid fa-plus');

		if($(this).hasClass('essential')){
			$('#check_sub_essential').toggle();
		}else if($(this).hasClass('option')){
			$('#check_sub_option').toggle();
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

	<!-- 회원가입 -->
	$('.join_btn').click(function(){
		if($(this).hasClass('join_btn_able')){
			$.ajax({
				type:'post',
				url:'/shoeCream/user/signUp',
				data:{
					'email':$('#input_email').val(),
					'pwd':$('#input_pwd').val(),
					'nickname':$('#input_nickname').val(),
					'phoneNum':$('#input_phoneNum').val()
				},
				success:function(){
					alert('회원가입 성공');	
				},
				error:function(){
					alert('회원가입 실패');
				}
			});			
		}
	});
	
	<!-- 회원가입 버튼 활성화 -->
	essentialList.forEach(function(item){
		$(item).on('input', function(){
			if($('#input_nickname').attr('validation')&&$('#group_1').attr('validation')&&$('#allow_agreement').attr('validation')&&$('#allow_privacy').attr('validation')){
				$('.join_btn').addClass('join_btn_able');
				$('.join_btn').removeClass('join_btn_disabled');
			}else{
				$('.join_btn').addClass('join_btn_disabled');
			}
		});
	});

});

</script>
</body>
</html>