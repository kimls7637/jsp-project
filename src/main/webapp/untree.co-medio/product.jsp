<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!--

=========================================================
* Argon Dashboard - v1.1.2
=========================================================

* Product Page: https://www.creative-tim.com/product/argon-dashboard
* Copyright 2020 Creative Tim (https://www.creative-tim.com)
* Licensed under MIT (https://github.com/creativetimofficial/argon-dashboard/blob/master/LICENSE.md)

* Coded by Creative Tim

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. -->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>ACENSE</title>
<!-- Favicon -->
<link rel="icon" href="images/favicon.ico">
<!-- Fonts -->
<link
   href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
   rel="stylesheet" />
<!-- Icons -->
<link href="./assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
<link
   href="./assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css"
   rel="stylesheet" />
<!-- CSS Files -->
<link href="./assets/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />
<style>
.btn-primary {
    background-color: #2935a5;
    border:0;
}
.avatar img {
    object-fit: cover;
    height: 100%;
}
.avatar {
   min-width:36px;
}
.btn-icon-clipboard{
   height:80px;
   overflow:hidden;
}
@media (width <= 980px) {
   .col{
   max-width:100% !important;
   }
}
@media ( min-width : 768px) {
   .navbar-vertical .navbar-collapse:before {
      content: '';
      display: block;
      margin: 0;
   }
}

.bg-gradient-primary {
   background: linear-gradient(360deg, #2935a5 0, #d3e0ff 100%) !important
}

.col {
   flex-basis: unset;
   flex-grow: unset;
   max-width: 50%;
   padding: 15px !important;
}

.tooltip {
   display: none !important;
}

@media ( min-width : 992px) {
   .product-item {
      flex: 0 0 100% !important;
      max-width: 100% !important;
   }
}

@media ( min-width : 768px) {
   .product-item {
      flex: 0 0 50% !important;
      max-width: 50% !important;
   }
}


</style>
</head>

<body class="">
   <%@ include file="./nav-menu.jsp"%>
   <div class="main-content">
      <div class="header bg-gradient-primary pb-8 pt-5 pt-md-8"></div>
      <!-- Page content -->
      <div class="container-fluid mt--7">
         <!-- Table -->
         <div class="row">
         <!-- 1 -->

            <div class="col">
               <div class="card shadow">
                  <div class="card-header bg-transparent" style="display:flex;">
                     <h3 class="mb-0" style="flex: 0 0 50%;">텐트</h3>
                     <div style="flex:0 0 50%; text-align:right;">
                     <a
                                            href="detailAdd.jsp?cate=텐트"
                                            class="btn btn-sm btn-primary"
                                            >추가</a
                                        >
                                        </div>
                  </div>
                  <div class="card-body">
                          
                     <div class="row icon-examples">
                      <c:forEach var="v" items="${cate0}" begin="0" end="${cate0.size()}"
                  varStatus="status">
                        <div class="col-lg-3 col-md-6 product-item">
                           <a href="adminDetail.do?pNum=${v.pNum}">
                              <button type="button" class="btn-icon-clipboard"
                                 data-clipboard-text="active-40" title="Copy to clipboard">
                                 <div>
                                       <span class="avatar avatar-sm rounded-circle"> <img
                                          alt="${v.pName}"
                                          src="${v.pImg}" class="avatar">
                                       </span>
                                    <span>${v.pName}</span>
                                 </div>
                              </button>
                           </a>
                        </div>
                        
                          </c:forEach>
                     </div>
                               
                  </div>
               </div>
            </div>
                  
                        <div class="col">
               <div class="card shadow">
                  <div class="card-header bg-transparent" style="display:flex;">
                     <h3 class="mb-0" style="flex: 0 0 50%;">테이블</h3>
                     <div style="flex:0 0 50%; text-align:right;">
                     <a
                                            href="detailAdd.jsp?cate=테이블"
                                            class="btn btn-sm btn-primary"
                                            >추가</a
                                        >
                                        </div>
                  </div>
                  <div class="card-body">
                          
                     <div class="row icon-examples">
                      <c:forEach var="v" items="${cate1}" begin="0" end="${cate1.size()}"
                  varStatus="status">
                        <div class="col-lg-3 col-md-6 product-item">
                           <a href="adminDetail.do?pNum=${v.pNum}">
                              <button type="button" class="btn-icon-clipboard"
                                 data-clipboard-text="active-40" title="Copy to clipboard">
                                 <div>
                                       <span class="avatar avatar-sm rounded-circle"> <img
                                          alt="${v.pName}"
                                          src="${v.pImg}" class="avatar">
                                       </span>
                                    <span>${v.pName}</span>
                                 </div>
                              </button>
                           </a>
                        </div>
                        
                          </c:forEach>
                     </div>
                               
                  </div>
               </div>
            </div>
                        <div class="col">
               <div class="card shadow">
                  <div class="card-header bg-transparent" style="display:flex;">
                     <h3 class="mb-0" style="flex: 0 0 50%;">체어</h3>
                     <div style="flex:0 0 50%; text-align:right;">
                     <a
                                            href="detailAdd.jsp?cate=체어"
                                            class="btn btn-sm btn-primary"
                                            >추가</a
                                        >
                                        </div>
                  </div>
                  <div class="card-body">
                          
                     <div class="row icon-examples">
                      <c:forEach var="v" items="${cate2}" begin="0" end="${cate2.size()}"
                  varStatus="status">
                        <div class="col-lg-3 col-md-6 product-item">
                           <a href="adminDetail.do?pNum=${v.pNum}">
                              <button type="button" class="btn-icon-clipboard"
                                 data-clipboard-text="active-40" title="Copy to clipboard">
                                 <div>
                                       <span class="avatar avatar-sm rounded-circle"> <img
                                          alt="${v.pName}"
                                          src="${v.pImg}" class="avatar">
                                       </span>
                                    <span>${v.pName}</span>
                                 </div>
                              </button>
                           </a>
                        </div>
                        
                          </c:forEach>
                     </div>
                               
                  </div>
               </div>
            </div>

      <div class="col">
               <div class="card shadow">
                  <div class="card-header bg-transparent" style="display:flex;">
                     <h3 class="mb-0" style="flex: 0 0 50%;">백팩</h3>
                     <div style="flex:0 0 50%; text-align:right;">
                     <a
                                            href="detailAdd.jsp?cate=백팩"
                                            class="btn btn-sm btn-primary"
                                            >추가</a
                                        >
                                        </div>
                  </div>
                  <div class="card-body">
                          
                     <div class="row icon-examples">
                      <c:forEach var="v" items="${cate3}" begin="0" end="${cate3.size()}"
                  varStatus="status">
                        <div class="col-lg-3 col-md-6 product-item">
                           <a href="adminDetail.do?pNum=${v.pNum}">
                              <button type="button" class="btn-icon-clipboard"
                                 data-clipboard-text="active-40" title="Copy to clipboard">
                                 <div>
                                       <span class="avatar avatar-sm rounded-circle"> <img
                                          alt="${v.pName}"
                                          src="${v.pImg}" class="avatar">
                                       </span>
                                    <span>${v.pName}</span>
                                 </div>
                              </button>
                           </a>
                        </div>
                        
                          </c:forEach>
                     </div>
                               
                  </div>
               </div>
            </div>

         </div>
         <!-- Footer -->
         <!-- Footer -->
         <footer class="footer"></footer>
      </div>
   </div>
   <!--   Core   -->
   <script src="./assets/js/plugins/jquery/dist/jquery.min.js"></script>
   <script
      src="./assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
   <!--   Optional JS   -->
   <script src="./assets/js/plugins/clipboard/dist/clipboard.min.js"></script>
   <!--   Argon JS   -->
   <script src="./assets/js/argon-dashboard.js?v=1.1.2"></script>
   <script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
   <script>
            window.TrackJS &&
                TrackJS.install({
                    token: "ee6fab19c5a04ac1a32a645abde4613a",
                    application: "argon-dashboard-free",
                });
        </script>

</body>
</html>