<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 찾기</title>
<link rel="stylesheet" href="/shoeCream/resources/css/find_email.css">
</head>
<body>
<jsp:include page="top.jsp"></jsp:include>
<form action="/shoeCream/user/find_email_success" method="post" id="help">
<div class="help">
	<h2 class="help_title">이메일 아이디 찾기</h2>
	
	<div class="help_notice">
		<p class="notice_txt">
		 가입 시 등록한 휴대폰 번호를 입력하면
		 <br>
		 이메일 주소의 일부를 알려드립니다. 
		</p>
	</div>
	
	<div class="input_box">
		<div class="phone_box">
			<h3 class="input_title">휴대폰 번호</h3>
			<input type="text" class="input_txt" id="input_phoneNum" placeholder="가입하신 휴대폰 번호" autocomplete="off">
		</div>
	</div>
	
	<input type="button" class="btn" value="이메일 아이디 찾기">
	<input type="hidden" name="result" value="${result}">
</div>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	<!-- 숫자만 입력 -->
	$('#input_phoneNum').on('input', function(e){
		$(this).val($(this).val().replace(/[^0-9]/g,""));

		let text = $(this).val();
		
		<!-- 버튼 활성화 -->
		if (text.length > 9) {
			$('.btn').addClass('btn_able');
			$('.btn').removeClass('btn_disabled');
			$(this).attr('validation', 'true');
		}else{
			$('.btn').addClass('btn_disabled');
		}
			
	});
	
	<!-- 이메일 찾기 -->
	$('.btn').click(function(){
		if($(this).hasClass('btn_able')){
			//console.log($('#input_phoneNum').val());
			$.ajax({
				type:'post',
				url:'/shoeCream/user/find_email_ok',
				data:'phoneNum='+$('#input_phoneNum').val(),
				dataType:'text',
				success:function(data){
					// console.log(data);
					if(data=='not_exist'){
						alert('일치하는 사용자 정보를 찾을 수 없습니다.');
						location.reload();
					}else{
						location.href="/shoeCream/user/find_email_success?email="+maskingData(data);
					}
				},
				error:function(){
					alert('Error:이메일찾기');
				}
			}); // end ajax
		}
	});
	
	<!-- 마스킹 처리 -->
	function maskingData(email){
		console.log(email);
		var len = email.split('@')[0].length-3;
		return email.replace(new RegExp('.(?=.{0,' + len + '}@)', 'g'), '*');
	}
});
</script>
</body>
<%-- <jsp:forward page="find_email_success.jsp" /> --%>
</html>