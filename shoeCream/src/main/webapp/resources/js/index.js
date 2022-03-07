$(function(){

	//getEventList
	$.ajax({
		type: 'POST',
		url: '/shoeCream/event/getEventList2',
		data: 'pg='+1,	
		//dataType: 'JSON',
		success: function(data){
			console.log(data);
			
		},
		error: function(err){
			alert('이벤트 에러났습니다');
			console.log(err);
		}
	});//end ajax
	
	//getProductList
	$.ajax({
		type: 'POST',
		url: '/shoeCream/get/product/getProductList',
		data: 'pg='+1,	
		//dataType: 'JSON',
		success: function(data){
			console.log(data);
			
		},
		error: function(err){
			alert('이벤트 에러났습니다');
			console.log(err);
		}
	});//end ajax
	
	//getStyleList
	$.ajax({
		type: 'POST',
		url: '/shoeCream/style/getStyleList',
		data: 'pg='+1,	
		//dataType: 'JSON',
		success: function(data){
			console.log(data);
			
		},
		error: function(err){
			alert('이벤트 에러났습니다');
			console.log(err);
		}
	});//end ajax

});//end onload