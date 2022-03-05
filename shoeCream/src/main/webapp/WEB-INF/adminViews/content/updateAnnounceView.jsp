<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
	<link rel="stylesheet" href="/shoeCream/admin/assets/css/content/content.css">
</head>

    <div class="col-md-7">
            <div class="card card-user">
              <div class="card-header"><h5 class="card-title">공지사항 수정</h5> 
            </div>
              
            <div class="card-body">
                <form id="announceWriteForm">
               
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>제목</label>
                        <input type="text" class="form-control" id="title" name="title">
                      </div>
                    </div>
                  </div>
				
				 <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>내용</label>
                        <div class="form-control">
                        	<textarea id="contents" name="contents"></textarea>
                        </div>
                      </div>
                    </div>
                  </div>
                  
                  <br>
                  <div class="row">
                    <div class="col-md-4 pr-1">
                        <label>이미지 첨부(박스를 클릭해주세요)</label>
                        <input type="file" name="image[]" id="imageUpload" multiple>
                       </div>
                   </div>   
                  <br>
                  
                  <div class="row">
                    <div class="update ml-auto mr-auto">
                    	<input type="button" name="updateBtn" id="updateBtn" class="btn btn-primary btn-round" value="수정">
	   		  		    <input type="reset" class="btn btn-primary btn-round" value="다시작성">
                     </div>
                  </div>                 
                </form>
              </div>
     </div>
 </div>
 
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
