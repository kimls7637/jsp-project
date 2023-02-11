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
<link rel="stylesheet" href="css/glightbox.min.css" />
<link rel="stylesheet" href="css/style2.css" />


<title>ACENSE</title>
	   <style>
   #content{
   padding: 0 300px !important;
   }
   .v-h-full {
	height: auto;
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

	<div id="contentWrap">
		<link type="text/css" rel="stylesheet"
			href="/template_common/shop/basic_simple/menu.2.css?t=201711221039" />
		<div id="aside">
			<h2 class="aside-tit">MY PAGE</h2>
			<div class="lnb-wrap">
				<div class="lnb-bx">
					<h2 class="txt txt1">SHOPPING INFO</h2>
					<div class="lnb">
						<ul>
							<li class="first"><a href="mypage.jsp">주문내역</a></li>
						</ul>
					</div>
				</div>
				<div class="lnb-bx">
					<h2 class="txt txt2">SHOPPING QUESTION</h2>
					<div class="lnb">
						<ul>
							<li class="first"><a href="myPost.jsp">내 게시글 보기</a></li>
							<li><a href="myReview.jsp">내
									리뷰 모아보기</a></li>
						</ul>
					</div>
				</div>
				<div class="lnb-bx">
					<h2 class="txt txt3">CUSTOMER INFO</h2>
					<div class="lnb">
						<ul>
							<li class="first"><a
								href="changeMyInfo.jsp">회원정보변경</a>
							</li>
							<!-- <a href="http://localhost:9090/homepage/memberOut.html">회원정보탈퇴신청</a> -->
							<li><a href="memberOut.jsp" class="btn_open">회원탈퇴신청</a></li>
						</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- .lnb-wrap -->
		</div>
		<!-- #aside -->
		<hr />
		
		</div>



	<div id="content" style="padding: 0 100px;">
		<div id="myPost">
			<div class="page-body">
				<!-- 내가 쓴 게시판 목록 -->
				<!-- //내가 쓴 게시판 목록 -->

				<div class="tit-page-2" style="display:flex; justify-content:space-between;">
					<h2>나의 문의(0)</h2>
					<p style="position:unset;">
						<span class="fc-blue">[김형진]</span>님께서 작성하신 문의 목록입니다.
					</p>
				</div>

				<div class="table-d2-list">
					<table summary="번호, 게시판, 제목, 날짜, hit수">
						<caption>내 문의 리스트</caption>
						<colgroup>
							<col width="75">
							<col width="125">
							<col width="*">
							<col width="115">
							<col width="105">
						</colgroup>
						<thead>
							<tr>
								<th scope="row"><div class="tb-center">NO.</div></th>
								<th scope="row"><div class="tb-center">BOARD</div></th>
								<th scope="row"><div class="tb-center">SUBJECT</div></th>
								<th scope="row"><div class="tb-center">DATE</div></th>
								<th scope="row"><div class="tb-center">HITS</div></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="5"><div class="tb-center">작성하신 문의가 없습니다.</div></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="paging"></div>
			</div>
			<!-- .page-body -->
		</div>
	</div>



	<!-- Preloader -->
	<div id="overlayer"></div>
	<div class="loader">
		<div class="spinner-border" role="status">
			<span class="visually-hidden">Loading...</span>
		</div>
	</div>

	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/tiny-slider.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/navbar.js"></script>
	<script src="js/glightbox.min.js"></script>
	<script src="js/rellax.min.js"></script>
	<script src="js/custom.js"></script>
	<script src="js/mypage.js"></script>




<%@ include file="./footer.jsp"%>


</body>
</html>
