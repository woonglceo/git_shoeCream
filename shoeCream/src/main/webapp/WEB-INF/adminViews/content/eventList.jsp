<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
  <link href="/shoeCream/admin/assets/css/content/content.css" rel="stylesheet" />
</head>

<div class="card">
       <div class="card-header"> 
       	<div class=list>       				
			  <a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="text-decoration-line: none;">
                 <h4 class="card-title" style="color: black">이벤트<span class="caret"></span></h4>
              </a>
              <div class="dropdown-menu dropdown-menu-left" aria-labelledby="navbarDropdownMenuLink">
                <a class="dropdown-item" href="/shoeCream/adminViews/content/announceList">공지사항</a>
                <a class="dropdown-item" href="/shoeCream/adminViews/content/styleList">게시글목록</a>
              </div>  
             </div>
             
             <div class="write">              
             	<input type="button" id="eventWriteBtn" name="eventWriteBtn" value="글 작성" onclick="location.href='/shoeCream/adminViews/content/eventWrite'">   
       		 </div> 
       		 
        </div>
        <div class="card-body">
            <div class="table-responsive">
            
                  <table class="table">
                    <thead class=" text-primary">
		                  <th><input type="checkbox" id="all" name="all" onclick="checkAll()">글 번호</th>
		                  <th>이미지</th><!-- 대표이미지 하나 -->
		                  <th>제목</th>
		  				  <th>상태</th>
		                  <th>수정</th>
		                  <th>삭제</th>
                    </thead>
                    <!-- <tbody>
                      <tr>
                       
                      </tr>                     
                    </tbody> -->
                  </table>
                  
                  <div id="eventPagingDiv"></div>
                  
                  <div class="input-group no-border" id="searchDiv">
<!-- 				    	<select name="searchOption" id="searchOption">
							<option value="loveCount" >관심수</option>
							<option value="productName" >상품명</option>
							<option value="brand" >브랜드</option>
						</select>
							 -->
						<input type="text" class="form-control" placeholder="검색어 입력" id="inputWord" style="width: 80%">
					    <div class="input-group-append">
					           <div class="input-group-text"><i class="nc-icon nc-zoom-split"></i></div>
              		    </div>
			  </div>
      </div>
    </div>
 </div>

