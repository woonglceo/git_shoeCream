$(function(){

	//getEventList
	$.ajax({
		type: 'POST',
		url: '/shoeCream/event/getEventList',
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