
$(function(){	 
// 공지사항 목록 불러오기
	 $.ajax({
		 type: 'post',
		 url: '/shoeCream/adminViews/content/getAnnounceList',
		 data: 'pg='+$('#pg').val(),
		 dataType: 'JSON',
		 success: function(data){ 
		 console.log(data.list);
			$.each(data.list, function(index, items){
					$('<tr/>')
					.append($('<td/>')
							.append($('<input/>', {type: 'checkbox', name:'check', value: items.announceId})))
		 			.append($('<td/>', {text: items.announceId}))		 					
		 			.append($('<td/>')
			 				.append($('<img/>', {src: '/shoeCream/admin/assets/storage/' + items.img1, style: 'width: 50px; height: 50px; cursor: pointer;', class: 'img' }))
			 				)
			 		.append($('<td/>', {text: items.title}))
		 			.append($('<td/>', {text: items.regDate}))
			 		.append($('<td/>')
		 					.append($('<a/>', {href: '/shoeCream/adminViews/content/updateAnnounceView?pg=' + $('#pg').val() + '&announceId=' + items.announceId, text: '수정', class: 'linkA subjectMoim_' + items.announceId})))
			 		.append($('<td/>')
		 					.append($('<a/>', {href: '/shoeCream/adminViews/content/getAnnounceView' + items.announceId, text: '삭제', class: 'linkA subjectMoim_' + items.seq})))
			 	.appendTo($('#announceListTable'));
			 }); // each문
			 			 
		
			// 페이징처리
			$('#announcePagingDiv').html(data.announcePaging.pagingHTML);
			 
		 },
		 error: function(err){
				alert(err);
		}		 
	 });
	 
	 
// 검색		
$('.input-group-append').click(function(){
			
	if($('#inputWord').val() == ''){
		 alert('검색어를 입력하세요.');
	 }else{
		 $.ajax({
			 type: 'post',
			 url: '/shoeCream/adminViews/content/searchAnnounce',
			 data: {'searchOption':$('#searchOption').val(),
				    'inputWord':$('#inputWord').val(),
				    'searchPg' : $('#searchPg').val()},			   
			 dataType: 'JSON',
			 success: function(data){
			 
			 	// 현재 생성되어 있던 테이블 지우기
				$('#announceListTable tr:gt(0)').remove();
				 
				$.each(data.list, function(index, items){
					$('<tr/>')
					.append($('<td/>')
							.append($('<input/>', {type: 'checkbox', name:'check', value: items.announceId})))
		 			.append($('<td/>', {text: items.announceId}))
		 			.append($('<td/>')
			 				.append($('<img/>', {src: '/shoeCream/admin/assets/storage/' + items.img1, style: 'width: 50px; height: 50px; cursor: pointer;', class: 'img' }))
			 				)
			 		.append($('<td/>', {text: items.title}))
		 			.append($('<td/>', {text: items.regDate}))
			 		.append($('<td/>')
		 					.append($('<a/>', {href: '/shoeCream/adminViews/content/updateAnnounceView?pg=' + $('#pg').val() + '&announceId=' + items.announceId, text: '수정', class: 'linkA subjectMoim_' + items.announceId})))
			 		.append($('<td/>')
		 					.append($('<a/>', {href: '/shoeCream/adminViews/content/getAnnounceView' + items.announceId, text: '삭제', class: 'linkA subjectMoim_' + items.seq})))
			 		.appendTo($('#announceListTable'));
				 }); // each문
				 
				 // 페이징처리
				 $('#announcePagingDiv').html(data.announcePaging.pagingHTML);
				 
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

});

// 페이지 이동하기
function boardPaging(pageValue) {	

	var inputWord = $('#inputWord').val();
	if(inputWord == ''){
		location.href = '/shoeCream/adminViews/content/announceList?pg='+pageValue;
	}else {
		$('#searchPg').val(pageValue);
		// 검색 
		$('.input-group-append').trigger('click');
		$('#searchPg').val(1)
	}
}

