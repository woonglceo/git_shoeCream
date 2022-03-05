<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<input type="hidden" id="pg" value="${pg}">
<div class="row">
  <div class="col-md-12">
    <div class="card">
    
      <div class="card-header">
        <div>
        
        <div class="list">     
			  <a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="text-decoration-line: none;">
                   <h4 class="card-title" style="color: black">거래 조회<span class="caret"></span></h4>
              </a>
            
              <div class="dropdown-menu dropdown-menu-left" aria-labelledby="navbarDropdownMenuLink">
                <a class="dropdown-item" href="/shoeCream/adminViews/order/orderList">주문 조회</a>
              </div>
             </div>
        
        
	     <div class="input-group no-border" style="margin-right:60px;">
		   <select id="dealSearchSelect">
		     <option value="dealId">거래번호</option>
		     <option value="productName">상품이름</option>
		     <option value="userId">회원아이디</option>
		   </select>
	          <input type="text" id="dealSearchText" value="" placeholder="Search..." 
	           style="width:250px;float:right;">
	          <div class="input-group-append">
	          
	            <div class="input-group-text">
	              <a id="searchBtn" class="btn-rotate" style="cursor:pointer">
	                <i class="nc-icon nc-zoom-split"></i>
	              </a>
	            </div>
	            
	          </div>
	       </div>
	       <div id="dealSearchDiv"></div>
        </div>
      </div>
      
      <div class="card-body">
        <div class="table-responsive">
          <table class="table" id="dealListTable">
            <thead class=" text-primary">
              <th>
                거래번호
              </th>
              <th>
                상품이름
              </th>
              <th>
                구매자아이디
              </th>
              <th>
                판매자아이디
              </th>
              <th>
                검수상태
              </th>
              <th>  <!-- <th class="text-right"> -->
                배송상태
              </th>
              <th>
                입찰마감기한
              </th>
              <th>
                판매마감기한
              </th>
            </thead>
            
          </table>
        </div>
        <div id="dealPagingDiv" class="pagingDiv"></div>
      </div>
      
    </div>
    
  </div>
  
</div>

      <!--  -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/shoeCream/admin/assets/js/order/dealList.js"></script>