<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 이슬완료/백팩멀티백 컨트롤러랑협의 -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
.site-navigation {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.site-navigation>a:last-child {
	margin: 0 !important;
}

a:hover, a:focus {
   color: #fff;
   text-decoration: none;
}

.site-navigation {
   font-weight: bold;
}

</style>

<div class="site-mobile-menu site-navbar-target">
	<div class="site-mobile-menu-header">
		<div class="site-mobile-menu-close">
			<span class="icofont-close js-menu-toggle"></span>
		</div>
	</div>
	<div class="site-mobile-menu-body"></div>
</div>

<nav class="site-nav">
	<div class="container">
		<div class="site-navigation">
			<c:if test="${memberId!='admin'}">
				<a href="main.do" class="logo m-0">Acense</a>
			</c:if>
			<c:if test="${memberId=='admin'}">
				<a href="adminMain.do" class="logo m-0">Acense</a>
			</c:if>

			<c:if test="${memberId!='admin'}">
				<ul
					class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end">

					<c:if test="${memberId!=null}">
						<li><a href="javascript:logout()">LOGOUT</a></li>
						<li><a href="myOrder.do">MY PAGE</a></li>
						<li><a href="javascript:localCart()">CART</a></li>
					</c:if>

					<c:if test="${memberId==null}">
						<li><a href="login.jsp">LOGIN</a></li>
						<li><a href="register.jsp">JOIN</a></li>
					</c:if>

					<li class="has-children"><a href="#">SHOP</a>
						<ul class="dropdown">
							<li><a href="productList.do?pCate=텐트">텐트</a></li>
							<li><a href="productList.do?pCate=체어">체어</a></li>
							<li><a href="productList.do?pCate=테이블">테이블</a></li>
							<li><a href="productList.do?pCate=백팩">백팩</a></li>
						</ul></li>
					<li><a href="qnaList.do">Q/A</a></li>
				</ul>
			</c:if>

			<a href="#"
				class="burger ms-auto float-end site-menu-toggle mt-2 js-menu-toggle d-inline-block d-lg-none light"
				data-toggle="collapse" data-target="#main-navbar"> <span></span>
			</a>
		</div>
	</div>
</nav>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script>
   function logout(){
	   kakaoLogout();
	   window.location.href='logout.do';
   }

   <%-- 카카오 토~크 로그아웃--%>
   window.Kakao.init('201e2627789e3c826127d97f4d6d7252');
	function kakaoLogout() {
   	if (!Kakao.Auth.getAccessToken()) {
		    console.log('Not logged in.');
		    return;
	    }
	    Kakao.Auth.logout(function(response) {
   		//alert(response +' logout');
		
	    });
};

    function localCart(){
       let cart=[];
      //카트 선언
      if(localStorage.getItem("cart") != null){
      //카트가 널이 아니면
         cart = JSON.parse(localStorage.getItem("cart"));
         //로컬스토리지에 저장되어있는 카트(스트링)을 배열로 변환시킨게 카트야
      }
       location.href="myCart.do?cart="+cart;
       //장바구니페이지로 보내줘
    }
   </script>