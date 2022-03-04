// 달력위젯

$("#datepicker").datepicker({	 	 
     showOn:"button", 
     buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
     buttonImageOnly: true,
     changeMonth:true,
     dateFormat:"yy-dd-mm",
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