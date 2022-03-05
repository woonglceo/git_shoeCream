// 달력위젯

$("#releseDate").datepicker({	 	 
     showOn:"button", 
     buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
     buttonImageOnly: true,
     changeMonth:true,
     dateFormat:"yy-mm-dd",
     dayNames : ['월요일','화요일','수요일','목요일','금요일','토요일','일요일'],
     dayNamesMin : ['월','화','수','목','금','토','일'],
     monthNamesShort:  [ "1월", "2월", "3월", "4월", "5월", "6월","7월", "8월", "9월", "10월", "11월", "12월" ],
     beforeShow:function(input,inst){
    	 setTimeout(function(){
        	 $('#ui-datepicker-div').css({'top':'100px'});
    	 },1);
     }
 });

$('.ui-datepicker-trigger').attr('style','margin-top:-130px; margin-left:40px');

// 원 상품의 정보입력
$(function() {
	$.ajax({
			type: 'post',
			url: '/shoeCream/adminViews/product/getProductInfo',
		    data: {'modelId' : $('#modelId2').val()},
		    dataType: 'JSON',
			success: function (data) {
					console.log(data.productDTO.releaseDate);	
					$('#productName').val(data.productDTO.productName);
					$('#modelId').val(data.productDTO.modelId);
					$('#brandName').val(data.productDTO.brandName).prop("selected", true);
					$('#productCollection').val(data.productDTO.productCollection);
					$('#relesePrice').val(data.productDTO.releasePrice);
					$("#releseDate").val(data.productDTO.releaseDate);	
					$("#img1").text(data.productDTO.img1 + " ");
					$("#img2").text(data.productDTO.img2 + " ");
					$("#img3").text(data.productDTO.img3 + " ");
			},
			error: function (err) {
				alert(err);				
			}
		});
});
