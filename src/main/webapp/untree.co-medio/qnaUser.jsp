<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  <!-- 이슬완료? -->
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
      rel="stylesheet"
    />

    <link rel="stylesheet" href="fonts/icomoon/style.css" />
    <link rel="stylesheet" href="fonts/feather/style2.css" />

    <link rel="stylesheet" href="css/tiny-slider.css" />
    <link rel="stylesheet" href="css/aos.css" />
    <link rel="stylesheet" href="css/glightbox.min.css" />
    <link rel="stylesheet" href="css/style22.css" />

<title>ACENSE</title>
<style>
   .v-h-full {
   height: auto;
}
   </style>
  </head>
  <body>
  
<%@ include file="./header.jsp"%>

    <div class="hero v-h-full overlay">
      <div class="img-bg rellax">
        <img src="images/main.png" alt="Imaged" class="img-fluid" />
      </div>
      <div class="container">
        <div class="row align-items-center v-h-full">
          <div class="col-lg-7 col-xxl-6 mx-auto text-center">
            <h1 class="heading-2 text-white mb-3" data-aos="fade-up">Q&A</h1>
            <p
              data-aos="fade-up"
              data-aos-delay="200"
              class="text-white lead mb-4"
            >
              궁금하신 점을 문의해주세요.
            </p>
          </div>
        </div>
      </div>
    </div>

    <div class="section section-contact m-md-5 px-md-5">
      <div class="container">
        <h2>무엇이 궁금 하신가요?</h2>
        <br>
        <form action="insertQnA.do" class="form-contact" method="post">
          <div class="row">
            <div class="col-lg-6">
              <div class="form-group">
                <input type="text" class="form-control" placeholder="제목" name="qTitle" required/>
              </div>
            </div>
          </div>

          <div class="col-lg-12">
            <div class="form-group">
              <textarea
                rows="10"
                cols="10"
                class="form-control"
                placeholder="내용"
                name="qContent"
                required
              ></textarea>
            </div>
          </div>

          <div class="col-lg-6">
            <input type="submit" class="btn btn-black" value="등록" />
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
  </body>
</html>