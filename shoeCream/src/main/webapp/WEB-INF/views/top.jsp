<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nav Bar</title>
<link rel="stylesheet" href="/shoeCream/resources/css/top.css">
<script src="https://kit.fontawesome.com/c32a0a7a55.js" crossorigin="anonymous"></script>
</head>
<body>
	<header>
		<div class="header">
			<ul class="list_menu">
				<li><a href="/shoeCream/serviceCenter/notice">고객센터</a></li>
				<li><a href=#>관심상품</a></li>
				<li><a href=#>마이페이지</a></li>
				<li><a href="/shoeCream/admin/adminIndex.jsp">관리자페이지</a></li>
				<li><a href=#>로그인</a></li>
			</ul>
			<hr>
		
			<nav class="navbar">
				<div class="navbar__logo">
					<a href="/shoeCream/index.jsp"><img alt="logo" src="/shoeCream/resources/images/KREAM_logo.png"></a>
				</div>
				
				<ul class="navbar__menu">
					<li><a href=#>STYLE</a></li>
					<li><a href=#>SHOP</a></li>
					<li><a href=#>ABOUT</a></li>
					<li><a href=#><i class="fa-solid fa-magnifying-glass fa-lg"></i></a></li>
				</ul>
			</nav>
			<hr>
		</div>
	</header>
</body>
</html>