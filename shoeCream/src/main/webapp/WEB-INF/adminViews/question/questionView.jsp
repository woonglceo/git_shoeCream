<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
  <link href="/shoeCream/admin/assets/css/question/question.css" rel="stylesheet" />
</head>

    <div class="col-md-7">
    
            <div class="card card-user">
              <div class="card-header"><h5 class="card-title">1:1 문의사항</h5> 
            </div>
              
            <div class="card-body">
            
                <form id="questionView">
               
                  <div class="row">
                   <div class="col-md-12">
                      <div class="form-group">
                        <label>제목</label>
                        <input class="form-control" id="title" readonly="readonly">
                      </div>
                    </div>
                  </div>
                                 
                  <div class="row">
                    <div class="col-md-6 pr-1">
                      <div class="form-group">
                        <label>작성자</label>          
	                       <input class="form-control" id="writer" readonly>
                      </div>
                    </div>                   
                    <div class="col-md-6 pl-1">
                      <div class="form-group">
                        <label>작성일</label>
                        <input class="form-control" id="writerDate" readonly>
                      </div>
                    </div>
                  </div>
                  
                  <div class="row">
                    <div class="col-md-6 pr-1">
                      <div class="form-group">
                        <label>작성자 이메일</label>          
	                    <input class="form-control" id="email" readonly>
                      </div>
                    </div>                   
                    <div class="col-md-6 pl-1">
                      <div class="form-group">
                        <label>글 비밀번호</label>
                        <input class="form-control" id="pwd" readonly>
                      </div>
                    </div>
                  </div>
                  
                   <!-- 첨부된 이미지 뽑아내기 -->   
                   
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>내용</label>
                        <div class="form-control">
                        	<textarea placeholder="내용을 입력하세요" id="content" readonly></textarea>
                        </div>
                      </div>
                    </div>
                  </div>
                                 
                   
				 <br><br>
                  <div class="row">               
                    <div class="update ml-auto mr-auto">
                      <button type="submit" class="btn btn-primary btn-round" id="writeBtn">목록</button>
                      <button type="reset" class="btn btn-primary btn-round">답글작성</button>
                    </div>                   
                  </div>
                  
                </form>
              </div>
     </div>
 </div>