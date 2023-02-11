<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- 이슬완료? -->
<!-- Required meta tags -->
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
<link rel="stylesheet" href="css/style22.css" />

<title>ACENSE</title>
<style>
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

.v-h-full {
   height: auto;
}

.page-body-tag {
   margin: 0 300px;
   min-width: 700px;
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
               <h1 class="heading-2 text-white mb-3" data-aos="fade-up">Q&A</h1>
            </div>
         </div>
      </div>
   </div>


   <c:if test="${memberId!='admin'}">
      <div class="section section-contact m-md-5 px-md-5">
         <div class="container">
            <form action="#" class="form-contact" method="post">
               <div class="row">
                  <div class="col-lg-6">
                     <div class="form-group">
                        <input type="text" spellcheck="false" class="form-control"
                           placeholder="제목" value="${QnA.qTitle}" required />
                     </div>
                     <div class="form-group">
                        <input type="text" spellcheck="false" class="form-control"
                           placeholder="작성자" value="${QnA.qStarId}" readonly />
                     </div>
                  </div>
               </div>

               <div class="col-lg-12">
                  <div class="form-group">
                     <textarea spellcheck="false" rows="10" cols="10"
                        class="form-control" placeholder="내용" required>${QnA.qContent}</textarea>
                  </div>
               </div>

               <c:if test="${QnA.qReply!=null}">
                  <div class="col-lg-12">
                     <div class="form-group">
                        <textarea spellcheck="false" rows="10" cols="10"
                           class="form-control" placeholder="답변" readonly>${QnA.qReply}</textarea>
                     </div>
                  </div>
               </c:if>


               <div class="col-lg-6">
                  <a href="deleteQnA.do?qNum=${QnA.qNum}">
                     <button type="button" class="btn btn-black">삭제</button>
                  </a>
               </div>

            </form>
         </div>
      </div>
   </c:if>

   <c:if test="${memberId=='admin'}">
      <div class="section section-contact m-md-5 px-md-5">
         <div class="container">
            <form action="updateReview.do?qNum=${QnA.qNum}" class="form-contact" method="post">
               <div class="row">
                  <div class="col-lg-6">
                     <div class="form-group">
                        <input type="text" spellcheck="false" class="form-control"
                           placeholder="제목" value="${QnA.qTitle}" readonly />
                     </div>
                     <div class="form-group">
                        <input type="text" spellcheck="false" class="form-control"
                           placeholder="작성자" value="${QnA.qStarId}" readonly />
                     </div>
                  </div>
               </div>

               <div class="col-lg-12">
                  <div class="form-group">
                     <textarea spellcheck="false" rows="10" cols="10"
                        class="form-control" placeholder="내용" readonly>${QnA.qContent}</textarea>
                  </div>
               </div>

               <div class="col-lg-12">
                  <div class="form-group">
                     <textarea spellcheck="false" rows="10" cols="10"
                        class="form-control" placeholder="답변" name="qReply"required>${QnA.qReply}</textarea>
                  </div>
               </div>


               <div class="col-lg-6">
                  <c:if test="${QnA.qReply!=null}">
                        <button type="submit" class="btn btn-black">수정</button>
                     <a href="updateReview.do?qNum=${QnA.qNum}">
                     <button type="button" class="btn btn-black">삭제</button>
                  </a>
                  </c:if>

                  <c:if test="${QnA.qReply==null}">
                        <button type="submit" class="btn btn-black">추가</button>
                  </c:if>
               </div>

            </form>
         </div>
      </div>
   </c:if>


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