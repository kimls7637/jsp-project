<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="images/favicon.ico">
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>ACENSE</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description"
	content="Free HTML5 Website Template by gettemplates.co" />
<meta name="keywords"
	content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
<meta name="author" content="gettemplates.co" />

<!-- Facebook and Twitter integration -->
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<!-- <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet"> -->
<!-- <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i" rel="stylesheet"> -->

<!-- Animate.css -->
<link rel="stylesheet" href="css/style33.css" />
<link rel="stylesheet" href="css/animate33.css" />
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="css/icomoon33.css" />
<!-- Bootstrap  -->
<link rel="stylesheet" href="css/bootstrap33.css" />

<!-- Flexslider  -->
<link rel="stylesheet" href="css/flexslider33.css" />

<!-- Owl Carousel  -->
<link rel="stylesheet" href="css/owl.carousel.min33.css" />
<link rel="stylesheet" href="css/owl.theme.default.min33.css" />

<!-- Theme style  -->
<link rel="stylesheet" href="fonts/icomoon/style.css" />
<link rel="stylesheet" href="fonts/feather/style.css" />

<link rel="stylesheet" href="css/style2.css" />

<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min33.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
      <script src="js/respond.min.js"></script>
    <![endif]-->
<style>
a:hover {
	text-decoration: unset;
	color: black !important;
}

.fh5co-tabs .fh5co-tab-content-wrap .feed>div h3 {
	font-family: Raleway, "Malgun Gothic", "맑은 고딕", "Nanum Gothic", "나눔 고딕",
		AppleGothic, Dotum, "Apple SD Gothic Neo", 돋움, sans-serif;
}

#fh5co-product {
	overflow-y: hidden;
}

.burger.light:before, .burger.light span, .burger.light:after {
	background-color: black;
}

.logo {
	color: black;
}

.logo:hover {
	color: gray
}

.site-nav .site-navigation .site-menu>li>a {
	color: black
}

.site-nav .site-navigation .site-menu>li>a:hover {
	color: gray
}

.mainimg {
	margin-top: 130px;
	display: flex;
	justify-content: center;
}

.row {
	display: flex;
	margin: 0;
	justify-content: center;
}
</style>
</head>

