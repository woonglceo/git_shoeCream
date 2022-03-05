<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<body>
	<div class="content_title">
		<h3 id="title_name">1:1 문의</h3>
	</div>
	<div class="content_detail">
		<div class="content_detail_head">
			<span class="content_detail_title">${content.title }</span>
			<span class="qnaName">작성자  ${content.qnaName }</span>
			<span class="regDate"><fmt:formatDate value="${content.regDate}" pattern="yyyy.MM.dd"/></span>
		</div>
		<div class="content_detail_body">
			<pre style="white-space: pre-line; word-break: break-all;">
		   		<span id="contentSpan">${content.contents }</span>
		   	</pre>
		</div>
		<div class="content_reply_link">
			<span class="content_reply_title"></span>
			<span class="regDate reply_regDate"></span>
		</div>
		<div class="btn_center_div">
			<a href="#" class="btn gray_btn" id="gray_btn">목록보기</a>
		</div>
	</div>
	
	<input type="hidden" id="qnaId" value="${content.qnaId }">
	<input type="hidden" id="step" value="${content.step }">
	<input type="hidden" id="pg" value="${pg}">
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
 	<script type="text/javascript">
 	
 	//post 방식 페이지 이동
	function goQnaDetail(pg, qnaId) { 
		let f =  document.createElement('form');
		
		let obj;
	    obj = document.createElement('input');
	    obj.setAttribute('type', 'hidden');
	    obj.setAttribute('name', 'qnaId');
	    obj.setAttribute('value', qnaId);
		f.appendChild(obj);
		
		f.setAttribute('method', 'post');
		f.setAttribute('action', '/shoeCream/serviceCenter/qnaDetail?pg='+pg);
		document.body.appendChild(f);
		f.submit();
	}	
 	
	$(function(){
		
		//답글 여부 확인 후 답글 칸 추가
		$.ajax({
			type: 'post',
	        url: '/shoeCream/serviceCenter/getQnaReply',
	        data: { 'qnaId': $('#qnaId').val() },
	        //dataType: 'json',
	        success: function(data){
	        	console.log(JSON.stringify(data));
	        	if( data == '' & $('#step').val() == 0){
	        		$('.content_reply_title').append(' 아직 등록된 답변이 없습니다.');
	        		
	        	} else if( data != '' & $('#step').val() == 0 ){
	        		var qnaName = "<c:out value='${content.qnaName}' />";
	        		$('.content_reply_title').prepend('<i class="fa-solid fa-angles-right"></i>');
	        		$('.content_reply_title').append('<a href="#" class="link">'+qnaName+' 고객님 답변드립니다.</a>'); //제목
	        		$('.reply_regDate').append(data.regDate);
	        	}
	        	
	        	$('.link').click(function(){
	        		goQnaDetail($('#pg').val(), data.qnaId);
	        	});
	        },
	        error: function(err){
	        	console.log(err);
	        }
		})
		
		//버튼 클릭
		$('#gray_btn').click(function(){  
			location.href = '/shoeCream/serviceCenter/qna?pg='+$('#pg').val();
		});
	});
 	</script>
	
</body>
</html>