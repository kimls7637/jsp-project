<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 이슬완료 -->
    <style>
      @media (max-width: 767.98px){
.nav-hidden {
    display:none;
}
}
    </style>
      <script>
  function logout(){
      location.href="logout.do";
   }
  </script>
  <nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
    <div class="container-fluid">
      <!-- Toggler -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <!-- Brand -->
      <div class="nav-hidden" style="height:20px;">
      </div>
      <a class="navbar-brand pt-0" href="adminMain.do" style="padding-bottom:0px;">
        <h1 style="margin:0px;">ACENSE</h1>
      </a>
      <div class="nav-hidden" style="height:20px;">
      </div>
      <!-- Collapse -->
      <div class="collapse navbar-collapse" id="sidenav-collapse-main">
        <!-- Navigation -->
        <ul class="navbar-nav">
          <li class="nav-item ">
            <a class="nav-link " href="adminMain.do" style="padding: 1.2rem 1.5rem;">
              <i class="ni ni-money-coins text-green"></i> 매출현황
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="adminProduct.do" style="padding: 1.2rem 1.5rem;">
              <i class="ni ni-cart text-blue"></i> 상품관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="popup.jsp" style="padding: 1.2rem 1.5rem;">
              <i class="ni ni-single-copy-04 text-muted"></i> 팝업관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="qnaList.do" style="padding: 1.2rem 1.5rem;">
              <i class="ni ni-bulb-61 text-yellow"></i> 큐앤에이
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="javascript:logout()" style="padding: 1.2rem 1.5rem;">
              <i class="ni ni-button-power text-red"></i> 로그아웃
            </a>
          </li>
        </ul>
        
      </div>
    </div>
  </nav>
