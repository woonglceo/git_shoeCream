<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="/shoeCream/resources/css/serviceCenter.css">
</head>
<body>
	<jsp:include page="top.jsp"></jsp:include>
	<div id="main"> 		
 		<div class="main_container">
 			<div class="left_nav">
	 			<ul class="left_menu">
	 				<li><h2>고객센터</h2></li>
	 				<li><a href="#" id="notice" class="active" onclick="getContents('/shoeCream/serviceCenter/notice2');">공지사항</a></li>
	 				<li><a href="#" id="faq" onclick="getContents('/shoeCream/serviceCenter/faq');">1:1 문의</a></li>
	 			</ul>
 			</div>
 			<div id="content_area">
 			
 			</div>
 		</div>
 	</div>
 	
 	<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
 	<script type="text/javascript">
 			
		//기본화면=notice
		$(function(){
			$('#content_area').load('/shoeCream/serviceCenter/notice2');
		});	
	
		//선택메뉴 bold처리
		$('#notice, #faq').click(function(){
			$('.left_menu').children().children('a').removeClass("active");
			$(this).addClass("active");
		}); 
		
		//선택메뉴 jsp 불러오기
		function getContents(url) {
			$('#content_area').load(url);
		}
 		
 	</script>
</body>
</html>