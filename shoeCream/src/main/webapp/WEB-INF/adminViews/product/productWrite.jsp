<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/shoeCream/admin/assets/css/product/productWrite.css">
</head>

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
                        <label>상품명</label>
                        <input type="text" class="form-control" placeholder="상품명" id="">
                      </div>
                    </div>
                    <div class="col-md-6 pl-1">
                      <div class="form-group">
                        <label>모델번호</label>
                        <input type="text" class="form-control" placeholder="ex. SX7167_010" id="">
                      </div>
                    </div>
                  </div>
                 
                 
                  <div class="row">
                    <div class="col-md-4 pr-1">
                      <div class="form-group">
                        <label>브랜드</label>          
	                        <select name="brand" class="form-control" id="">
									<option value="Adidas" >Adidas</option>
									<option value="Balenciaga" >Balenciaga</option>
									<option value="Dior" >Dior</option>
									<option value="Supreme" >Supreme</option>
									<option value="Margiela" >Margiela</option>
									<option value="New Balance" >New Balance</option>
									<option value="Nike" >Nike</option>
									<option value="Off-White" >Off-White</option>
									<option value="Reebok" >Reebok</option>
									<option value="Vans" >Vans</option>
									<option value="yasuhiro" >yasuhiro</option>
							</select>
                      </div>
                    </div>                   
                    <div class="col-md-8 pl-1">
                      <div class="form-group">
                        <label>collection</label>
                        <input type="text" class="form-control" placeholder="ex. 나이키 에어포스" id="">
                      </div>
                    </div>
                  </div>
                  
                  <div class="row">
                    <div class="col-md-4 pr-1">
                      <div class="form-group">
                        <label>발매가</label>
                        <input type="text" class="form-control" placeholder="발매가" id="">
                      </div>
                    </div>     
                    <div class="col-md-4 px-1">
                      <div class="form-group">
                        <label>출시일</label>                                          
	                      <input type="text" class="form-control" id="datepicker">
                      </div>
                    </div>                
                    <div class="col-md-4 pl-1">
                      <div class="form-group">
                         <label>사이즈</label>
                        	<select name="size" class="form-control" id="">
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
                  
                  <div class="row">
                    <div class="col-md-4 pr-1">
                        <label>이미지 첨부(박스를 클릭해주세요)</label>
                        <input type="file" name="image[]" id="imageUpload" multiple>
                       </div>
                   </div>                   
                   
				 <br><br>
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
 
<!-- 달력 위젯 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- js -->
<script src="/shoeCream/admin/assets/js/product/productWrite.js"></script>