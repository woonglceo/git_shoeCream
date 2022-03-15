<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/shoeCream/resources/css/buying.css">
</head>
<body>

<div class="my_purchase">
	<div class="title"><div class="title"><h3>구매 내역</h3></div></div>
		<div class="purchase_list_tab detail_tab">
			<div class="tab_item tab_on tab_item1">
				<a href="/shoeCream/my/buying" class="tab_link">
					<dl class="tab_box">
						<dt class="title">구매 입찰</dt>
						<dd class="count">
							<c:if test = "${empty totalCount}">	
								0
							</c:if>
							<c:if test = "${!empty totalCount}">	
								${totalCount}
							</c:if>
						</dd>
					</dl>
				</a>
			</div>
			<div class="tab_item tab_item2">
				<a href="/shoeCream/my/ingBuying" class="tab_link" id="ingBuying">
					<dl class="tab_box">
						<dt class="title">거래 중</dt>
						<dd class="count">
							<c:if test = "${empty ingCount}">	
								0
							</c:if>
							<c:if test = "${!empty ingCount}">	
								${ingCount}
							</c:if>
						</dd>
					</dl>
				</a>
			</div>
			<div class="tab_item tab_item3">
				<a href="/shoeCream/my/endBuying" class="tab_link">
					<dl class="tab_box">
						<dt class="title">거래완료</dt>
						<dd class="count">
							<c:if test = "${empty endCount}">	
								0
							</c:if>
							<c:if test = "${!empty endCount}">	
								${endCount}
							</c:if>
						</dd>
					</dl>
				</a>
			</div>
			</div>		
	</div>
			 
	<div class="period_search">
		<div class="period_month">
			<ul class="month_list">
				<li class="month_item"><a href="#" class="month_link" id="Month2">최근 2개월</a></li>
				<li class="month_item"><a href="#" class="month_link" id="Month4">4개월</a></li>
				<li class="month_item"><a href="#" class="month_link" id="Month6">6개월</a></li>
				<li class="month_item custom"><a href="#" class="month_link">기간조회</a></li>
			</ul>
		</div>
		<div class="period_calendar_wrapper" today="Mon Mar 14 2022 10:47:08 GMT+0900 (한국 표준시)">
			<div class="period_calendar">
				<div class="calendar_wrap">
					<span>
						<div class="calendar">
							<input disabled="disabled" class="cal_input">
							<span class="cal_btn"></span>
						</div>
						<div class="vc-popover-content-wrapper"></div>
					</span></div><span class="swung_dash">~</span>
				<div class="calendar_wrap">
					<span>
						<div class="calendar">
							<input class="cal_input">
							<span class="cal_btn"></span>
						</div>
						<div class="vc-popover-content-wrapper"></div>
					</span>
				</div>
			</div>
			<div class="period_btn_box"><button class="btn_search is_active">조회</button></div>
		</div>
	</div>
	
	<ul class="search_info">
		<li class="info_item"><p data-v-a54c4c26="">한 번에 조회 가능한 기간은 최대 6개월입니다.</p></li>
		<li class="info_item"><p data-v-a54c4c26="">기간별 조회 결과는 입찰일 기준으로 노출됩니다.</p></li>
	</ul>
	
	<div class="purchase_list bidding bid">
		<jsp:include page="${display2}"></jsp:include>
	</div>
	
	
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
 	<script type="text/javascript">
 	
 	// 페이지 이동하기
 	function paging(pageValue) {	
 		console.log(pageValue);
 		location.href = '/shoeCream/my/buying?pg='+pageValue;	
 	}
 	</script>

</body>
</html>