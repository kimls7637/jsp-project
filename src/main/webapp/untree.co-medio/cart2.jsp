<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- 이슬왜그냥콘솔찍으면어레이속어레이나오냐 로컬스토리지로찍으면어레이배열 어쨌든넘어가 -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<meta name="author" content="Untree.co" />
<link rel="icon" href="images/favicon.ico" />

<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap5" />

<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Roboto:wght@300;400&display=swap"
	rel="stylesheet" />

<link rel="stylesheet" href="fonts/icomoon/style.css" />
<link rel="stylesheet" href="fonts/feather/style.css" />

<link rel="stylesheet" href="css/tiny-slider.css" />
<link rel="stylesheet" href="css/aos.css" />
<link rel="stylesheet" href="css/glightbox.min.css" />
<link rel="stylesheet" href="css/style.css" />

<title>ACENSE</title>

<style>
table {
	font-size: 20px;
}

.pC {
	height: 40px;
	width: 100px;
	font-size: 20px;
	border: 1px solid #6f6f6f;
}

.info {
	padding: 0 20px 40px 20px;
	display: flex;
	justify-content: space-between;
}

.info div p {
	margin-bottom: 0.5rem;
}

.table_basic tbody tr {
	border-top: 1px solid #5b5b5b;
}

.table_basic tbody tr {
	border-bottom: 1px solid #5b5b5b;
}

.table_basic td {
	padding: 0 !important;
}

table {
	border-collapse: collapse;
}

a {
	cursor: pointer;
}

.connect_img {
	margin-top: 15px;
}

.right_contents {
	clear: both;
	position: relative;
	padding: 20px;
	border-bottom: 0px solid #dedede;
}

@media ( min-width : 1400px) {
	.right_contents {
		overflow-x: auto;
		-webkit-overflow-scrolling: touch;
	}
}

.page-sorting.order {
	position: absolute;
	top: 20px;
	right: 20px;
}

.page-sorting.order span {
	font-size: 14px;
	color: #b3b3b3;
	font-weight: 400;
	line-height: 1.5;
}

.page-sorting.order span>i {
	padding: 0 4px 0 2px;
	margin-top: -1px;
}

.page-sorting.order span.current-page {
	color: #000;
}

#page_cart .cart_table th {
	width: auto;
	font-weight: normal;
}

.ic-14-line-arrow-right:before {
	content: ">";
}

.table_basic {
	clear: both;
	min-width: 920px;
	width: 100%;
	font-family: "Apple SD Gothic Neo", "Noto Sans KR", sans-serif;
	text-align: center;
	background: #fff;
}

@media ( min-width : 480px) {
	.img {
		overflow-x: auto;
		-webkit-overflow-scrolling: touch;
	}
}

@media ( min-width : 480px) {
	.table_basic {
		overflow-x: auto;
		-webkit-overflow-scrolling: touch;
	}
}

@media ( min-width : 1400px) {
	.th {
		overflow-x: auto;
		-webkit-overflow-scrolling: touch;
	}
}

.table_basic tr {
	border: 0px solid #dedede;
}

.table_basic th {
	vertical-align: middle;
	padding: 10px 0;
}

.table_basic td {
	line-height: 16.8px;
	padding: 2px 0;
}

.table_basic td.empty_cart {
	vertical-align: middle;
}

.table_basic .txt_subject {
	text-align: left;
}

.table_basic .border_right_none {
	border-right: none;
}

body {
	background: #fff;
	font-size: 16px;
	color: #000;
}

.n-cart-table .n-input-amount>input {
	font-size: inherit;
	font-weight: 100;
	line-height: 20px;
	text-indent: 0;
}

.btn {
	display: inline-block;
	*zoom: 1;
	cursor: pointer;
	-moz-user-select: none;
	-khtml-user-select: none;
	-webkit-user-select: none;
	-o-user-select: none;
	user-select: none;
	zoom: 1;
	*display: inline;
}

.delete-btn-area {
	margin: 10px 10px 10px;
	text-align: right;
}

.delete-btn-area a {
	display: inline-block;
	width: 100px;
	height: 33px;
	margin-left: 6px;
	line-height: 33px;
	border: 1px solid #d8d8d8;
	box-sizing: border-box;
	text-align: center;
}

