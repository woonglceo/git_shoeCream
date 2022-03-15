<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<head>
	<link rel="stylesheet" href="/shoeCream/resources/css/selling.css">
</head>
</head>
<body>

<div class="my_purchase">
	<div class="title"><div class="title"><h3>�Ǹ� ����</h3></div></div>
		<div class="purchase_list_tab detail_tab">
			<div class="tab_item tab_on tab_item1">
				<a href="/shoeCream/my/buying" class="tab_link">
					<dl class="tab_box">
						<dt class="title">�Ǹ� ����</dt>
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
						<dt class="title">���� ��</dt>
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
						<dt class="title">����</dt>
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
				<li class="month_item"><a href="#" class="month_link">�ֱ� 2����</a></li>
				<li class="month_item"><a href="#" class="month_link">4����</a></li>
				<li class="month_item"><a href="#" class="month_link">6����</a></li>
				<li class="month_item custom"><a href="#" class="month_link">�Ⱓ��ȸ</a></li>
			</ul>
		</div>
		<div class="period_calendar_wrapper" today="Mon Mar 14 2022 10:47:08 GMT+0900 (�ѱ� ǥ�ؽ�)">
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
			<div class="period_btn_box"><button class="btn_search is_active">��ȸ</button></div>
		</div>
	</div>
	
	<ul class="search_info">
		<li class="info_item"><p data-v-a54c4c26="">�� ���� ��ȸ ������ �Ⱓ�� �ִ� 6�����Դϴ�.</p></li>
		<li class="info_item"><p data-v-a54c4c26="">�Ⱓ�� ��ȸ ����� ������ �������� ����˴ϴ�.</p></li>
	</ul>
	
	<div class="purchase_list bidding bid">
		<jsp:include page="${display2}"></jsp:include>
	</div>
	
	<div class="pagingDiv" id="pagingDiv">${paging.pagingHTML}</div>
	<input type="hidden" id="pg" value="${pg}">
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
 	<script type="text/javascript">
 	$(function() {
 		$('.layer').hide();
 		
 		// ���â ���� / ����
 	 	$('.btn_filter').click(function(){$('.layer').show()});
 	    $('.btn_layer_close').click(function(){$('.layer').hide()}); 	  
	});
 	
 	// ������ �̵��ϱ�
 	function paging(pageValue) {	
 		console.log(pageValue);
 		location.href = '/shoeCream/my/buying?pg='+pageValue;	
 	}
 	
 	$('#ingBuying').click(function() {
		$('.tab_item1').removeClass('tab_on');
		$('.tab_item2').addClass('tab_on');	
	});
 	</script>
</body>
</html>