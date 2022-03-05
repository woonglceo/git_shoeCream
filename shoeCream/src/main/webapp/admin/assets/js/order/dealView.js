$(function(){
	$.ajax({
		type: 'POST',
		url: '/shoeCream/adminViews/order/getDeal',
		data: 'dealId=' + $('#dealIdText').val(),	
		//dataType: 'JSON',
		success: function(data){
			console.log('data', data);
			
		},
		error: function(err){
			alert('에러났습니다');
			console.log(err);
		}
	});//end ajax
});//end onload