.delete-btn-area a:first-child {
	margin-left: 0;
}

.delete-btn-area a.click_disalbe {
	pointer-events: none;
	cursor: default;
	border-color: #f0f0f0;
	color: #d9d9d9;
}

#page_cart .n-info-txt {
	padding-top: 12px;
	font-size: 12px;
}

.n-btn {
	display: center;
	min-width: 100px;
	height: 40px;
	line-height: 36px;
	color: #ffffff;
	box-sizing: border-box;
	padding: 2px 8px 0 8px;
	font-size: 14px;
	text-align: center;
	cursor: pointer;
	vertical-align: middle;
	-webkit-transition: border 0.2s, background 0.2s ease-in-out;
	-moz-transition: border 0.2s, background 0.2s ease-in-out;
	-o-transition: border 0.2s, background 0.2s ease-in-out;
	transition: border 0.2s, background 0.2s ease-in-out;
}

.n-btn:visited {
	color: #ffffff;
}

.n-btn.disabled {
	cursor: not-allowed;
}

.n-btn.btn-sm {
	min-width: 70px;
	height: 32px;
	line-height: 30px;
	padding-top: 0;
	font-family: "Apple SD Gothic Neo", "Noto Sans KR",
		sans-serif !important;
}

.n-btn.btn-lg {
	min-width: 290px;
	height: 60px;
	line-height: 54px;
	padding-top: 4px;
	font-size: 20px;
	background-color: black;
}

/* 20200811 UI-HS 장바구니 상품 합계 */
.final-payment {
	padding: 43px 0 23px;
	text-align: center;
}

.final-payment li {
	display: inline-block;
	margin: 0 14px;
	line-height: 30px;
}

.final-payment p {
	display: inline-block;
}

.final-payment-ti {
	margin-right: 12px;
	font-size: 12px;
	color: #777;
}

.final-payment-price {
	font-family: "Musinsa", sans-serif !important;
	font-size: 18px;
}

.final-payment-ic {
	box-sizing: border-box;
	width: 30px;
	height: 30px;
	border: 1px solid #eee;
	border-radius: 15px;
	text-align: center;
}

.final-payment-ic i {
	width: 30px !important;
	height: 30px !important;
	line-height: 28px;
	margin-left: -1px;
}

.final-payment-save {
	margin-left: 5px;
	font-size: 12px;
	color: #ff0000;
}

.final-payment-estimate {
	font-family: "Musinsa", sans-serif !important;
	font-size: 14px;
	font-weight: 500;
}

.esul {
	padding: 70px 200px;
}

.esulDelete {
	margin: 0 7px;
	background-color: white;
	border: 1.5px solid #dbdbdb;
	font-size: 15px;
	font-weight: bold;
	height: 32px;
	line-height: center;
	width: 100px;
	text-align: center;
	line-height: normal;
}
</style>
</head>

