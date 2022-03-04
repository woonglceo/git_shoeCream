<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row">
  <div class="col-md-12">
    <div class="card">
    
      <div class="card-header">
        <div>
        <h4 class="card-title" style="float:left;"> 주문 전체조회</h4>
           
        <div class="input-group no-border" style="margin-right:60px;">
		   <select>
		     <option value="orderId">주문번호</option>
		     <option value="product">상품이름</option>
		     <option value="member">회원아이디</option>
		   </select>
           <input type="text" value="" placeholder="Search..." 
           style="width:250px;float:right;">
           <div class="input-group-append">
             <div class="input-group-text">
               <i class="nc-icon nc-zoom-split"></i>
             </div>
           </div>
        </div>
        </div>
      </div>
      
      <div class="card-body">
        <div class="table-responsive">
          <table class="table" id="orderListTable">
            <thead class=" text-primary">
              <th>
                주문번호
              </th>
              <th>
                상품이름
              </th>
              <th>
                회원아이디
              </th>
              <th>  <!-- <th class="text-right"> -->
                배송상태
              </th>
              <th>
                결제일자
              </th>
            </thead>
            
            <tbody>
              <tr>
                <td>
                  orderId
                </td>
                <td>
                  ProductDTO
                </td>
                <td>
                  SalesDTO
                </td>
                <td>
                  PurchaseDTO
                </td>
                <td>
                  if(판매자Id=="null")
                </td>
                <td>
                  DeliveryDTO
                </td>
                <td>
                  PaymentDTO
                </td>
              </tr>
              <tr>
                <td>
                  1
                </td>
                <td>
                  조던 킹왕짱
                </td>
                <td>
                  username
                </td>
                <td>
                  username
                </td>
                <td>
                  입찰
                </td>
                <td>
                  배송전
                </td>
                <td>
                  null
                </td>
              </tr>
              <tr>
                <td>
                  2
                </td>
                <td>
                  아디다스 킹왕짱
                </td>
                <td>
                
                </td>
                <td>
                  username
                </td>
                <td>
                  직접
                </td>
                <td>
                  배송중
                </td>
                <td>
                  2022/02/27
                </td>
              </tr>
            </tbody>
            
          </table>
        </div>
      </div>
      
    </div>
    
  </div>
  
</div>

      <!--  -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		type: 'POST',
		url: '/shoeCream/admin/adminViews/order/getOrderList',
		//data: 'pg=' + $('#pg').val(),	
		//dataType: 'JSON',
		success: function(data){
			console.log('data', data);
			
			//gt(0)는 0보다 큰 애를 뜻한다(Greater Than)
			//즉, th말고 싹 다 지운다
			$('#orderListTable tr:gt(0)').remove(); 
			
			$.each(data, function(index, items){
				$('<tr/>')			
					.append($('<td/>', {    // 주문번호
						text: items.orderId
					})).append($('<td/>', { // 상품이름
						}).append($('<a/>',{
							href: '#',
							text: items.productId,
							class: 'subjectA   subjectA_' + items.seq // seq가 아니라 productId이다
						}))
					).append($('<td/>', {	// 구매자아이디
						text: items.userId
					})).append($('<td/>', {	// 배송상태
						text: items.deliveryId
					})).append($('<td/>', {	// 결제일자
						text: items.orderDate
					})).appendTo($('#orderListTable'));	
			});//end each
			
		},
		error: function(err){
			alert('에러났습니다');
			console.log(err);
		}
	});//end ajax
});//end onload

</script>