$(function(){
	let IMG_SRC = '/shoeCream/resources/images/productImg/';
	
	//location.search 는 url에 '?' 뒤로 다 짤라온다.
	var pId = new URLSearchParams(location.search).get('productId');
	
	$.ajax({
		type: 'POST',
		url: '/shoeCream/shop/getShop',
		data: {productId: pId},	
		//dataType: 'JSON',
		success: function(data){
			console.log(data);
			
			$('.fluctuation-decrease-increse').empty();
			
			$('.product-brand').text(data.brandname);
			$('#productImg').attr('src', IMG_SRC + data.img1);
			$('.shopDetail-top_Realimg').attr('src', IMG_SRC + data.img1);
			$('.procut-title').text(data.productName);
			$('.product-subtitle').text(data.productNameKor);
			$('.produxt-price-detail').text(data.todaysPrice.toLocaleString());
			$('.like-count').text(data.wishListCount);
			$('.model-number').text(data.modelId);
			$('.model-release-date').text(data.releaseDate);
			$('.model-color').text('컬러 안할꺼임');
			$('.model-release-price').text(data.releasePrice.toLocaleString()+'원');
			//$('.').text(data.);
		},
		error: function(err){
			alert('샵뷰 페이지 에러났습니다');
			console.log(err);
		}
	});//end ajax
	
});//end onload


					/* 서림씨코드 */
const box = document.getElementById("shop-detail-top");
const buttonBox = document.querySelector(".shopDetail-content-button2");
const buttonNum = -20;
window.addEventListener("scroll", scrollEvent);

function scrollEvent() {
  const text = buttonBox.getBoundingClientRect().top;

  if (text < buttonNum) box.classList.remove("tophidden");
  else box.classList.add("tophidden");
}

// 더보기더보기더보기

const showBox = document.querySelectorAll(".drop-down-head");
// for (let i = 0; i < showBox.length; i++) {
//   showBox[i].addEventListener("click", (e) => console.log(e.target));
// }

showBox.forEach((item) => {
  item.addEventListener("click", (e) => {
    const sibling = e.currentTarget.nextElementSibling;
    sibling.classList.toggle("drop-down-content");
  });
});



// 모달 오픈(판매)
$('.shopDetail-cell-link').click(function(){
	$('.modal').css('display', 'flex');
	$('body').css('overflow', 'hidden'); //모달창 켜졌을때 스크롤 금지
	
	$('.modal-title-text').text('판매하기');
});//end click

// 모달 오픈(구매)
$('.shopDetail-buy-link').click(function(){
	$('.modal').css('display', 'flex');
	$('body').css('overflow', 'hidden'); //모달창 켜졌을때 스크롤 금지
	
	$('.modal-title-text').text('구매하기');
});//end click


// 모달 클로즈 (x버튼 클릭)
$('.close-area').click(function(){
	$('.modal').css('display', 'none');
	$('body').css('overflow', 'auto');
});

/*	
// 모달 클로즈 (어두운 배경 클릭) 
$('.modal').click(function(){
	$('.modal').css('display', 'none');
	$('body').css('overflow', 'auto'); //모달 꺼지면 스크롤 가능
});
*/