<body>
	<%@ include file="./header.jsp"%>

	<div class="hero lightV-h-full overlay">
		<div class="img-bg rellax"
			style="transform: translate3d(0px, 13px, 0px)">
			<img src="images/main.png" alt="Image" class="lightImg-fluid" />
		</div>
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-7 col-xxl-6 mx-auto text-center"
					data-aos="fade-up">
					<h1 class="lightHeading-3 text-white mb-3 aos-init aos-animate"
						data-aos="fade-up">Shopping Cart</h1>
					<p data-aos="fade-up" data-aos-delay="200"
						class="text-white lead mb-4 aos-init aos-animate">장바구니</p>
				</div>
			</div>
		</div>
	</div>

	<c:if test="${cart.size()==0}">
		<h1 class="lightHeading-3 text-white mb-3 aos-init aos-animate"
			style="color: black !important; font-size: 40px; padding: 100px"
			data-aos="fade-up">NO PRODUCT</h1>
	</c:if>

	<c:if test="${cart.size()!=0}">
		<div class="esul">
			<div id="result-cart"></div>

			<!-- 장바구니 -->
			<table class="table_basic cart_table n-cart-table">
				<thead>
					<tr>
						<th>전체</th>
						<th style="cursor: pointer"><input type="checkbox"
							id="allAgree" name="chk_all" value="selectall" /></th>
						<th>상품명</th>
						<th>판매가</th>
						<th>수량</th>
						<th>주문금액</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="v" items="${cart}" begin="0" end="${cart.size()}"
						varStatus="status">
						<tr class="cart_list_no">
							<td>${status.count}</td>
							<td><input type="checkbox" class="allBtn" name="chk_all"
								value="${v.pNum}" /></td>
							<td>
								<div class="connect_img">
									<a href="productDetail.do?pNum=${v.pNum}" class="img-block">
										<img src="${v.pImg}" alt="${v.pName}"
										style="max-height: 100px; max-width: 100px;" />
									</a>
								</div>
								<div class="article_info connect_info">
									<p class="txt_brand"></p>

									<p class="list_info">${v.pName}</p>
								</div>
							</td>
							<td class="pP">${v.pPrice}</td>
							<td><input class="pC" type="number" min="1"
								value="${v.cartCnt}" /> <input class="pCnt" type="hidden"
								value="${v.pCnt}" /></td>
							<td class="tP"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div
				style="display: flex; justify-content: flex-end; margin-top: 7px;">
				<button class="esulDelete" onclick="deleteAll();">모두삭제</button>
				<button class="esulDelete" onclick="deleteChk();">선택삭제</button>
			</div>
			<!-- 
         <div class="delete-btn-area">
            <a href="javascript:deleteAll();" class="" style="">모두삭제</a>
            <a href="javascript:deleteChk();" class="" style="">선택삭제</a>
         </div>
          -->

			<div class="info">
				<div>
					<p>*전 상품 무료 배송입니다.</p>
					<p>*재고가 없는 상품은 빨간색으로 표시됩니다.</p>
					<p>*장바구니 상품은 로그아웃시 모두 사라집니다.</p>
				</div>
				<div style="display: flex; align-items: flex-end">
					<p class="final-payment-price">
						최종결제금액 <span id="product-price"
							style="font-size: 30px; color: red">0</span> 원
					</p>
				</div>
			</div>

			<button type="button" class="n-btn btn-lg btn-accent"
				onclick="buy();">
				주문하기<span class="n-btn-order-sm-txt"></span>
			</button>
			<div style="padding: 10px"></div>
		</div>
	</c:if>

	<script>
            const allChkButton = document.getElementById("allAgree");
            // 전체 체크박스
            const chkButtons = document.getElementsByClassName("allBtn");
            // 체크박스
            const deleteAllBtn = document.getElementsByClassName("deleteAll");
            // 전체 삭제 버튼
            const deleteChkBtn = document.getElementsByClassName("deleteChk");
            // 선택 삭제 버튼
            const orderBtn = document.getElementsByClassName("btn-order");
            // 주문하기 버튼
            const totalPrice = document.getElementById("product-price");
            // 최종 결제금액
            const pPrice = document.getElementsByClassName("pP");
            // 상품 금액
            const pTotalPrice = document.getElementsByClassName("tP");
            // 상품 총금액
            const cartCnt = document.getElementsByClassName("pC");
            // 상품 수량
            const pCnt = document.getElementsByClassName("pCnt");
            // 상품 재고
            const cartList = document.getElementsByClassName("cart_list_no");
            // 상품 테이블

