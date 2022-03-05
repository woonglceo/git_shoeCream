<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<input type="hidden" id="dealIdText" value="${dealId}">
<div class="row">
  <div class="col-md-12">
    <div class="card">
    
      <div class="card-header">
		<h2 class="card-title" style="color: black;text-align:center;">거래 조회</h2>
        <button class="btn btn-secondary" type="button" id="dropdownMenuButton"
	        onclick="location.href='/shoeCream/adminViews/order/dealList'">목록</button>
      </div>
      
      <div class="card-body">
        <div class="table-responsive">
          <table class="table" id="dealListTable">
            <thead class=" text-primary">
				<tr>
					<th>거래번호</th>
					<th>구매자아이디</th>
					<th>구매자경고횟수</th>
					<th>검수상태</th>
					<th>구매자번호</th><!-- <th class="text-right"> -->
				</tr>
			</thead>
            <tbody>
            	<tr>
	            	<td>1</td>
	            	<td>2</td>
	            	<td>3</td>
	            	<td>4</td>
	            	<td>5</td>
            	</tr>
            </tbody>
            <thead class=" text-primary">
				<tr>
					<th>상품이름</th>
					<th>판매자아이디</th>
					<th>판매자경고횟수</th>
					<th>판매가격</th>
					<th>판매자번호</th>
				</tr>
			</thead>
            <tbody>
            	<tr>
	            	<td>1</td>
	            	<td>2</td>
	            	<td>3</td>
	            	<td>4</td>
	            	<td>5</td>
            	</tr>
            </tbody>
            <thead class=" text-primary">
				<tr>
					<th>거래번호</th>
					<th>구매자아이디</th>
					<th>구매자경고횟수</th>
					<th>검수상태</th>
					<th>구매자번호</th><!-- <th class="text-right"> -->
				</tr>
			</thead>
            <tbody>
            	<tr>
	            	<td>1</td>
	            	<td>2</td>
	            	<td>3</td>
	            	<td>4</td>
	            	<td>5</td>
            	</tr>
            </tbody>
          </table>
        </div>
        <div id="dealPagingDiv" class="pagingDiv"></div>
      </div>
      
    </div>
    
  </div>
  
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/shoeCream/admin/assets/js/order/dealView.js"></script>
