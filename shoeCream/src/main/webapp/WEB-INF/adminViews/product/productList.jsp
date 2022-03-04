<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<head>
	<link href="/shoeCream/admin/assets/css/product/productList.css" rel="stylesheet" />
</head> 

 <div class="card card-plain">
 
       <div class="card-header">
       	 <div class="list">
       		<h4 class="card-title">상품목록</h4>
       	</div>
       	<div class="write">
       		<input type="button" id="productWriteBtn" name="productWriteBtn" value="상품등록" onclick="location.href='/shoeCream/adminViews/product/productWrite'"> 
       	</div>     		
       </div>

        <div class="card-body">
            <div class="table-responsive">
            
                  <table class="table">
                    <thead class=" text-primary">
		                 <th><input type="checkbox" id="all" name="all" onclick="checkAll()">번호</th>
		                  <th>이미지</th>
		                  <th>상품명</th>
		                  <th>가격</th>
		                  <th>누적관심수</th>
		                  <th>수정</th>
		                  <th>삭제</th>
                    </thead>
                    <!-- <tbody>
                      <tr>
                       
                      </tr>                     
                    </tbody> -->
                  </table>   
                                 
              <div id="productPagingDiv">sdfsdf</div>
              <br>
		 		
		 	   <input type="hidden" id="searchPg" name="searchPg" value="1"> 
		 	   
		 	    <div id="deleteBtn">              
              		 <input type="button" id="deleteAll" name="deleteAll" value="전체삭제"> 
                </div>
               
               <div class="input-group no-border" id="searchDiv">
				    	<select name="searchOption" id="searchOption">
							<option value="loveCount" >관심수</option>
							<option value="productName" >상품명</option>
							<option value="brand" >브랜드</option>
						</select>
							
						<input type="text" class="form-control" placeholder="검색어 입력" id="inputWord" style="width: 80%">
					    <div class="input-group-append">
					           <div class="input-group-text"><i class="nc-icon nc-zoom-split"></i></div>
              		    </div>
			  </div>	  

      </div>
    </div>
 </div>
 
 
 