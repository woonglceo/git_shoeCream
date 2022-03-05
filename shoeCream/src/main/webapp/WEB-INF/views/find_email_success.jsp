<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 찾기 성공</title>
<link rel="stylesheet" href="/shoeCream/resources/css/find_email_success.css">
</head>
<body>
<jsp:include page="top.jsp"></jsp:include>
<%-- <% 
	String result = request.getParameter("result");
	if (result != null) {
%>
<%
	}
%> --%>
<form id="help_success">
<div class="help_success">
	<h2 class="help_title_success">이메일 주소 찾기에 성공하였습니다.</h2>
	
	<div class="success_notice">
		<p class="success_notice_title">이메일 주소</p>
		<p class="success_notice_txt">${email}</p>
	</div>
	
	<div class="success_btn_box">
		<input type="button" class="btn" id="find_password_btn" value="비밀번호 찾기">
		<input type="button" class="btn" id="login_btn" value="로그인">
	</div>
	
</div>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

</script>
</body>
</html>