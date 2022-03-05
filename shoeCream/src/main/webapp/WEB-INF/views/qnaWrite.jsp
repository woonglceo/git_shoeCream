<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
	<div class="content_title">
		<h3 id="title_name">1:1 문의</h3>
	</div>	
	<form name="qnaWriteForm" id="qnaWriteForm" method="post" action="/shoeCream/serviceCenter/qnaRegister">
		<div class="content_list">
			<table id="qna_table">
				<colgroup>
					<col style="width:100px;">
					<col style="width:auto;">
				</colgroup>
				<tr>
					<th>제목</th>
			   		<td class="td_left">
			   			<input type="text" name="title" id="title" class="input_box" size="60" height="5">
			   		</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td class="td_left">
						<input type="text" name="qnaName" id="qnaName" class="input_box">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					 	<textarea id="summernote" name="contents"></textarea>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td class="td_left">
						<input type="text" name="qnaPwd" id="qnaPwd" class="input_box">
					</td>
				</tr>
			</table>
		</div>
		
	</form>	
	<div class="btn_center_div">
		<a href="#" class="btn black_btn" id="register_btn">등록</a>
		<a href="#" class="btn gray_btn" id="cancel_btn">취소</a>
	</div>		

</body>
<script type="text/javascript">
	var $j351 = jQuery.noConflict();
	
	$j351(function(){
		//에디터 load
		$j351('#summernote').summernote({
			placeholder: '문의하실 내용을 입력하세요',
	        tabsize: 2,
	        height: 400,
	        focus: true,
	        toolbar: [
	          ['style', ['style']],
	          ['font', ['bold', 'underline', 'clear']],
	          ['color', ['color']],
	          ['para', ['ul', 'ol', 'paragraph']],
	          ['table', ['table']],
	          ['insert', ['link', 'picture']]
	        ]/*,
	        callbacks: {	//이미지를 첨부하는 부분
				onImageUpload : function(files) {
					uploadSummernoteImageFile(files[0],this);
				},
				onPaste: function (e) {
					var clipboardData = e.originalEvent.clipboardData;
					if (clipboardData && clipboardData.items && clipboardData.items.length) {
						var item = clipboardData.items[0];
						if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
							e.preventDefault();
						}
					}
				}
			}*/
		});
		
		/*
		//이미지파일 업로드 콜백함수
		function uploadSummernoteImageFile(file, editor) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				type : "POST",
				url : "/uploadSummernoteImageFile",
				data : data,
				contentType : false,
				processData : false,
				success : function(data) {
	            	//항상 업로드된 파일의 url이 있어야 한다.
					$(editor).summernote('insertImage', data.url);
				}
			});
		}
		*/
		
		//유효성검사 후 강조표시 해제
		$('.input_box').focusout(function(){
			if($(this).val() != '') {
				$(this).removeClass("input_empty");
			}
		});
		
		//등록버튼 유효성 검사
		$j351('#register_btn').click(function(){
			if ($j351('#title').val() == ''){
				alert('제목을 입력하세요.');
				$j351('#title').addClass("input_empty");
			} else if ($j351('#qnaName').val() == ''){
					alert('이름을 입력하세요.');
					$j351('#qnaName').addClass("input_empty");
			} else if ($j351('#summernote').val() == ''){
				alert('내용을 입력하세요.');
			} else if ($j351('#qnaPwd').val() == ''){
				alert('비밀번호를 입력하세요.');
				$j351('#qnaPwd').addClass("input_empty");
			} else {
				//등록
				$j351.ajax({
					type: 'post',
			        url: '/shoeCream/serviceCenter/qnaRegister',
			        data: $('#qnaWriteForm').serialize(), // title, qnaName, contents, qnaPwd
			        success: function(data){
			        	location.href='/shoeCream/serviceCenter/qna';
			        },
			        error: function(err){
			        	console.log(err);
			        }
				});//ajax	
			}
		});
		
		//취소 버튼
		$j351('#cancel_btn').click(function(){
			location.href = '/shoeCream/serviceCenter/qna'; //get으로 seq 보내줘야함
		});
		
	})
</script>

</html>