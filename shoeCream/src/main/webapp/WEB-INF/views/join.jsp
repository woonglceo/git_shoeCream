<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<link rel="stylesheet" href="/shoeCream/resources/css/join.css">
<script src="https://kit.fontawesome.com/c32a0a7a55.js" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="top.jsp"></jsp:include>
<form id="join_form">
<div class="join">
	<h2 class="join_title">회원가입</h2>
	
	<div class="input_box">
		<div class="username_box">
			<h3 class="input_title">아이디*</h3>
			<input type="text" class="input_txt" id="input_username" placeholder="예) 영문, 숫자 5~15자" autocomplete="off">
			<p class="input_err" id="input_err_username"></p>
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
		<div class="fullName_box">
			<h3 class="input_title">이름*</h3>
			<input type="text" class="input_txt" id="input_fullName" placeholder="고객님의 이름" autocomplete="off">
			<p class="input_err" id="input_err_fullName"></p>
		</div>
	</div>
	
	<div class="input_box">
		<div class="nickname_box">
			<h3 class="input_title">닉네임*</h3>
			<input type="text" class="input_txt" id="input_nickname" placeholder="나만의 프로필 이름" autocomplete="off">
			<p class="input_err" id="input_err_nickname"></p>
		</div>
	</div>
	
	<div class="input_box">
		<div class="email_box">
			<h3 class="input_title">이메일 주소*</h3>
			<input type="text" class="input_txt" id="input_email" placeholder="예) shoe@kream.co.kr" autocomplete="off">
			<input type="button" class="auth_btn" value="인증하기">
			<p class="input_err" id="input_err_email"></p>
		</div>
	</div>
	
	<div class="input_box">
		<div class="check_email">
			<h3 class="input_title">인증번호*</h3>
			<input type="text" class="input_txt" id="input_authEmail" placeholder="인증번호 입력" autocomplete="off">
			<input type="button" class="check_btn" id="check_btn_email" value="확인">
			<p class="input_msg" id="input_msg"></p>
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
		<p class="input_err" id="input_err_checkbox"></p>
	</div>
	
	<input type="button" class="join_btn" value="가입하기">
	<input type="hidden" id="chkUsername">
	<input type="hidden" id="chkNickname">
	<input type="hidden" id="chkEmail">
	<input type="hidden" id="authEmail">
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
	
	$('#input_username').on('input change keyup keydown', function(){
		isUsername();
		chkUsername();
	});
	
	$('#input_pwd').on('input', function(){
		isPwd();
	});
	
	$('#input_fullName').on('input', function(){
		isFullName();
	});
	
	$('#input_nickname').on('input', function(){
		isNickname();
		chkNickname();
	});
	
	$('#input_email').on('input change keyup keydown', function(){
		isEmail();
		chkEmail();
		
		$('#authEmail').val('');
		$('#input_authEmail').val('');
		$('#input_authEmail').removeClass('input_txt_readonly');
		$('#input_authEmail').prop('readonly', false);
		$('#input_authEmail').attr('validation', 'false');
		$('.check_btn').removeClass('check_btn_able');
		$('.input_msg').text('');
	});

	$('#input_phoneNum').on('input', function(){
		<!-- 숫자만 입력 -->
		$(this).val($(this).val().replace(/[^0-9]/g,""));
		isPhoneNum();
	});
	
	$('#group_1, #allow_agreement, #allow_privacy').click(function(){
		isCheckbox();
	});
	
	<!-- 이메일 인증하기 -->
	$('.auth_btn').click(function(){
		if($('#input_email').attr('validation')=='true'&&$('#chkEmail').attr('validation')=='true'){
			$.ajax({
				type:'post',
				url:'/shoeCream/user/authEmail',
				data:'email='+$('#input_email').val(),
				dataType:'text',
				success:function(data){
					$('.input_msg').text('인증 이메일이 발송되었습니다.');					
					$('#authEmail').val(data); // 인증번호
					$('#input_authEmail').focus();
					$('.check_btn').addClass('check_btn_able');
				},
				error:function(){
					alert('Error: 이메일 인증');
				}
			}); // end ajax			
		}else{
			isEmail();
			chkEmail();
		}
	});
	
	<!-- 이메일 인증번호 확인 -->
	$('.check_btn').click(function(){
		if($(this).hasClass('check_btn_able')){
			if($('#input_authEmail').val()==''){
				$('.input_msg').text('인증번호를 정확히 입력해주세요.');
			}else{
				if($('#input_authEmail').val()==$('#authEmail').val()){
					$('#input_authEmail').addClass('input_txt_readonly');
					$('#input_authEmail').prop('readonly', true);
					$('#input_authEmail').attr('validation', 'true');
					$('.check_btn').removeClass('check_btn_able');
					$('.input_msg').text('');
				}			
			}			
		}
	});
	
	<!-- 회원가입 -->
	$('.join_btn').click(function(){		
		<!-- 유효성 검사 -->
		isUsername();
		chkUsername();
		isPwd();
		isFullName();
		isNickname();
		chkNickname();
		isEmail();
		chkEmail();
		isAuth();
		isPhoneNum();
		isCheckbox();

		const username = $('#input_username').attr('validation');
		const validUsername = $('#chkUsername').attr('validation');
		const pwd = $('#input_pwd').attr('validation');
		const fullName = $('#input_fullName').attr('validation');
		const nickname = $('#input_nickname').attr('validation');
		const validNickname = $('#chkNickname').attr('validation');
		const email = $('#input_email').attr('validation');
		const validEmail = $('#chkEmail').attr('validation');
		const authEmail = $('#input_authEmail').attr('validation');
		const phoneNum = $('#input_phoneNum').attr('validation');
		const checkbox = $('#group_1').attr('validation');
		
		if(username=='true'&&validUsername=='true'&&pwd=='true'&&fullName=='true'&&nickname=='true'&&
				validNickname=='true'&&email=='true'&&validEmail=='true'&&authEmail=='true'&&phoneNum=='true'&&checkbox=='true'){
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
    				            url:'/shoeCream/user/joinOk',
    				            data:{
    				            	'username':$('#input_username').val(),
    				                'pwd':$('#input_pwd').val(),
    				                'fullName':$('#input_fullName').val(),
    				                'nickname':$('#input_nickname').val(),
    				                'email':$('#input_email').val(),
    				                'phoneNum':$('#input_phoneNum').val()
    							},
    				            success:function(){
    				            	Swal.fire({
    				                	title:'회원가입이 완료되었습니다.',
    				                	text:'로그인 후 이용해주세요.',
    				                	icon:'success'
    				              	}).then((result) => {
    				                	location.href='/shoeCream/index.jsp';
    				            	});
    				            },
    				            error:function(){
    				            	alert('Error: 회원가입');
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
	
	<!-- 아이디 유효성 검사 -->
	function isUsername(){
		const username = $('#input_username').val();
		const reg = RegExp(/^[a-zA-Z0-9]{4,16}$/g);
		
		if($('#input_username').val()==''){
			$('#input_err_username').text('필수 정보입니다.');
			$('#input_username').attr('validation', 'false');
			return;
		}
		
		if(!reg.test(username)){
			$('#input_err_username').text('영문 소문자와 숫자를 입력해주세요. (4~16자)');
		    $('.username_box').css('color', '#d5624f');
		    $('#input_username').attr('validation', 'false');
	    }else{
	    	$('#input_err_username').text('');
	    	$('.username_box').css('color', 'black');
	    	$('#input_username').attr('validation', 'true');
	    }	
	}
	
	<!-- 아이디 중복체크 -->
	function chkUsername(){
		const username = $('#input_username').val();
		
		if($('#input_username').attr('validation')=='true'){
			$.ajax({
				type:'post',
				url:'/shoeCream/user/chkUsername',
				data:'username='+username,
				dataType:'text',
				success:function(data){
					if(data=='exist'){
						$('#input_err_username').text('이미 사용 중인 아이디입니다.');
				    	$('.username_box').css('color', '#d5624f');
				    	$('#chkUsername').attr('validation', 'false');
					}else if(data=='not_exist'){
						$('#input_err_username').text('');
						$('.username_box').css('color', 'black');
				    	$('#chkUsername').attr('validation', 'true');
					}
				},
				error:function(err){
					alert("Error: 아이디 중복체크");
				}
			}); // end ajax
		}
	}
	
	<!-- 비밀번호 유효성 검사 -->
	function isPwd(){
		const pwd = $('#input_pwd').val();
		const reg = RegExp(/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/);
		
		if($('#input_pwd').val()==''){
			$('#input_err_pwd').text('필수 정보입니다.');
			$('#input_pwd').attr('validation', 'false');
			return;
		}
		
		if(!reg.test(pwd)){
		    $('#input_err_pwd').text('영문, 숫자, 특수문자를 조합하여 입력해주세요. (8-16자)');
		    $('.pwd_box').css('color', '#d5624f');
		    $('#input_pwd').attr('validation', 'false');
	    }else{
	    	$('#input_err_pwd').text('');
	    	$('.pwd_box').css('color', 'black');
	    	$('#input_pwd').attr('validation', 'true');
	    }	
	}
	
	<!-- 이름 유효성 검사 -->
	function isFullName(){
		const fullName = $('#input_fullName').val();
		const reg = RegExp(/^[가-힣]{2,4}$/);
		
		if($('#input_fullName').val()==''){
			$('#input_err_fullName').text('필수 정보입니다.');
			$('#input_fullName').attr('validation', 'false');
			return;
		}
		
		if(!reg.test(fullName)){
			$('#input_err_fullName').text('한글 이름을 입력해주세요. (2-4자)');
			$('.fullName_box').css('color', '#d5624f');
			$('#input_fullName').attr('validation', 'false');
		}else{
			$('#input_err_fullName').text('');
	    	$('.fullName_box').css('color', 'black');
	    	$('#input_fullName').attr('validation', 'true');
		}
	}
	
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
	
	<!-- 이메일 유효성 검사 -->
	function isEmail(){
		const email = $('#input_email').val();
		const reg = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		
		if($('#input_email').val()==''){
			$('#input_err_email').text('필수 정보입니다.');
			$('#input_email').attr('validation', 'false');
			return;
		}
		
		if(!reg.test(email)){
			$('#input_err_email').text('이메일 주소를 정확히 입력해주세요.');
	    	$('.email_box').css('color', '#d5624f');
	    	$('#input_email').attr('validation', 'false');
		}else{
	    	$('#input_err_email').text('');
			$('.email_box').css('color', 'black');
			$('#input_email').attr('validation', 'true');
	    }
	}
	
	<!-- 이메일 중복체크 -->
	function chkEmail(){
		const email = $('#input_email').val();
		
		if($('#input_email').attr('validation')=='true'){
			$.ajax({
				type:'post',
				url:'/shoeCream/user/chkEmail',
				data:'email='+email,
				dataType:'text',
				success:function(data){
					console.log($('#chkEmail').attr('validation'));
					if(data=='exist'){
						$('#input_err_email').text('이미 사용 중인 이메일입니다.');
				    	$('.email_box').css('color', '#d5624f');
				    	$('#chkEmail').attr('validation', 'false');
					}else if(data=='not_exist'){
						$('#input_err_email').text('');
						$('.email_box').css('color', 'black');
				    	$('#chkEmail').attr('validation', 'true');
					}
				},
				error:function(err){
					alert("Error: 이메일 중복체크");
				}
			}); // end ajax
		}
	}
	
	<!-- 이메일 인증 유효성 검사 -->
	function isAuth(){
		if($('#input_authEmail').attr('validation')!='true'){
			$('.input_msg').text('이메일 인증을 완료해주세요.');
			$('#input_authEmail').attr('validation', 'false');
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