<body>

	<%@ include file="./header.jsp"%>

	<div class="fh5co-loader"></div>
	<div id="page">
		<div id="fh5co-product">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 animate-box">
						<div class="oll">
							<div>
								<div style="display: flex; flex-direction: row;">
									<figure class="mainimg" style="width: 50%;">
										<img src="${product.pImg}" alt="${product.pName}"
											style="width: 500px; heightt: 500px;" />
									</figure>
									<div
										style="width: 50%; padding: 100px 0px 0px 100px; display: flex; flex-direction: column; justify-content: space-evenly;">
										<div>
											<h1 style="font-weight: bold;">${product.pName}</h1>
										</div>
										<div style="display:flex;">
										<c:forEach begin="1"
															end="${Integer.parseInt(Grade)}" varStatus="st">
															<img style="height: 30px;" src="./images/sixsenseStar.png" alt="" />
														</c:forEach>
														<c:forEach begin="1"
															end="${5-Integer.parseInt(Grade)}" varStatus="st">
															<img style="filter: invert(90%); height: 30px;" src="./images/sixsenseStar.png" alt="" />
														</c:forEach>
														</div>
										<div
											style="border-bottom: 1px solid #c9c9c9; padding: 30px 0; border-top: 1px solid #c9c9c9;">
											<div style="font-size: 10px;">남은 수량 : ${product.pCnt}개</div>
											<div
												style="display: flex; justify-content: space-between; align-items: flex-end;">
												<div style="padding-bottom: 8px;">
													<c:if test="${product.pCnt != 0}">
														<input type="number" id="cart-cnt" style="width: 100px;"
															onkeypress="keyEventFunc(event)" min="1"
															max="${product.pCnt}" value="1">
													</c:if>
													<c:if test="${product.pCnt == 0}">
														<div style="color: red;">재고가 없습니다.</div>
													</c:if>
												</div>
												<div style="color: black; font-size: 30px;">${product.pPrice}₩</div>
											</div>
										</div>
										<c:if test="${product.pCnt != 0}">
											<c:if test="${memberId != null}">
												<button class="btn btn-primary btn-outline btn-lg"
													id="add-cart">장바구니</button>
											</c:if>
											<c:if test="${memberId == null}">
												<button class="btn btn-primary btn-outline btn-lg"
													id="add-cart-login">장바구니</button>
											</c:if>
										</c:if>
										<c:if test="${product.pCnt == 0}">
											<button class="btn btn-primary btn-outline btn-lg"
												id="add-cart" disabled type="button"
												style="border-color: black;">재고부족</button>
										</c:if>



									</div>
								</div>
							</div>
						</div>
						<br> <br> <br> <br> <br>
					</div>
				</div>
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<div class="fh5co-tabs animate-box">
							<ul class="fh5co-tab-nav">
								<li class="active" style="width: 50%"><a href="#"
									data-tab="1"><span class="icon visible-xs"><i
											class="icon-file"></i></span><span class="hidden-xs">Product
											Details</span></a></li>
								<li style="width: 50%"><a href="#" data-tab="3"><span
										class="icon visible-xs"><i class="icon-star"></i></span><span
										class="hidden-xs">Feedback &amp; Ratings</span></a></li>
							</ul>

							<!-- Tabs -->
							<div class="fh5co-tab-content-wrap">
								<div class="fh5co-tab-content tab-content active"
									data-tab-content="1">
									<div class="col-md-10 col-md-offset-1">
										<!-- 
                              <span class="price">30000₩</span>
                               -->
										<h2>Hauteville Rocking Chair</h2>
										<p>
											[반품 및 교환 절차 안내]<br /> 1. 반품 및 교환은 제품 발송 전, 헬리녹스
											고객센터(02-730-1928),A 게시판, 카카오톡 채널로 <br />사전에 문의하셔야 처리가 가능합니다.

											<br />2. 반품 및 교환은 상품을 수령한 날로부터 7일 이내 접수해주셔야 가능합니다. <br />3.
											반품 및 교환 주소 : 인천시 서구 가석로 30, 광양프런티어밸리 3차 1017호 <br />헬리녹스(02-730-1928)

											<br />4. 반품 및 교환이 불가능한 경우 <br />- 포장이 훼손되어 상품 가치가 현저히 감소한
											경우. <br /> ->상품택 제거, 종이안내서 훼손 및 분실 등. <br />- 구매자의 사용 또는 일부
											소비에 의하여 상품 가치가 현저히 감소한 경우. <br />- 기간 경과에 의하여 재판매가 불가 할 정도로
											상품가치가 현저히 감소한 경우. <br />- 악세사리류는 포장 특성상 개봉 시 반품 및 교환이
											불가능합니다. <br />- 기타, '전자상거래 등에서의 소비자보호에 관한 법률'이 정하는 청약철회
											제한사유에 해당되는 경우. <br />※ 반품/교환 시 상기 내용을 충족시키지 않는 경우, 반송될 수
											있습니다. <br />5. 반품 및 교환 처리기간 : 제품 입고 후 입고순으로 검수가 진행되며, 검수완료 후
											<br />개별 연락드릴 예정입니다. (최대 1~2주 소요)
										</p>

										<p>
											[반품/교환 택배비용]<br /> 1. 반품 택배비 : 기본 배송료는 6,000원(왕복택배비) 입니다. <br />상품별
											차등 부과되며, 제주지역 및 도서산간 지역은 배송비가 추가될 수 있습니다. <br />(고가품등 특정 제품에
											대한 반품 택배비는 제품에 따라 다르게 적용될 수 있습니다.) <br />2. 고객님의 변심으로 교환 및
											반품을 하실 경우 택배비는 고객님께서 부담하셔야 합니다. <br />(예 : 단순변심, 색상 및 사이즈 교환
											등 포함) <br />3. 물품에 이상이 있어 반품 및 교환을 원하시는 경우 택배비는 헬리녹스가 부담합니다.

											<br />(고객님의 불량의심으로 접수시, 불량판정이 아닐 경우 택배비는 고객님께 청구됩니다.)
										</p>
										<p>
											※ 취급시 주의사항<br /> <br />· 제품 본래의 용도 이외의 목적으로는 사용하지 말아주십시오. <br />·
											넘어지는 것을 방지하기 위해 평평하고 단단한 바닥에 놓고 사용하십시오. <br />· 조립 시 다치지 않게
											주의하시고 확실히 조립이 되었는지 확인한 이후에 사용하십시오. <br />· 어린아이가 조립 시 보호자와
											함께 조립하십시오 <br />· 표기된 내하중은 제품 사용 시 프레임에 골고루 하중이 분산되었을 때의
											기준입니다. <br />· 사용 시 중심을 잃고 넘어지거나 너무 한쪽으로 쏠려서 앉아 하중이 한 곳에 집중될
											경우, <br />또는 앉는 강도에 따라 프레임에 변형이 생길 위험이 있으므로 주의해 주시기 바랍니다. <br />·
											열에 의한 변형이 일어날 수 있으므로 화기를 멀리하고 보관에 유의해 주십시오. <br />· 제품 특성상
											색상에 따라 이염이 될 수 있습니다. <br />· 제품 컬러는 생산차수에 따라 차이가 발생할 수 있습니다.

											<br />· 고온다습한 환경에서 보관 시, 제품의 손상 또는 인쇄 변형 (갈라짐, 벗겨짐 등)의 원인이
											되니 <br />주의해 주시기 바랍니다. <br />· 시트 오염 시 부드러운 천이나, 물티슈 등으로
											가볍게 닦아내시기 바랍니다. <br />· 직사광선에 장시간 노출시키거나 습한 환경에서 사용은 제품 변형의
											원인이 되므로 사용 시 유의해 주시기 바라며, 사용 후에는 반드시 습기와 이물질을 제거 후 보관해 주십시오.
											제품의 부식,<br /> 인쇄 변형, 이염의 원인이 될 수 있습니다.
										</p>
									</div>
								</div>

								<div class="fh5co-tab-content tab-content" data-tab-content="2">
									<div class="col-md-10 col-md-offset-1">
										<h3>Product Specification</h3>
										<img src="./images/상세설명.png" alt="이미지" width="100%" />
										<p>
											※ 제품 안내사항 <br />· 원단의 종류 및 컬러에 따라 무게에 차이가 있을 수 있습니다. (제품별
											세부사항은 홈페이지를 참조해 주세요) <br />· 제품 사양은 별도의 공지 없이 변경될 수 있음을
											알려드립니다.
										</p>
										<p>
											품질 보증 기간<br /> <br />-품질 보증 기간 : 구입일로부터 1년 이내 무상수리 (조립 불량,
											봉재 불량) <br />-품질 보증 기간이란? 제조자 과실로 발생된 경우 제조회사로 보상 (무료 수선,
											교환, 환불)을 <br />청구할 수 있는 기간을 의미합니다. 보상은 구입가격을 기준으로 하여, 보상 순서는
											정상 회복이 가능한 경우에는 무료 수선해드리며, 정상 회복이 불가능할 경우에는 동일 제품 또는 동종 제품으로
											교환해 <br />드립니다. <br />제조물 책임 (PL) 2억 원 보험 가입 / 고객센터 :
											02-730-1928 상담 시간 : 10:00~16:00
										</p>
										<p>
											AS안내<br /> <br />- 소비자 분쟁 해결 기준(공정거래위원회 고시)에 따라 피해를 보상받을 수
											있습니다. <br />- A/S는 02-730-1928 / 카카오톡 플러스 ID : helinoxcs
											(헬리녹스)로 문의하시기 바랍니다
										</p>
									</div>
								</div>

								<div class="fh5co-tab-content tab-content" data-tab-content="3">
									<div class="col-md-10 col-md-offset-1">
										<div class="feed">

											<c:if test="${review.size()==0}">
												<div>
													<h5 class="heading-2 text-white mb-5"
														style="color: black !important; font-size: 40px;">NO
														REVIEW</h5>
												</div>
											</c:if>


											<!-- 리뷰포문 -->
											<c:forEach var="v" items="${review}" begin="0"
												end="${review.size()}" varStatus="status">
												<div>
													<blockquote>
														<p>${v.rContent}</p>
													</blockquote>
													<h3>${v.rStarId}</h3>
													<span class="rate"> <c:forEach begin="1"
															end="${Integer.parseInt(v.rGrade)}" varStatus="st">
															<i class="icon-star2"></i>
														</c:forEach>
													</span>
												</div>
											</c:forEach>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>
	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>

	<!— jQuery —>
	<script src="js/jquery.min33.js"></script>
	<!— jQuery Easing —>
	<script src="js/jquery.easing.1.333.js"></script>
	<!— Bootstrap —>
	<script src="js/bootstrap.min33.js"></script>
	<!— Waypoints —>
	<script src="js/jquery.waypoints.min33.js"></script>
	<!— Carousel —>
	<script src="js/owl.carousel.min33.js"></script>
	<!— countTo —>
	<script src="js/jquery.countTo33.js"></script>
	<!— Flexslider —>
	<script src="js/jquery.flexslider-min33.js"></script>
	<!— Main —>
	<script src="js/main33.js"></script>

	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/tiny-slider.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/navbar.js"></script>
	<script src="js/glightbox.min.js"></script>
	<script src="js/rellax.min.js"></script>
	<script src="js/custom.js"></script>

	<script>
      const addCart = document.getElementById("add-cart");
      // 장바구니 추가 버튼
      const cartCnt = document.getElementById("cart-cnt");
      // 수량
      const cartLogin = document.getElementById("add-cart-login");
      // 비회원 장바구니 버튼
        
      if(cartLogin != null){
        // 비회원일때
      cartLogin.addEventListener("click", function(){
         alert("로그인 후 이용해주세요");
         location.href="login.jsp";
      })
      }      
      
      if(addCart != null){
      // 회원일때
         addCart.addEventListener("click", function(){
         let num;
         let cart2 = [];
         if(localStorage.getItem("cart") != null){
            cart2 = JSON.parse(localStorage.getItem("cart"));
         }
         for(let i = 0; i < cart2.length; i++){
            if(cart2[i][0] == ${product.pNum}){
               // 내가 담고싶은 상품 pk가  장바구니에 담겨있는 상품pk랑 같다면
               num = parseInt(cart2[i][1])+parseInt(cartCnt.value);
               cart2.splice(i, 1);
               i--;
            }
         }
         let product;
         if(num != null){
            // num에 수량을 저장했었다면
            product = ['${product.pNum}', num];
         }
         else{
            // 아니라면
             product = ['${product.pNum}', cartCnt.value];
         }
         cart2.push(product);
         localStorage.setItem("cart", JSON.stringify(cart2));
         location.href="myCart.do?cart="+cart2;
           })
         
      }
   </script>

	<script>
window.onkeydown = function() {
   var kcode = event.keyCode;
   if(kcode == 8 || (kcode >= 48 && kcode <= 222)) event.returnValue = false;
}
</script>

	<%@ include file="./footer.jsp"%>
</body>
</html>