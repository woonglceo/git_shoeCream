<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
  <link href="/shoeCream/admin/assets/css/content/content.css" rel="stylesheet" />
</head>
    
<div class="card">
       <div class="card-header">    				
			  <a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="text-decoration-line: none;">
                 <h4 class="card-title" style="color: black">게시글목록<span class="caret"></span></h4>
              </a>
              <div class="dropdown-menu dropdown-menu-left" aria-labelledby="navbarDropdownMenuLink">
                <a class="dropdown-item" href="/shoeCream/adminViews/content/announceList">공지사항</a>
                <a class="dropdown-item" href="/shoeCream/adminViews/content/eventList">이벤트</a>
              </div>  
        </div>
        <div class="card-body">
            <div class="table-responsive">
            
                  <table class="table">
                    <thead class=" text-primary">
		                  <th><input type="checkbox" id="all" name="all" onclick="checkAll()">글 번호</th>
		                  <th>이미지</th><!-- 대표이미지 하나 -->
		                  <th>제목</th>
		  				  <th>신고수</th>
		                  <th>수정</th>
		                  <th>삭제</th>
                    </thead>
                    <!-- <tbody>
                      <tr>
                       
                      </tr>                     
                    </tbody> -->
                  </table>
                  
                  <div id="stylePagingDiv"></div>
	
				<div id="deleteBtn">
					<input type="button" id="deleteAll" name="deleteAll" value="전체삭제">
				</div>
	
				<div class="input-group no-border" id="searchDiv">
					    	<select name="searchOption" id="searchOption">
								<option value="" >신고수</option>
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

    