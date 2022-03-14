<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<input type="hidden" id="userIdHidden" value="${param.userId}">

      <div class="content">
        <div class="row">
          <div class="col-md-4">
            <div class="card card-user">
              <div class="image">
              </div>
            
              <div class="card-body">
                <div class="author">
                  <a href="#">
                    <h5 class="title"></h5>
                  </a>
                  <p class="description">
                    
                  </p>
                </div>
                <p class="description text-center">
                </p>
              
              
              </div>
              <div class="card-footer">
                <hr>
               
              </div>
            </div>
            <div class="card">
                <h5 class="card-title">거래내역</h4>
              <div class="card-body">
    	
    	
             		<div class="dropdown">
					  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					 	구매내역</button>
					  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					    <a class="dropdown-item" href="/shoeCream/adminViews/stock/inspectionView">판매내역</a>
					   
					  </div>
					</div>
   	
              </div>
            </div>
          </div>
          <div class="col-md-8">
            <div class="card card-user">
              <div class="card-header">
                <h5 class="card-title" >회원정보</h5>
              </div>
              <div class="card-body" id="userTable">
                <form>
                  <div class="row" >
                    <div class="col-md-2 pr-1" >
                      <div class="form-group">
                        <label>회원번호 </label>
                        <input type="text" class="form-control" value="1" id="userId" readonly>
                      </div>
                    </div>
                    <div class="col-md-4 pl-1">
                      <div class="form-group">
                        <label>이메일</label>
                        <input type="text" class="form-control" readonly>
                      </div>
                    </div>
                    <div class="col-md-3 pl-1">
                      <div class="form-group">
                        <label for="exampleInputEmail1">회원 이름</label>
                        <input type="email" class="form-control" readonly>
                      </div>
                    </div>
                    
                    <div class="col-md-3 pl-1">
                      <div class="form-group">
                        <label for="exampleInputEmail1">닉네임</label>
                        <input type="email" class="form-control" readonly>
                      </div>
                    </div>
                    
                    
                    
                  </div>
                  <div class="row">
                    <div class="col-md-4 pr-1" >
                      <div class="form-group" style="margin-top: 30px; " >
                        <label>회원 등급</label>
                        
						  <select name="rating" id="ratings">
						    <option value="normalMem">일반회원</option>
						    <option value="maniger">관리자</option>
						    <option value="blackList">블랙리스트</option>
						    <option value="sleepMem">휴먼회원</option>
						    <option value="outMem">탈퇴회원</option>
						    
						  </select>
						  <input type="button" value="수정">
                        
                      </div>
                    </div>
               
                    
                      <div class="col-md-3 pl-1">
                      <div class="form-group">
                        <label for="exampleInputEmail1">누적신고수</label>
                        <input type="email" class="form-control" readonly>
                      </div>
                    </div>
                                
                      <div class="col-md-3 pl-1">
                      <div class="form-group">
                        <label for="exampleInputEmail1">휴대폰 번호</label>
                        <input type="email" class="form-control" readonly>
                      </div>
                    </div>
                                                                      
                  </div>
                  
                  <div class="row">
                    <div class="col-md-4 pr-1">
                      <div class="form-group">
                        <label>휴대폰 번호</label>
                        <input type="text" class="form-control"  >
                      </div>
                    </div>
          	          <div class="col-md-4 px-1">
                      <div class="form-group">
                        <label>판매내역</label>
                        <input type="text" class="form-control"  >
                      </div>
                      
                    </div>
                    <div class="col-md-4 pl-1">
                      <div class="form-group">
                        <label>인스타</label>
                        <input type="text" class="form-control" >
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>문의</label>
                        <textarea class="form-control textarea" rows=20></textarea>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="update ml-auto mr-auto">
                      <button type="submit" class="btn btn-primary btn-round">회원정보 수정</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
      <footer class="footer footer-black  footer-white ">
        <div class="container-fluid">
          <div class="row">
                    
          </div>
        </div>
      </footer>
    </div>
  </div>

</body></html>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(function(){
	$.ajax({
		type: 'POST',
		url: '/shoeCream/adminViews/user/getUserId',
		data: 'userId=' + $('#userIdHidden').val(),	
		//dataType: 'JSON',
		success: function(data){
			console.log('data', data);
			let input=$('#userTable input');
			input[0].setAttribute('value',data.userId);
			input[1].setAttribute('value',data.email);
			input[2].setAttribute('value',data.username);
			 input[3].setAttribute('value',data.nickname); 
			/* input[4].setAttribute('value',data.auth); */
			input[5].setAttribute('value',data.phonenum);
			input[6].setAttribute('value',data.intromsg);
			input[7].setAttribute('value',data.reportcount);
						
				/* $('<tr/>')			
					.append($('<td/>', {    // 유저아이디
						text: data.userId
					})).append($('<td/>', {
						text: data.email
					})).append($('<td/>', {
						text: data.username
					})).append($('<td/>', {
						text: data.nickname
					})).append($('<td/>', {
						text: data.auth
					})).append($('<td/>', {
						text: data.phonenum
					})).append($('<td/>', {
						text: data.intromsg
					})).append($('<td/>', {
						text: data.reportcount
					})
					).appendTo($('#userTable')); */
						
					// 회원번호 , 아이디, 회원이름, 회원등급, 누적신고수
					// 구매내역, 판매내역, ㄴ인스타, 문의, 사진
						
					// 구매내역, 판매내역, 인스타, 문의, 사진 필요								
			
		},
		error: function(err){
			alert('에러났습니다');
			console.log(err);
		}
	});//end ajax
});//end onload

</script>
















