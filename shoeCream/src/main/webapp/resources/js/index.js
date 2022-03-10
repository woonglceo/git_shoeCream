$(function(){
	//slickF;

	$('.banner_item-slide').slick({    
		prevArrow : ".slick-prev", // 이전 화살표 모양 설정
		nextArrow : ".slick-next",
		infinite: true,      // 무한반복
	    slidesToShow: 1,     // 보여지는 슬라이드 개수
	    slidesToScroll: 1,   // 넘어가는 슬라이드 개수
	    dots: true,           // 점 네비게이션 표시
		arrows: true
	});
	
	/*
	//style 슬릭 슬라이드
	$(".style_wrap").slick({
		infinite : true,
		slidesToShow : 4,
		slidesToScroll : 1,

		prevArrow : ".prev", // 이전 화살표 모양 설정
		nextArrow : ".next", // 다음 화살표 모양 설정
	});
	$(".style_wrap").slick("init");
	*/

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
			alert('상품 에러났습니다');
			console.log(err);
		}
	});//end ajax
	
	//getStyleList
	$.ajax({
		type: 'POST',
		url: '/shoeCream/style/getPopularList',
		data: 'pg='+1,	
		//dataType: 'JSON',
		success: function(data){
			console.log(data);
			
		},
		error: function(err){
			alert('스타일 에러났습니다');
			console.log(err);
		}
	});//end ajax

});//end onload

/*
function slickF() {
	$('.banner_item-slide').slick({    
		//slidesToShow: 1,
		//centerMode: true,
		prevArrow : ".slick-prev", // 이전 화살표 모양 설정
		nextArrow : ".slick-next",
		infinite: true,      // 무한반복
	    slidesToShow: 1,     // 보여지는 슬라이드 개수
	    slidesToScroll: 1,   // 넘어가는 슬라이드 개수
	    dots: true           // 점 네비게이션 표시
	});
}
*/