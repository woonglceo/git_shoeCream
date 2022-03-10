// 상품 목록 불러오기
$(function(){	 
	 $.ajax({
		 type: 'post',
		 url: '/shoeCream/adminViews/product/getProductList',
		 data: 'pg='+$('#pg').val(),
		 dataType: 'JSON',
		 success: function(data){ 
			$.each(data.list, function(index, items){
					$('<tr/>')
		 			.append($('<td/>')
							.append($('<input/>', {type: 'checkbox', name:'check', value: items.productId})))
		 			.append($('<td/>', {text: items.productId}))
		 			.append($('<td/>')
			 				.append($('<img/>', {src: '/shoeCream/admin/assets/storage/' + items.img1, style: 'width: 50px; height: 50px; cursor: pointer;', class: 'img' }))
			 				)
			 		.append($('<td/>', {text: items.productName}))
			 		.append($('<td/>')
		 					.append($('<a/>', {href: '/shoeCream/adminViews/product/updateProduct?pg=' + $('#pg').val() + '&modelId=' + items.modelId, text: '수정', class: 'linkA'})))
			 		.append($('<td/>')
		 					.append($('<a/>', {href: '/shoeCream/adminViews/product/deleteProduct?modelId=' + items.modelId, text: '삭제', class: 'linkA'})))
		 			.append($('<td/>')
		 					.append($('<a/>', {href: '/shoeCream/adminViews/product/stockView?modelId=' + items.modelId, text: '재고량', class: 'linkA subjectMoim_' + items.modelId})))
			 		.appendTo($('#productListTable'));

			 }); // each문			 			 
		
			// 페이징처리
			$('#productPagingDiv').html(data.productPaging.pagingHTML);
			 
		 },
		 error: function(err){
				alert(err);
		}		 
	 });	 
});


// 검색		
$('.input-group-append').click(function(){
			
	if($('#inputWord').val() == ''){
		 alert('검색어를 입력하세요.');
	 }else{
		 $.ajax({
			 type: 'post',
			 url: '/shoeCream/adminViews/product/searchProduct',
			 data: {'searchOption':$('#searchOption').val(),
				    'inputWord':$('#inputWord').val(),
				    'searchPg' : $('#searchPg').val()},			   
			 dataType: 'JSON',
			 success: function(data){
			 
			 	// 현재 생성되어 있던 테이블 지우기
				$('#productListTable tr:gt(0)').remove();
				 
				$.each(data.list, function(index, items){
					$('<tr/>')
		 			.append($('<td/>')
							.append($('<input/>', {type: 'checkbox', name:'check', value: items.productId})))
		 			.append($('<td/>', {text: items.productId}))
		 			.append($('<td/>')
			 				.append($('<img/>', {src: '/shoeCream/admin/assets/storage/' + items.img1, style: 'width: 50px; height: 50px; cursor: pointer;', class: 'img' }))
			 				)
			 		.append($('<td/>', {text: items.productName}))
			 		.append($('<td/>')
		 					.append($('<a/>', {href: '/shoeCream/adminViews/content/updateEventView?pg=' + $('#pg').val() + '&productId=' + items.productId, text: '수정', class: 'linkA subjectMoim_' + items.productId})))
			 		.append($('<td/>')
		 					.append($('<a/>', {href: '/shoeCream/adminViews/product/deleteProduct?productId=' + items.productId, text: '삭제'})))
		 			.append($('<td/>')
		 					.append($('<a/>', {href: '/shoeCream/adminViews/product/stockView?modelId=' + items.modelId, text: '재고량', class: 'linkA subjectMoim_' + items.modelId})))
			 		.appendTo($('#productListTable'));
				 }); // each문
				 
				// 페이징처리
				$('#productPagingDiv').html(data.productPaging.pagingHTML);
				 
			 },
			 error: function(err){
					alert(err);
			}		 
	 	}); 
	 	
	 	
		 
	 } // else
			
	});
	
	
	
// 체크박스 처리
$('#all').click(function(){
	
	if($('#all').prop('checked')){
		$('input[name=check]').prop('checked', true);
	}else{
		$('input[name=check]').prop('checked', false);
	}
	
});



// 페이지 이동하기
function boardPaging(pageValue) {	

	var inputWord = $('#inputWord').val();
	if(inputWord == ''){
		location.href = '/shoeCream/adminViews/product/productList?pg='+pageValue;
	}else {
		$('#searchPg').val(pageValue);
		// 검색 
		$('.input-group-append').trigger('click');
		$('#searchPg').val(1)
	}
}