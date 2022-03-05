<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<head>
  <link href="/shoeCream/admin/assets/css/question/question.css" rel="stylesheet" />
</head>
  
 <div class="card">     
       <div class="card-header">  
       		<div class="list">       		
               <h4 class="card-title" style="color: black">문의사항</h4>
             </div>
             <div class="write">              
             	<input type="button" id="questionWriteBtn" name="questionWriteBtn" value="답글 작성" onclick="location.href='/shoeCream/adminViews/question/questionWrite'"> 
             	<input type="button" value="개별보기 폼" onclick="location.href='/shoeCream/adminViews/question/questionView'">     
       		 </div>
         	</div>

         
        <div class="card-body">
            <div class="table-responsive">
            
                  <table class="table">
                    <thead class=" text-primary">
		                 <th><input type="checkbox" id="all" name="all" onclick="checkAll()">글 번호</th>
		                  <th>제목</th> <!-- 링크타고 상세보기 -->
		                  <th>작성자</th>
		                  <th>등록일</th>
		                  <th>상태</th>
		                  <th>답글작성</th>
                    </thead>
                    <!-- <tbody>
                      <tr>
                       
                      </tr>                     
                    </tbody> -->
                  </table>           
                         
              <div id="questionPagingDiv"></div>
              
              <div id="deleteBtn">              
              		 <input type="button" id="deleteAll" name="deleteAll" value="전체삭제"> 
              </div>
              
              <div class="input-group no-border" id="searchDiv">
				    	<select name="searchOption" id="searchOption">
							<option value="states" >상태</option>
							<option value="title" >제목</option>
							<option value="writer" >작성자</option>
						</select>
							
						<input type="text" class="form-control" placeholder="검색어 입력" id="inputWord" style="width: 80%">
					    <div class="input-group-append">
					           <div class="input-group-text"><i class="nc-icon nc-zoom-split"></i></div>
              		    </div>
			  </div>	

      </div>
    </div>
 </div>
 
 
 