<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<link rel="stylesheet" href="/shoeCream/resources/css/joinSocial.css">
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
			<input type="text" class="input_txt" id="input_email" value="${userInfo.email}" readonly="readonly">
			<p class="input_sub" id="input_sub_text">카카오 계정 > 개인 정보 > 카카오계정으로 가입됩니다.</p>
		</div>
	</div>
	
	<div class="input_box">
		<div class="nickname_box">
			<h3 class="input_title">닉네임*</h3>
			<input type="text" class="input_txt" id="input_nickname" value="${userInfo.nickname}" autocomplete="off">
			<p class="input_err" id="input_err_nickname"></p>
		</div>
	</div>
	
	<div class="input_box">
		<div class="phoneNum_box">
			<h3 class="input_title">휴대폰 번호*</h3>
			<input type="text" class="input_txt" id="input_phoneNum" placeholder="" autocomplete="off">
			<p class="input_err" id="input_err_phoneNum"></p>
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
		<p class="input_err" id="input_err_checkbox"></p>
	</div>
	
	<input type="button" class="join_btn" value="가입하기">
	<input type="hidden" id="chkNickname">
	<input type="hidden" id="img" value="${userInfo.profile_image}">
	<input type="hidden" id="accessToken" value="${accessToken}">
</div>
</form>
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript">
$(function(){
	const group1 = $('#group_1');
	const group2 = $('#group_2');
	const group1List = [$('#allow_agreement'), $('#allow_privacy')];
	const group2List = [$('#allow_app'), $('#allow_sms'), $('#allow_email')];
	
	<!-- 토글버튼 -->
	$('.btn').click(function(){
		$(this).children('i').toggleClass('fa-solid fa-minus fa-solid fa-plus');
	
		if($(this).hasClass('essential')){
			$('#check_sub_essential').toggle();
		}else if($(this).hasClass('option')){
			$('#check_sub_option').toggle();
		}
	});
	
 	$('#group_1').click(function(){
		const checked = $('#group_1').is(':checked');
		
		if(checked){
			checkAll(group1List);
		}else{
			resetAll(group1List);
		}
	});
	
	$('#group_2').click(function(){
		const checked = $('#group_2').is(':checked');
		
		if(checked){
			checkAll(group2List);
		}else{
			resetAll(group2List);
		}
	});
	
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
	
	$('#input_nickname').on('input change keydown keyup', function(){
		isNickname();
		chkNickname();
	});
	
	$('#input_phoneNum').on('input', function(){
		<!-- 숫자만 입력 -->
		$(this).val($(this).val().replace(/[^0-9]/g,""));
		isPhoneNum();
	});
	
	$('#group_1, #allow_agreement, #allow_privacy').click(function(){
		isCheckbox();
	});
	
	<!-- 회원가입 -->
	$('.join_btn').click(function(){
		<!-- 유효성 검사 -->
		isNickname();
		chkNickname();
		isPhoneNum();
		isCheckbox();
		
		const nickname = $('#input_nickname').attr('validation');
		const validNickname = $('#chkNickname').attr('validation');
		const phoneNum = $('#input_phoneNum').attr('validation');
		const checkbox = $('#group_1').attr('validation');
		
		if(nickname=='true'&&validNickname=='true'&&phoneNum=='true'&&checkbox=='true'){
			<!-- 휴대폰 본인인증 -->
			$.ajax({
	        	type:'post',
	            url:'/shoeCream/user/authPhoneNum',
	            data:{
	               'phoneNum':$('#input_phoneNum').val()
	            },
	            success:function(data){
	            	if(data.result=='success'){
	            		(async () => {
	            			const { value: number } = await Swal.fire({
	            			title: '인증번호를 입력해 주세요.',
	            			inputPlaceholder: '인증번호 입력',
	            			input: 'number'
	            			})
	            			
    					if(number==data.randomNumber){
    						$.ajax({
    							type:'post',
    							url:'/shoeCream/user/joinSocialOk',
    							data:{
    								'email':$('#input_email').val(),
    								'nickname':$('#input_nickname').val(),
    								'phoneNum':$('#input_phoneNum').val(),
    								'img':$('#img').val(),
    								'accessToken':$('#accessToken').val()
    							},
    							success:function(){
    								Swal.fire({
    									title:'회원가입이 완료되었습니다.',
    									icon:'success'
    								}).then((result) => {
    									location.href='/shoeCream/index.jsp';
    								});
    							},
    							error:function(){
    								alert('Error: 소셜 회원가입');
    							}
    						}); // end ajax(회원가입)					
    					}else{
    						alert('인증번호가 일치하지 않습니다.');
    					}
	            		})() // end async
	            	}              
	            },
	            error:function(){
	               alert('Error: 휴대폰 본인인증');
	        	}
	    	}); // end ajax(본인인증)
		}
	});
	
	<!-- 닉네임 유효성 검사 -->
	function isNickname(){
		const len = $('#input_nickname').val().length;
		
		if($('#input_nickname').val()==''){
			$('#input_err_nickname').text('필수 정보입니다.');
			$('#input_nickname').attr('validation', 'false');
			return;
		}
		
		if(len<2){
			$('#input_err_nickname').text('올바른 닉네임을 입력해주세요. (2-50자)');
			$('.nickname_box').css('color', '#d5624f');
			$('#input_nickname').attr('validation', 'false');
		}else{
			$('#input_err_nickname').text('');
	    	$('.nickname_box').css('color', 'black');
	    	$('#input_nickname').attr('validation', 'true');
		}
	}
	
	<!-- 닉네임 중복체크 -->
	function chkNickname(){
		const nickname = $('#input_nickname').val();
		
		if($('#input_nickname').attr('validation')=='true'){
			$.ajax({
				type:'post',
				url:'/shoeCream/user/chkNickname',
				data:'nickname='+nickname,
				dataType:'text',
				success:function(data){
					if(data=='exist'){
						$('#input_err_nickname').text('이미 사용 중인 닉네임입니다.');
				    	$('.nickname_box').css('color', '#d5624f');
				    	$('#chkNickname').attr('validation', 'false');
					}else if(data=='not_exist'){
						$('#input_err_nickname').text('');
						$('.nickname_box').css('color', 'black');
				    	$('#chkNickname').attr('validation', 'true');
					}
				},
				error:function(err){
					alert("Error: 닉네임 중복체크");
				}
			}); // end ajax
		}
	}
	
	<!-- 휴대폰 번호 유효성 검사 -->
	function isPhoneNum(){
		const phoneNum = $('#input_phoneNum').val();
		const reg = RegExp(/^(?:(010\d{4})|(01[1|6|7|8|9]\d{3,4}))(\d{4})$/);
		
		if($('#input_phoneNum').val()==''){
			$('#input_err_phoneNum').text('필수 정보입니다.');
			$('#input_phoneNum').attr('validation', 'false');
			return;
		}
		
		if (!reg.test(phoneNum)){
			$('#input_err_phoneNum').text('휴대폰 번호를 정확히 입력해주세요.');
			$('.phoneNum_box').css('color', '#d5624f');
			$('#input_phoneNum').attr('validation', 'false');
		}else{
			$('#input_err_phoneNum').text('');
	    	$('.phoneNum_box').css('color', 'black');
	    	$('#input_phoneNum').attr('validation', 'true');
			
		}
	}
	
	<!-- 체크박스 유효성 검사 -->
	function isCheckbox(){
		if(!$('#group_1').prop('checked')){
			$('#input_err_checkbox').text('슈크림 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.');
			$('#group_1').attr('validation', 'false');
		}else{
			$('#input_err_checkbox').text('');
			$('#group_1').attr('validation', 'true');
		}
	}
	
	<!-- 전체선택 -->
	function checkAll(list){
		list.forEach(function(item){
			$(item).prop('checked', true);
		});
	}
	
	<!-- 전체해제 -->
	function resetAll(list){
		list.forEach(function(item){
			$(item).prop('checked', false);
		});
	}
	
	<!-- 서브 체크박스가 모두 체크되면 그룹 체크박스 체크/하나라도 체크가 해제되면 그룹 체크박스 언체크 -->
	function setCheckbox(size, count, group){
		if(size==count){
			$(group).prop('checked', true);
		}else{
			$(group).prop('checked', false);
		}
	}
});

</script>
</body>
</html>