//----------------------------------
      
         function getPrice(node){
               return parseInt(node.innerText.replaceAll(",", ""));
            }
            // 콤마 떼서 숫자로 반환해주는 함수
            
            function productTotalSet(){ 
                for (let i = 0; i < pPrice.length; i++) {
                    const price = getPrice(pPrice[i]);
                    const count = parseInt(cartCnt[i].value);
                    pTotalPrice[i].innerText = (price * count).toLocaleString();
                }
            }
            // 상품 총금액 설정 함수
            
            function checkCnt(){
                for (let i = 0; i < cartCnt.length; i++) {
                    if (parseInt(cartCnt[i].value) > parseInt(pCnt[i].value)) {
                        cartList[i].style.backgroundColor = "#fff4f4";
                    } else {
                        cartList[i].style.backgroundColor = "unset";
                    }
                }
            }
            // 상품 재고 확인 함수
            
            function totalSet(){
               let sum = 0;
               for(btn of chkButtons) {
                  if (btn.checked) {
                       const price = getPrice(btn.parentNode.parentNode.querySelector(".tP"));
                       sum += price;
                  }
               }
               totalPrice.innerText = sum.toLocaleString();
            }
            // 최종 결제 금액 설정 함수
            
            function newCart(){
                let cart = [];
                for (let i = 0; i < chkButtons.length; i++) {
                   let product = [chkButtons[i].value, cartCnt[i].value];
               cart.push(product);
                }
                localStorage.setItem("cart", JSON.stringify(cart));
            }
            // 장바구니 생성 함수

            function chkSet(){
               let sum = 0;
               let flag = true;
               for (btn of chkButtons){
                  if (!btn.checked){
                     flag = false;
                  } else {
                     let price = getPrice(btn.parentNode.parentNode.querySelector(".tP"));
                     sum += price;
                  }
               }
               allChkButton.checked = flag;
               totalPrice.innerText = sum.toLocaleString();
            }
            // 올체크버튼, 최종결제금액 변경 함수
            
            function allChkSet(){
               let sum = 0;
               for (btn of chkButtons) {
                  btn.checked = allChkButton.checked;
                  if (btn.checked) {
                        let price = getPrice(btn.parentNode.parentNode.querySelector(".tP"));
                        sum += price;
                  }
               }
               totalPrice.innerText = sum.toLocaleString();
            }
            // 체크버튼, 최종결제금액 변경 함수
            
            function buy() {
                let buyList = [];
                let howMany = 0;
                for (let i = 0; i < chkButtons.length; i++) {
                    if (chkButtons[i].checked) {
                        howMany++;
                        let product = [chkButtons[i].value, cartCnt[i].value];
                  buyList.push(product);
                    }
                }
                if (howMany != 0) {
                    let cntFlag = true;
                    for (let i = 0; i < cartCnt.length; i++) {
                        if (chkButtons[i].checked) {
                            if (parseInt(cartCnt[i].value) > parseInt(pCnt[i].value)) {
                                cntFlag = false;
                                break;
                            }
                        }
                    }
                    if (cntFlag) {
                        location.href = "buyOrder.do?buyList=" + buyList;
                    } else {
                        alert("수량을 확인해주세요");
                    }
                } else {
                    alert("상품을 선택해주세요.");
                }
            }
            // 주문하기 버튼 클릭시 함수

            function deleteAll() {
                let cart = [];
                localStorage.setItem("cart", JSON.stringify(cart));
                alert("삭제 성공");
                location.href = "myCart.do?cart=" + cart;
            }
            // 모두삭제 함수

            function deleteChk() {
                let cart = [];
                let checkCnt = 0;
                for (let i = 0; i < chkButtons.length; i++) {
                    if (!chkButtons[i].checked) {
                       let product = [chkButtons[i].value, cartCnt[i].value];
                  cart.push(product);
                    }
                    else{
                    	checkCnt++;
                    }
                }
                localStorage.setItem("cart", JSON.stringify(cart));
                if(checkCnt != 0){
                	alert("삭제 성공");
                	location.href = "myCart.do?cart=" + cart;
                }
                else{
                	alert("삭제할 상품을 선택해주세요");
                }
            }
            // 선택삭제 함수
            
//----------------------------------

            // 페이지 로드하면
            productTotalSet();
            checkCnt();
            for (let i = 0; i < pPrice.length; i++) {
               pPrice[i].innerText = parseInt(pPrice[i].innerText).toLocaleString();
            }
            
            // 상품 개수가 바뀌면
            for(pC of cartCnt){
               pC.addEventListener("input", function(){
                  checkCnt();
                  productTotalSet();
                  totalSet();
                  newCart();
               })
            }
            
            // 체크박스 버튼이 바뀌면
            for(chkBtn of chkButtons){
               chkBtn.addEventListener("change", function(){
                  chkSet();
               })
            }
            
            // 올 체크박스 버튼이 바뀌면
            allChkButton.addEventListener("change", function(){
               allChkSet();
            })
            
        </script>
	<script>
	window.onkeydown = function() {
   	var kcode = event.keyCode;
   	if(kcode == 8 || (kcode >= 48 && kcode <= 222)) event.returnValue = false;
	}
	</script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/tiny-slider.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/navbar.js"></script>
	<script src="js/glightbox.min.js"></script>
	<script src="js/rellax.min.js"></script>
	<script src="js/custom.js"></script>
	<%@ include file="./footer.jsp"%>
</body>
</html>