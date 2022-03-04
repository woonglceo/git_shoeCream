<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
	<link rel="stylesheet" href="/shoeCream/admin/assets/css/content/content.css">
</head>

<div class="col-md-7">
            <div class="card card-user">
              <div class="card-header"><h5 class="card-title">이벤트 등록</h5> 
            </div>
              
            <div class="card-body">
                <form id="eventWrite">
               
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>제목</label>
                        <input type="text" class="form-control" placeholder="제목을 입력하세요" id="title">
                      </div>
                    </div>
                  </div>
				
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>내용</label>
                        <div class="form-control">
                        	<textarea placeholder="내용을 입력하세요" id="content"></textarea>
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
                     <button type="submit" class="btn btn-primary btn-round" id="writeBtn">등록</button>
                      <button type="reset" class="btn btn-primary btn-round">다시작성</button>
                      </div>
                    </div>
                  
                </form>
              </div>
     </div>
 </div>
