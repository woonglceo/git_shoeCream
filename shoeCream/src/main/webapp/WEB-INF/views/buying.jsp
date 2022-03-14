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
			<div class="tab_item tab_on">
				<a href="#" class="tab_link">
					<dl class="tab_box">
						<dt class="title">구매</dt>
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
			<div class="tab_item">
				<a href="#" class="tab_link">
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
			<div class="tab_item">
				<a href="#" class="tab_link">
					<dl class="tab_box">
						<dt class="title">종료</dt>
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
			 
	<div class="period_search">
		<div class="period_month">
			<ul class="month_list">
				<li class="month_item"><a href="#" class="month_link">최근 2개월</a></li>
				<li class="month_item"><a href="#" class="month_link">4개월</a></li>
				<li class="month_item"><a href="#" class="month_link">6개월</a></li>
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
		<div class="purchase_head">
			<div class="head_product"><a href="#" class="btn_filter"> 전체 <svg xmlns="http://www.w3.org/2000/svg" class="ico-arr-dir-down-circle icon sprite-icons"><use href="/_nuxt/3eb827d04a461ab3eecd387024737978.svg#i-ico-arr-dir-down-circle" xlink:href="/_nuxt/3eb827d04a461ab3eecd387024737978.svg#i-ico-arr-dir-down-circle"></use></svg></a></div>
			<div class="head_status">
				<div class="status_box field_price"><a href="#" class="status_link"><span class="status_txt">구매가</span></a></div>
				<!-- <div class="status_box field_date_purchased"><a  href="#" class="status_link"><span  class="status_txt">구매일</span></a></div>
				<div class="status_box field_date_paid"><a href="#" class="status_link"><span class="status_txt">정산일</span></a></div> -->
				<div class="status_box field_expires_at"><a  href="#" class="status_link"><span class="status_txt">만료일</span></a></div>
				<!-- <div class="status_box field_status ascending"><a href="#" class="status_link"><span class="status_txt">상태</span></a></div> -->
				
				
				<!-- 모달창 부분 -->
				<div class="layer lg">
					<div class="layer_container">
						<div class="layer_header"><h2 class="title">선택한 상태 보기</h2></div>
						<div lass="layer_content">
							<div class="select_status">
								<ul class="status_list">
									<li class="status_item item_on"><a href="#" class="status_link2">전체</a></li>
									<li class="status_item"><a href="#" class="status_link2">거래 중</a></li>
									<li class="status_item status_danger"><a href="#" class="status_link2">기한만료</a></li>
								</ul>
							</div>
						</div>
					<a class="btn_layer_close"><img src="/shoeCream/resources/storage/xxx.png" style="width: 20px; height: 20px"></a></div>
				</div>
			</div>
		</div>
	</div>
	
		<c:if test="${empty buyList}">		
			<div class="empty-area">				
				<p>구매 입찰 내역이 없습니다.</p>
				<a href="/shoeCream/shop" class="gray_btn mypage_btn">SHOP 바로가기</a>
			</div>
		</c:if>
		
		
		<ul>			
			<c:forEach var="i" items="${buyList}">		
			
			<div class="purchase_item bid">
				<div class="history_product">
					<div class="product_box">
						<div class="shopDetail-top_img">
						        <img class="shopDetail-top_Realimg" src='/shoeCream/resources/storage/11.jpg'>
						 </div>
					</div>
					<div class="product_detail">
						<p class="name">${i.productName}</p>
						<p class="size"><span class="size_text">285</span></p>
					</div>
				</div>
				<div class="history_status">
					<div class="status_box field_price">
						<span class="price"><fmt:formatNumber value="${i.price}" pattern="###,###,###"/>원</span>
					</div>
					<div class="status_box field_date_purchased">
						<span class="dueDate"> ${i.dueDate}</span>
					</div>
				</div>
			</div>
				
			</c:forEach>
		</ul>
	</div>
	
	<div class="pagingDiv" id="pagingDiv">${paging.pagingHTML}</div>
	<input type="hidden" id="pg" value="${pg}">
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
 	<script type="text/javascript">
 	$(function() {
 		$('.layer').hide();
 		
 		// 모달창 열기 / 끄기
 	 	$('.btn_filter').click(function(){$('.layer').show()});
 	    $('.btn_layer_close').click(function(){$('.layer').hide()});
	});
 	// 페이지 이동하기
 	function paging(pageValue) {	
 		console.log(pageValue);
 		location.href = '/shoeCream/my/buying?pg='+pageValue;	
 	}
 	</script>
</body>
</html>