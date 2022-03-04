$(function(){
	$.ajax({
		type: 'POST',
		url: '/shoeCream/admin/adminViews/order/getDealList',
		data: 'pg=' + $('#pg').val(),	
		//dataType: 'JSON',
		success: function(data){
			console.log('data', data);
			
			//gt(0)는 0보다 큰 애를 뜻한다(Greater Than)
			//즉, th말고 다른줄들은 싹 다 지운다
			$('#dealListTable tr:gt(0)').remove(); 
			
			$.each(data.list, function(index, items){
				var ds = '배송전';
				if(items.deliveryStatus == 1) {
					ds = '배송중';
				} else if(items.deliveryStatus == 2) {
					ds = '배송완료';
				}
				
				$('<tr/>')			
					.append($('<td/>', {    // 거래번호
						}).append($('<a/>', {
							href: '/shoeCream/admin/adminView/deal/dealView?dealId='+items.dealId,
							text: items.dealId,
							class: 'deal_' + items.dealId  //'subjectA subjectA_' + items.seq    
						}))
					).append($('<td/>', { // 상품이름
						}).append($('<a/>', {
							href: '/shoeCream/product/productView?productId='+items.productId,
							text: items.productName,
							class: 'product_' + items.productId  //'subjectA subjectA_' + items.seq    
						}))
					).append($('<td/>', {	// 구매자아이디
						text: items.purchaseUserId
					})).append($('<td/>', {	// 판매자아이디
						text: items.salesUserId
					})).append($('<td/>', {	// 검수상태
						text: ''
					})).append($('<td/>', {	// 배송상태
						text: ''
					})).append($('<td/>', {	// 입찰마감기한
						text: items.purchaseDueDate
					})).append($('<td/>', {	// 판매마감기한
						text: items.salesDueDate
					})).appendTo($('#dealListTable'));	

			});//end each
			
			// 페이징 처리
			$('#dealPagingDiv').html(data.dealPaging.pagingHTML);
		},
		error: function(err){
			alert('에러났습니다');
			console.log(err);
		}
	});//end ajax
});//end onload

function dealPaging(newPg){
	location.href = '/shoeCream/admin/adminViews/order/dealList?pg='+newPg;
}

$('#searchBtn').click(function(){
	//alert($('#dealSearchSelect').val()+', '+$('#dealSearchText').val());
	$('#dealSearchDiv').empty();
	if($('#dealSearchText').val() == '') {
		//alert('값을 입력해주세요.');
		$('#dealSearchDiv').text('값을 입력해주세요');
	} else {
		$.ajax({
			type: 'POST',
			url: '/shoeCream/admin/adminViews/deal/getDealSearchList',
			data: {
				searchOption: $('#dealSearchSelect').val(),
				keyword: $('#dealSearchText').val(),
				pg: '1'
			},
			success: function(data){
				$('#dealListTable tr:gt(0)').remove(); 
				alert('헐 성공했삼');
				console.log(data)
			},
			error: function(err){
				alert('오류났다아~~~');
				console.log(err);
			},
			beforeSend: function(){
				
				$('<div/>', {
					text: '로딩중입니다.',
					id: 'loadingDiv'
				}).appendTo($('#dealListTable'));	
				
				
				$('#dealSearchDiv').text('로딩중입니다.');				
			},
			complete: function(){
				//$('#loadingDiv').hide();
				
			}
		});//end ajax
	}//end if
});//end click
