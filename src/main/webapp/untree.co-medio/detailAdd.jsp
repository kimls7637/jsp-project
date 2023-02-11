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
</head>
<style>
.preview-container img {
   max-height: 500px;
   max-width: 500px;
}

@media ( min-width : 768px) {
   .navbar-vertical .navbar-collapse:before {
      content: '';
      display: block;
      margin: 0;
   }
}

.btn-primary {
   background-color: #2935a5;
   border: 0;
}

.bg-gradient-primary {
   background: linear-gradient(360deg, #2935a5 0, #d3e0ff 100%) !important
}

.pl-lg-4 {
   padding-right: 1.5rem !important;
}
</style>

<body class="">


   <%@ include file="./nav-menu.jsp"%>

   <div class="main-content">

      <div
         class="header pb-8 pt-5 pt-lg-8 d-flex align-items-center bg-gradient-primary"
         style="min-height: 200px; background-size: cover; background-position: center top;">
      </div>
      <!-- Page content -->
      <div class="container-fluid mt--7">
         <div class="row">

            <div class="col-xl-8 order-xl-1" style="flex: 0%; max-width: 100%;">
               <form action="insertProduct.do" id="add-form" enctype="multipart/form-data" method="post">
                  <div class="card bg-secondary shadow">
                     <div class="card-header bg-white border-0">
                        <div class="row align-items-center">
                           <div class="col-8">
                              <h3 class="mb-0">상품 상세</h3>
                           </div>
                           <div class="col-4 text-right">
                              <button class="btn btn-sm btn-primary">추가</button>
                           </div>
                        </div>
                     </div>
                     <div class="card-body">

                        <div class="pl-lg-4">
                           <div class="row">
                              <div style="width: 100%;">
                                 <div class="form-group" id="detail-form">
                                    <label class="form-control-label" for="input-username">상품
                                       이름</label> <input type="text" id="input-username" name="pName"
                                       class="form-control form-control-alternative" required />
                                 </div>
                              </div>
                              <div style="width: 100%;">
                                 <div class="form-group">
                                    <label class="form-control-label" for="input-email">상품
                                       가격 <small>(₩)</small>
                                    </label> <input type="number" min="1000" id="input-email" name="pPrice"
                                       class="form-control form-control-alternative" required />
                                 </div>
                              </div>
                           </div>
                           <div class="row">
                              <div style="width: 100%;">
                                 <div class="form-group">
                                    <label class="form-control-label" for="input-first-name">상품
                                       재고 <small>(개)</small>
                                    </label> <input type="number" min="1" max="50" id="input-first-name" name="pCnt"
                                       class="form-control form-control-alternative" required />
                                 </div>
                              </div>
                           </div>
                           
                           <div class="row">
                              <div style="width: 100%;">
                                 <div class="form-group">
                                    <label class="form-control-label" for="input-first-name">카테고리
                                    </label> <input type="text" name="pCate" style="background-color:white;"
                                       class="form-control form-control-alternative" value="${param.cate}" readonly />
                                 </div>
                              </div>
                           </div>
                           
                           <div class="row">
                              <div style="width: 100%;">
                                 <div class="form-group">
                                    <label class="form-control-label" for="input-file">상품
                                       사진</label> <br> <label for="input-file"
                                       class="btn btn-sm btn-primary">사진첨부</label> <input
                                       name="pImg"
                                       type="file" id="input-file"
                                       class="form-control form-control-alternative"
                                       placeholder="First name" style="display: none"
                                       accept="image/gif, image/jpeg, image/png, image/jpg" />
                                 </div>
                              </div>
                              <div class="row" style="margin: 0;">
                                 <div style="width: 100%;">
                                    <div class="form-group">
                                       <label class="form-control-label" for="input-first-name">미리보기</label>
                                       <div class="preview-container">
                                          <img src="" alt="" id="preview">
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>


                        </div>

                     </div>
                  </div>
               </form>
            </div>
         </div>
         <!-- Footer -->
         <footer class="footer"></footer>
      </div>
   </div>
   <!--   Core   -->
   <script src="./assets/js/plugins/jquery/dist/jquery.min.js"></script>
   <script
      src="./assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
   <!--   Optional JS   -->
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
   <script>
           const $addForm = document.getElementById("add-form");
            const $fileInput = document.getElementById("input-file");
            const $preview = document.getElementById("preview");
            let flag = false;

            $fileInput.addEventListener("change", function(){
               try{
                   const files = this.files;
   
                   if(files && files[0]){
                      const fileName = this.value.split(".");
                      
                      if(fileName.length > 1 ){
                         const ex = fileName.at(-1);
                         
                         if(ex == "jpg" || ex == "jpeg" || ex == "png" || ex == "gif"){
                            flag = true;
                         }else{
                            alert("사진만 첨부해주세요.");
                            flag = false;
                            return;
                         }
                      }
                      
                       const reader = new FileReader();
                       reader.onload = function(e){
                           $preview.src = e.target.result;
                       }
   
                       reader.readAsDataURL(files[0]);
                   }else{
                       $preview.src = "";
                   }
               }catch(error){
                  flag = false;
               }
            })
            
            $addForm.addEventListener("submit", function(event){
               if(!flag){
                  alert("사진은 필수입니다.");
                  event.preventDefault();
               }else{
                  alert("상품 추가 성공");   
               }
            });
        </script>
</body>
</html>