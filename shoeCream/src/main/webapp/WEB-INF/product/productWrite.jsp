<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
	<link href="/shoeCream/admin/assets/css/product/productWrite.css" rel="stylesheet" />
</head>

<input type="hidden" id="pg" name="pg" value="${pg}">

<div class="col-md-7">
			<!-- 상품등록 위쪽 -->
            <div class="card card-user">
              <div class="card-header"><h5 class="card-title">상품등록</h5> 
            </div>
              
            <!-- 상품등록 -->
            <div class="card-body">
                <form id="productWrite">
               
                  <div class="row">
                    <div class="col-md-6 pr-1">
                      <div class="form-group">
                        <label>상품명</label> <span id="productNameDiv"></span> 
                        <input type="text" class="form-control" placeholder="상품명" id="productName" name="productName">                       
                      </div>
                    </div>
                    <div class="col-md-6 pl-1">
                      <div class="form-group">
                        <label>모델번호</label> <span id="modelIdDiv"></span>
                        <input type="text" class="form-control" placeholder="ex. SX7167_010" id="modelId" name="modelId">                       
                      </div>
                    </div>
                  </div>
                 
                 
                  <div class="row">
                    <div class="col-md-4 pr-1">
                      <div class="form-group">
                        <label>브랜드</label> <span id="brandDiv"></span>       
	                        <select name="brandName" class="form-control" id="brandName">
	                        		<option value="브랜드 선택" selected>브랜드 선택</option>
									<option value="adidas" >Adidas</option>
									<option value="balenciaga" >Balenciaga</option>
									<option value="autry" >Autry</option>
									<option value="supreme" >Supreme</option>
									<option value="margiela" >Margiela</option>
									<option value="new balance" >New Balance</option>
									<option value="Nike" >Nike</option>
									<option value="off-white" >Off-White</option>
									<option value="reebok" >Reebok</option>
									<option value="vans" >Vans</option>
									<option value="yasuhiro" >yasuhiro</option>
							</select>
                      </div>
                    </div>                   
                    <div class="col-md-8 pl-1">
                      <div class="form-group">
                        <label>collection</label>
                        <input type="text" class="form-control" placeholder="ex. 나이키 에어포스" id="productCollection" name="productCollection">
                      </div>
                    </div>
                  </div>
                  
                  <div class="row">
                    <div class="col-md-4 pr-1">
                      <div class="form-group">
                        <label>발매가</label> <span id="relesePriceDiv"></span>
                        <input type="text" class="form-control" placeholder="발매가" id="releasePrice" name="releasePrice">
                      </div>
                    </div>     
                    <div class="col-md-4 px-1">
                      <div class="form-group">
                        <label>출시일</label> <span id="datepickerDiv" style="margin-left: 20px"></span>                                         
	                      <input type="text" class="form-control" id="releaseDate" name="releaseDate">
                      </div>
                    </div>                
                    <div class="col-md-4 pl-1">
                      <div class="form-group">
                         <label>사이즈</label> <span id="sizeDiv"></span>
                        	<select name="productSize" class="form-control" id="productSize">
                        		<option value="사이즈 선택" selected>사이즈 선택</option>
                        		<option value="225" >225</option>
								<option value="230" >230</option>
								<option value="235" >235</option>
								<option value="240" >240</option>
								<option value="245" >245</option>
								<option value="250" >250</option>
								<option value="256" >255</option>
								<option value="260" >260</option>
								<option value="265" >265</option>
								<option value="270" >270</option>
								<option value="275" >275</option>
								<option value="280" >280</option>
								<option value="285" >285</option>
								<option value="290" >290</option>
							</select>
                      </div>
                    </div>
                  </div>
                   
                  <label>파일 업로드</label>
                  <div class="row">
	                   <div class="filebox clearfix">
					    <div class="inputFile"></div> 
					        <label for="AddImgs" class="addImgBtn">+</label>
					        <input type="file" name="img[]" id="AddImgs" class="upload-hidden" accept=".jpg, .png, .gif" multiple style="display:none;">					        
					    </div>
					    <ul id="Preview"></ul>					  
				   </div> 
                   
				 <br><br>
                  <div class="row">               
                    <div class="update ml-auto mr-auto">
                      <input type="button" class="btn btn-primary btn-round" id="listBtn" value="목록" onclick="location.href='/shoeCream/adminViews/product/productList?pg=${pg}'">
                      <input type="reset" class="btn btn-primary btn-round" id="resetBtn" value="다시작성">
                      <input type="button" class="btn btn-primary btn-round" id="writeBtn" value="등록">
                    </div>                   
                  </div>
                  
                </form>
              </div>
     </div>
</div>
 
<!-- 달력 위젯 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- js -->
<script src="/shoeCream/admin/assets/js/product/productWrite.js"></script>
