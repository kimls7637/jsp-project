<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- 이슬완료-->
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>ACENSE</title>
  <!-- Favicon -->
  <link rel="icon" href="images/favicon.ico">
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <!-- Icons -->
  <link href="./assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
  <link href="./assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="./assets/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />
  
  <style>
tbody th {
   text-align: center; 
}
tbody td {
   text-align: right; 
}
.btn-primary {
    background-color: #2935a5;
    border:0;
}
@media (min-width: 1200px){
.col-xl-3 {
    flex: 0 0 50%;
    max-width: 50%;
}
}
  @media (min-width: 1200px){
.col-xl-4 {
    flex: 0 0 50%;
    max-width: 50%;
}
}
  @media (max-width: 767.98px){
.nav-hidden {
    display:none;
}
}
@media (min-width: 1200px){
.col-xl-8 {
    flex: 0 0 50%;
    max-width: 50%;
}
}
  .bg-gradient-primary{
     background: linear-gradient(360deg, #2935a5 0, #d3e0ff 100%) !important
  }
  .fa-credit-card::before{
     content:"\f09d";
  }
  .fa-gift::before{
     content:"\f06b";
  }
  .fa-sack-dollar::before{
     content:"\24";
  }
  @media (min-width: 768px) {
  .navbar-vertical .navbar-collapse {
    margin-left: -1rem;
    margin-right: -1rem;
    padding-left: 1rem;
    padding-right: 1rem;
  }
  .navbar-vertical .navbar-collapse:before {
    content: '';
    display: block;
    margin: 0;
  }
}
  </style>
</head>

<body class="">


<%@ include file="./nav-menu.jsp" %>
  <div class="main-content">
    <!-- Header -->
    <div class="header bg-gradient-primary pb-8 pt-5 pt-md-8" style="padding-top: 5rem; padding-bottom: 5rem;">
      <div class="container-fluid">
        <div class="header-body">
          <!-- Card stats -->
          <div class="row">
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">총 회원 수</h5>
                      <span class="h2 font-weight-bold mb-0">${allMember.idCnt}명</span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-info text-white rounded-circle shadow">
                        <i class="fas fa-users"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">총 매출</h5>
                      <span class="h2 font-weight-bold mb-0"> ${allPrice.totalPrice}원</span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-success text-white rounded-circle shadow">
                        <i class="fas fa-sack-dollar"></i>
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
    <div class="container-fluid mt--7">
      <div class="row">
        <div class="col-xl-8 mb-5 mb-xl-0">
          <div class="card bg-gradient-default shadow">
            <div class="card-header bg-transparent">
              <div class="row align-items-center">
                <div class="col">
                  <h6 class="text-uppercase text-light ls-1 mb-1">Sales</h6>
                  <h2 class="text-white mb-0">매출</h2>
                </div>
              </div>
            </div>
            <div class="card-body">
              <!-- Chart -->
              <div class="chart">
                <!-- Chart wrapper -->
                <canvas id="chart-sales" class="chart-canvas" data-week="${day}" data-sales="${dayPrice}"></canvas>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-4">
          <div class="card shadow">
            <div class="card-header bg-transparent">
              <div class="row align-items-center">
                <div class="col">
                  <h6 class="text-uppercase text-muted ls-1 mb-1">Sales Rate</h6>
                  <h2 class="mb-0">판매량</h2>
                </div>
              </div>
            </div>
            <div class="card-body">
              <!-- Chart -->
              <div class="chart">
                  <canvas id="chart-orders" class="chart-canvas" data-category="${cate}" data-sales="${totalCate}" ></canvas> 
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row mt-5">
        <div class="col-xl-8 mb-5">
          <div class="card shadow">
            <div class="card-header border-0">
              <div class="row align-items-center">
                <div class="col">
                  <h3 class="mb-0">Top 5 Product</h3>
                </div>
              </div>
            </div>
            <div class="table-responsive">
              <!-- Projects table -->
              <table class="table align-items-center table-flush">
                <thead class="thead-light">
                  <tr align="center">
                    <th scope="col">상품</th>
                    <th scope="col">판매량</th>
                  </tr>
                </thead>
                <tbody>
                            <c:forEach var="v" items="${topProduct}" begin="0" end="5" varStatus="status">
                  <tr>
                    <th scope="row">
                      ${v.oPName}
                    </th>
                    <td>
                      ${v.oCnt}
                    </td>
                  </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <div class="col-xl-4 mb-xl-0">
          <div class="card shadow">
            <div class="card-header border-0">
              <div class="row align-items-center">
                <div class="col">
                  <h3 class="mb-0">Top 5 User</h3>
                </div>
              </div>
            </div>
            <div class="table-responsive">
              <!-- Projects table -->
              <table class="table align-items-center table-flush">
                <thead class="thead-light">
                  <tr align="center">
                    <th scope="col">이름</th>
                    <th scope="col">금액</th>
                  </tr>
                </thead>
                <tbody>

                    <c:forEach var="v" items="${topMember}" begin="0" end="5" varStatus="status">
                  <tr>
                    <th scope="row">
                      ${v.oId}
                    </th>
                    <td>
                      ${v.idTotalPrice}
                    </td>
                  </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
      <!-- Footer -->
      <footer class="footer"></footer>
    </div>
  </div>
  <!--   Core   -->
  <script src="./assets/js/plugins/jquery/dist/jquery.min.js"></script>
  <script src="./assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <!--   Optional JS   -->
  <script src="./assets/js/plugins/chart.js/dist/Chart.min.js"></script>
  <script src="./assets/js/plugins/chart.js/dist/Chart.extension.js"></script>
  <!--   Argon JS   -->
  <script src="./assets/js/argon-dashboard.js"></script>
  <script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
  <script>
    window.TrackJS &&
      TrackJS.install({
        token: "ee6fab19c5a04ac1a32a645abde4613a",
        application: "argon-dashboard-free"
      });
  </script>
</body>

</html>