<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- /*
* Template Name: Medio
* Template Author: Untree.co
* Tempalte URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
<!DOCTYPE html>
<html lang="en">
<head>
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
fieldset label {
   cursor: pointer;
}
#myform label {
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #ffffff;
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

.v-h-full {
   height: auto;
}

.page-body-tag {
   margin: 0 300px;
   min-width: 700px;
}
.m-md-5 {
    margin: 3rem !important;
    }
#rr {
    background-color: #efefef;
    z-index: 9;
    position: relative;
    margin-top: -100px !important; 
    padding-top: 7rem;
    padding-bottom: 7rem;
    font-family: "Roboto", sans-serif;
    font-weight: 900;
    overflow-x: hidden;
    font-size: 16px;
}
#myform fieldset {
   display: inline-block;
   direction: rtl;
   border: 0;
}

#myform fieldset legend {
   text-align: right;
}

#myform input[type=radio] {
   display: none;
}

#myform label:hover {
   text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#myform label:hover ~ label {
   text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#myform input[type=radio]:checked ~ label {
   text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
   
}

#reviewContents {
   width: 100%;
   height: 300px;
   padding: 30px;
   box-sizing: border-box;
   border: solid 1.5px #D3D3D3;
   border-radius: 5px;
   font-size: 16px;
   resize: none;
}
.form-control:focus {
    box-shadow: 0 0 0 0.25rem rgb(122 122 122 / 25%);
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
               <h1 class="heading-2 text-white mb-3" data-aos="fade-up">
                  REVIEW</h1>
               <p data-aos="fade-up" data-aos-delay="200"
                  class="text-white lead mb-4">리뷰작성과 별점을 선택해주세요.</p>
            </div>
         </div>
      </div>
   </div>
   <div style="display: flex; justify-content: center;">
   <div style="width:60%;" id="rr" class="m-md-5">
   <form action="insertReview.do" class="mb-3" name="myform" id="myform" style="padding: 0 50px"
      method="POST">
      <fieldset>
      <input type="hidden" name="pNum" value="${param.pNum}" />
         <input type="radio" name="rating" value="5" id="rate1" checked><label for="rate1">★</label>
         <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">★</label> 
         <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">★</label> 
         <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">★</label>
         <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">★</label>
      </fieldset>
      <div>
         <textarea class="col-auto form-control" type="text" name="content"
            id="reviewContents"
            placeholder="리뷰를 남겨주세요" required></textarea>
      </div>
      <div style="display: flex; justify-content: flex-end;">
      <input style="margin-top:10px;" type="submit" class="btn btn-black" value="등록" />
      </div>
   </form>
</div>
</div>

   <script src="js/bootstrap.bundle.min.js"></script>
   <script src="js/tiny-slider.js"></script>
   <script src="js/aos.js"></script>
   <script src="js/navbar.js"></script>
   <script src="js/glightbox.min.js"></script>
   <script src="js/rellax.min.js"></script>
   <script src="js/custom.js"></script>
   <%@ include file="./footer.jsp"%>

   <script>
            function msgupdate() {
                alert("정상적으로 수정 했습니다!");
            }
            function msgdelete() {
                alert("정상적으로 삭제 했습니다!");
            }
        </script>
</body>
</html>