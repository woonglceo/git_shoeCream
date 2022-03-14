<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
	<link rel="stylesheet" href="/shoeCream/admin/assets/css/content/content.css">
</head>

    <div class="col-md-7">
            <div class="card card-user">
              <div class="card-header"><h5 class="card-title">문의사항</h5> 
            </div>
              
            <div class="card-body">
                <form id="announceWrite">
               
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>제목</label>
                        <input type="text" class="form-control" id="title" readonly>
                      </div>
                    </div>
                  </div>
				
				 <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>내용</label>
                        <div class="form-control">
                        	<textarea readonly id="content"></textarea>
                        </div>
                      </div>
                    </div>
                  </div>
                  
                  <br>
                  <div class="row">
                    <div class="col-md-4 pr-1">
                        <label>이미지 첨부</label>
                        <input type="file" name="image[]" id="imageUpload" multiple readonly>
                       </div>
                   </div>   
                  <br>
                  
                  <div class="row">
                    <div class="update ml-auto mr-auto">
                      </div>
                    </div>
                  
                </form>
              </div>
     </div>
 </div>
    