<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!-- /*
* Template Name: Medio
* Template Author: Untree.co
* Tempalte URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
<!DOCTYPE html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<meta name="author" content="Untree.co" />
<link rel="icon" href="images/favicon.ico">

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
<link rel="stylesheet" href="css/style2.css" />

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



<title>ACENSE</title>
<style>
a {
   color: black;
}

.fadeOutDown {
   z-index: -1;
   display: none;
}

.esulTr th {
   text-align: center;
}

@media ( min-width : 992px) {
   .col-md-offset-1 {
      margin-left: 0px;
   }
}

@media ( min-width : 992px) {
   .col-md-10 {
      width: 100%;
   }
}

.reviewButton {
   padding: 3px 7px;
   border-radius: 3px;
   background-color: white;
   border: 1.5px solid gray;
   font-size: 14px;
   font-weight: bold;
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
   padding: 10px 200px;
}

#content {
   padding: 0 300px !important;
}

.v-h-full {
   height: auto;
}

.img-bg {
   position: absolute;
   width: 100%;
   height: 100%;
   top: 0;
}

.img-bg>img {
   width: 100%;
   height: 100%;
   object-fit: cover;
   transform: unset;
}

.container {
   width: 100%;
   padding-right: var(- -bs-gutter-x, 0.75rem);
   padding-left: var(- -bs-gutter-x, 0.75rem);
   margin-right: auto;
   margin-left: auto;
}

a:hover, a:focus {
   color: #fff;
   text-decoration: none;
}

.site-navigation {
   font-weight: bold;
}
#input-password:valid + .guard{
   color:black;
}
#input-password + .guard{
   color:red;
}
#dd:valid + .guard{
   color:black;
}
#dd + .guard{
   color:red;
}
</style>

</head>
<body>

   <%@ include file="./header.jsp"%>

   <div class="hero v-h-full overlay">
      <div class="img-bg rellax">
         <img src="images/main.png" alt="Image" class="img-fluid" />
      </div>
      <div class="container">
         <div class="row align-items-center v-h-full">
            <div class="col-lg-7 col-xxl-6 mx-auto text-center">
               <h1 class="heading-2 text-white mb-3" data-aos="fade-up">My
                  Page</h1>
               <p data-aos="fade-up" data-aos-delay="200"
                  class="text-white lead mb-4">나의 정보를 변경할 페이지 입니다.</p>
            </div>
         </div>
      </div>
   </div>

   <div id="cH">
      <div id="fh5co-product">
         <div class="container" style="width: 100%; max-width: 64%;">

            <div class="row">
               <div class="col-md-10 col-md-offset-1">
                  <div class="fh5co-tabs animate-box">


                     <br> <br> <br> <br> <br>
                     <ul class="fh5co-tab-nav" style="display: flex;">
                        <li class="active" id="firstH"><a href="#" data-tab="1"><span
                              class="icon visible-xs"><i class="icon-file"></i></span><span
                              class="hidden-xs">Order</span></a></li>

                        <li id="2H"><a href="#" data-tab="2"><span
                              class="icon visible-xs"><i class="icon-star"></i></span><span
                              class="hidden-xs">Review</span></a></li>
                        <li id="3H"><a href="#" data-tab="3"><span
                              class="icon visible-xs"><i class="icon-star"></i></span><span
                              class="hidden-xs">QnA</span></a></li>
                        <li id="4H"><a href="#" data-tab="4"><span
                              class="icon visible-xs"><i class="icon-star"></i></span><span
                              class="hidden-xs">Modify</span></a></li>
                        <li id="5H"><a href="#" data-tab="5"><span
                              class="icon visible-xs"><i class="icon-star"></i></span><span
                              class="hidden-xs">Withdrawal</span></a></li>
                     </ul>

                     <!-- Tabs -->
                     <div class="fh5co-tab-content-wrap">
                        <div class="fh5co-tab-content tab-content active" id="fH"
                           data-tab-content="1">
                           <div class="col-md-10 col-md-offset-1" style="margin: 0px;">
                              <div class="feed">
                                 <%@ include file="./myOrder.jsp"%>

                              </div>
                           </div>
                        </div>
                        <div class="fh5co-tab-content tab-content" data-tab-content="2"
                           id="fH2">
                           <div class="col-md-10 col-md-offset-1">
                              <div class="feed">

                                 <%@ include file="./myReview.jsp"%>

                              </div>
                           </div>
                        </div>


                        <div class="fh5co-tab-content tab-content" data-tab-content="3"
                           id="fH3">
                           <div class="col-md-10 col-md-offset-1">
                              <div class="feed">
                                 <%@ include file="./myQnA.jsp"%>

                              </div>
                           </div>
                        </div>

                        <div class="fh5co-tab-content tab-content" data-tab-content="4"
                           id="fH4">
                           <div class="col-md-10 col-md-offset-1">
                              <div class="feed">
                                 <c:if test="${memberId.indexOf('@')==-1}">
                                    <%@ include file="./changeMyInfo2.jsp"%>
                                 </c:if>
                                 <c:if test="${memberId.indexOf('@')!=-1}">
                                    <h2>SNS로그인 회원은 정보변경이 불가합니다.</h2>
                                 </c:if>
                              </div>
                           </div>
                        </div>

                        <div class="fh5co-tab-content tab-content" data-tab-content="5"
                           id="fH5">
                           <div class="col-md-10 col-md-offset-1">
                              <div class="feed">

                                 <%@ include file="./memberOut2.jsp"%>


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
   <script src="js/mypage.js"></script>


   <%@ include file="./footer.jsp"%>









   <script>

   
      const cH = document.getElementById("cH");
      //길이
      const firstH = document.getElementById("firstH");
      //1버튼
      const twoH = document.getElementById("2H");
      //1버튼
      const threeH = document.getElementById("3H");
      //1버튼
      const fourH = document.getElementById("4H");
      //1버튼
      const fiveH = document.getElementById("5H");
      //1버튼
      const fH = document.getElementById("fH").offsetHeight;
      const fH2 = document.getElementById("fH2").offsetHeight;
      const fH3 = document.getElementById("fH3").offsetHeight;
      const fH4 = document.getElementById("fH4").offsetHeight;
      const fH5 = document.getElementById("fH5").offsetHeight;
      cH.style.height = fH + 300 + "px";
      firstH.addEventListener("click", function() {
         cH.style.height = fH + 300 + "px";
      })
      twoH.addEventListener("click", function() {
         cH.style.height = fH2 + 300 + "px";
      })
      threeH.addEventListener("click", function() {
         cH.style.height = fH3 + 300 + "px";
      })
      fourH.addEventListener("click", function() {
         cH.style.height = fH4 + 300 + "px";
      })
      fiveH.addEventListener("click", function() {
         cH.style.height = fH5 + 300 + "px";
      })
   </script>

<script>
function chekcDelete(event){
   console.log("앙");
   if(window.confirm("정말 탈퇴하시겠습니까?")){
   }
   else{
       event.preventDefault();
   }
}
</script>






</body>
</html>