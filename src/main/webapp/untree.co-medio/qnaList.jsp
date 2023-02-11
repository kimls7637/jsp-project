<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="kim"%>

<!doctype html>
<html lang="en">
<head>
<!-- 이슬완료? -->
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta name="author" content="Untree.co">
<link rel="icon" href="images/favicon.ico">

<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap5" />

<link rel="preconnect" href="https://fonts.gstatic.com">
<link
   href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Roboto:wght@300;400&display=swap"
   rel="stylesheet">


<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" href="fonts/feather/style.css">

<link rel="stylesheet" href="css/tiny-slider.css">
<link rel="stylesheet" href="css/aos.css">
<link rel="stylesheet" href="css/glightbox.min.css">
<link rel="stylesheet" href="css/style2.css">

<title>ACENSE</title>
<style>
.v-h-full {
   height: auto;
}

.page-body-tag {
   display: flex;
   flex-direction: column;
   align-items: center;
}

.page-body-tag>div {
   width: 100%;
   max-width: 1500px;
   min-width: 700px;
}

.btncss {
   width: 150px;
   height: 100px;
   font-size: 30px;
   float: right;
}

.paging {
   width: 200px;
   height: 100px;
   font-size: 30px;
   float: center;
}

body {
   background-color: #efefef;
}

a:hover, a:focus {
  text-decoration: none;
  color: black !important;
}
</style>
</head>
<body>


      <%@ include file="./header.jsp"%>

   <div class="hero v-h-full overlay">
      <div class="img-bg rellax">
         <img src="images/main.png" alt="Image" class="img-fluid">
      </div>
      <div class="container">
         <div class="row align-items-center v-h-full">

            <div class="col-lg-7 col-xxl-6 mx-auto text-center">
               <h1 class="heading-2 text-white mb-3" data-aos="fade-up" style="opacity:1 !important;">Q&A</h1>

               <c:if test="${memberId!='admin'}">
                  <p data-aos="fade-up" data-aos-delay="200"
                     class="text-white lead mb-4">궁금하신점을 문의해주세요.</p>
               </c:if>

            </div>

         </div>
      </div>
   </div>



   <div class="page-body page-body-tag">
      <!-- //게시판 리스트 -->
      <div class="bbs-tit">
         <h3>Q&amp;A</h3>
      </div>

      <!-- 게시판 목록 -->
      <div class="bbs-table-list">
         <table summary="No, content,Name,Data,Hits">
            <caption>일반게시판 게시글</caption>
            <colgroup>
               <col width="70">
               <col width="35">
               <col width="*">
               <col width="110">
               <col width="110">
            </colgroup>
            <thead>
               <tr>
                  <th scope="col"><div class="tb-center">NO.</div></th>
                  <th scope="col"><div class="tb-center">&nbsp;</div></th>
                  <th scope="col"><div class="tb-center">CONTENT</div></th>
                  <th scope="col"><div class="tb-center">NAME</div></th>
                  <th scope="col"><div class="tb-center">DATE</div></th>
               </tr>
            </thead>
            <tbody>

            <c:if test="${qnaList.size()==0}">
               <tr>
                  <th colspan="5">
                     <h5 class="heading-2 text-white mb-5"
                        style="color: black !important; font-size: 40px; padding: 30px">NO QnA</h5>
                  </th>
               </tr>
            </c:if>

               <c:forEach var="v" items="${qnaList}" begin="0" end="${qnaList.size()}"
                  varStatus="status">
                  <tr>
                     <td><div class="tb-center">${status.count}</div></td>
                     <td><div class="tb-left">
                     <c:if test="${memberId!='admin'}">
                           <img src="images/qn.png">
                           <!-- 자물쇠 -->
                           </c:if>
                        </div></td>
                     <td>
                        <div class="tb-left">
                        <a href="javascript:qnaDetail('${v.qId}','${v.qNum}', '${memberId}')">${v.qTitle}</a>
                           <!-- 누르면 자바스크립트 qnaDetail실행해 인자로 아이디랑 pk번호 줄거야 -->
                           <c:if test="${v.qReply!=null}">
                           (1)
                           </c:if>
                        </div>
                     </td>
                     <td>
                        <div class="tb-center">${v.qStarId}</div>
                     </td>
                     <td><div class="tb-center">${v.qDate}</div></td>
                  </tr> 
               </c:forEach>
               
               
            </tbody>
         </table>
      </div>
      <!-- //게시판 목록 -->

      <!-- 하단 페이징 & 버튼 -->
      <kim:loginCheck></kim:loginCheck>
   </div>

   <!-- //하단 페이징 & 버튼 -->
   <script src="js/bootstrap.bundle.min.js"></script>
   <script src="js/tiny-slider.js"></script>
   <script src="js/aos.js"></script>
   <script src="js/navbar.js"></script>
   <script src="js/glightbox.min.js"></script>
   <script src="js/rellax.min.js"></script>
   <script>
   
            function qnaDetail(qId, qNum, mId){
              if('admin' != mId && mId != qId){
              // 어드민이 아니고 작성자도 아니면
                 alert("본인만 볼 수 있습니다.");
                 return;
                 // 돌아가
              }
               location.href="qna.do?qNum="+qNum;
               // 상세페이지로 보내줘 pk 보내줄게
            }
            
   </script>
        
        
   <%@ include file="./footer.jsp"%>
</body>
</html>