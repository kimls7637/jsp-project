<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
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
<link rel="stylesheet" href="css/style.css" />

<title>ACENSE</title>
<style>
.esulFocus {
	color:white;
}
.esulFocus:focus {
	color:black;
}
#map {
   width: 100%;
}

@media ( max-width : 700px) {
   .esulMain {
      line-height: normal;
      font-size: 30px;
   }
   .esulMain2 {
      width: 400px;
      max-width: 400px;
   }
   .esulMain2 .esulFocus {
      width: 100%;
   }
}

.wrap {
   display: none;
   position: absolute;
   top: 40%;
   left: 15%;
   transform: translate(-50%, -50%);
   box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.5);
   overflow: hidden;
   z-index: 1000;
   background-color: #ffffff4f;
   border-radius: 1rem;
   box-shadow: 10px 10px 30px 0px black;
   padding: 10px;
}

.wrap img {
   max-width: 500px;
   max-height: 500px;
   border-radius: 1rem;
}

.header {
   padding: 5px;
   text-align: center;
   font-size: 14px;
   color: #333;
   background: transparent;
   cursor: default;
}

.header:hover {
   cursor: move;
}

.wrap img {
   max-width: 500px;
   max-height: 500px;
   border-radius: 1rem;
}

.wrap div {
   color: black;
   line-height: unset;
}

.wrap button {
   outline: 0;
   font-size: 15px !important;
   border: 0px;
   background-color: transparent;
   line-height: unset;
   font-size: 12px;
   margin: 0;
   border-radius: 10px;
   padding: 0 10px;
}

.lightImg-fluid {
   padding: 0;
}

.media-1 {
   margin-bottom: 0px;
}

.main-card {
   padding: 10px;
}

.main-card>a {
   width: 100%;
   height: 100%;
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

.site-navigation {
   display: flex;
   justify-content: space-between;
   align-items: center;
}

.site-navigation>a:last-child {
   margin: 0 !important;
}
</style>
</head>
<body>
   <div class="wrap" id="popup">
      <div class="header">Daily</div>
      <a id="popup-link" href="${popLink}" target="_blank"> <img
         src="./upload/${popImg}" />
      </a>
      <div
         style="display: flex; justify-content: space-between; padding-top: 10px;">
         <label style="display: flex; padding-left: 10px">일주일동안 보지 않기
            <input type="checkbox" id="pop-cookie" style="margin-left: 5px" />
         </label>
         <button class="modal-close" onClick="popClose()">✖</button>
      </div>
   </div>

   <%@ include file="./header.jsp"%>


   <div class="hero lightV-h-full overlay">
      <div class="img-bg rellax">
         <img src="images/main.png" alt="Image" class="lightImg-fluid" />
      </div>
      <div class="container"
         style="height: 100%; margin: 0; max-width: none" data-aos="fade-up"
         data-aos-delay="300">
         <div class="lightCol-lg-10 lightCol-xxl-6"
            style="height: 100%; display: flex; justify-content: center; flex-direction: column; align-items: center; padding-top: 0;">
            <p data-aos="fade-up" data-aos-delay="200"
               class="text-white lead mb-4" id="weather"></p>
            <h1 class="esulMain lightHeading-2 text-white">Special Enjoy
               Camping</h1>
             

            <div class="text-center esulMain2">
               <form action="search.do" method="post" class="esulRound">
                  <input type="text" name="pName" class="esulFocus" required
                     style="outline: 0" /> <br /> <span><input type="submit"
                     class="esulSearch" value="Go" /></span>
               </form>
            </div>
         </div>
      </div>
   </div>

   <div class="lightSection" style="padding-top: 7rem;">
      <div class="container">
         <div class="row" style="margin: 30px 0;">
            <div class="col-lg-4 pe-lg-5" data-aos="fade-up" style="padding-top: 3rem; padding-right:0px !important;"
               data-aos-delay="300">
               <span class="lightSubheading d-inline-block mb-2">2023
                  Special</span>
                  <p class="esulMain lightHeading-2" style="color:#3b3b3b; font-size:40px; height:15%; line-height:normal;">Recommendation of Camping Product</p>
            </div>
            <div class="col-lg-8">
               <div class="row">

                  <!-- 관리자추천상품(시작) -->
                  <div class="col-6 col-lg-6 main-card" data-aos="fade-up"
                     data-aos-delay="100">
                     <a href="productDetail.do?pNum=${worstProduct[0].oPNum}" class="media-1">
                        <img src="${worstProduct[0].oPImg}" alt="사장님추천상품1"
                        class="lightImg-fluid rounded" />
                        <div class="media-1-content">
                        <h2>${worstProduct[0].oPName}</h2> <span class="category">${worstProduct[0].oPPrice}₩</span>
                  </div>
                  </a>
               </div>

               <div class="col-6 col-lg-6 main-card" data-aos="fade-up"
                  data-aos-delay="200">
                  <a href="productDetail.do?pNum=${worstProduct[1].oPNum}" class="media-1">
                     <img src="${worstProduct[1].oPImg}" alt="사장님추천상품2"
                     class="lightImg-fluid rounded" />
                     <div class="media-1-content">
                        <h2>${worstProduct[1].oPName}</h2>
                        <span class="category">${worstProduct[1].oPPrice}₩</span>
                     </div>
                  </a>
               </div>
               <!-- 관리자추천상품(끝) -->

            </div>
         </div>
      </div>
   </div>
   </div>

   <div class="lightSection" style="padding-top: 7rem;">
      <div class="container">
         <div class="row justify-content-center mb-5"
            style="margin-bottom: 0 !important;">
            <div class="col-lg-6 text-center" data-aos="fade-up"
               data-aos-delay="100" >
               <span class="lightSubheading mb-2 d-inline-block">Awesome
                  product</span>
               <p class="esulMain lightHeading-2" style="color:#3b3b3b; font-size:40px; height:15%; line-height:normal;">Best of Best</p>
            </div>
         </div>

         <div class="row">
            <div class="container-fluid">
               <div class="row">

                  <!-- 베스트상품 포문(시작) -->
                  <c:forEach var="v" items="${bestProduct}" begin="0"
                     end="${bestProduct.size()}" varStatus="status">
                     <div class="col-md-6 col-lg-4 main-card" data-aos="fade-up"
                        data-aos-delay="400">
                        <a href="productDetail.do?pNum=${v.oPNum}" class="media-1" style="width:100%; height:100%"> <img
                           src="${v.oPImg}" alt="베스트상품${status.count}"
                           class="lightImg-fluid" style="width:100%; height:100%; object-fit:cover" />
                           <div class="media-1-content">
                              <h2>${v.oPName}</h2>
                              <span class="category">${v.oPPrice}₩</span>
                           </div>
                        </a>
                     </div>
                  </c:forEach>
                  <!-- 베스트상품 포문(끝) -->

               </div>
            </div>
         </div>
      </div>
   </div>

   <div class="section bg-light" style="background-color:white !important;">
      <div class="container">
         <div class="row mb-5">
            <div class="col-12 text-center" data-aos="fade-up"
               data-aos-delay="300">
               <p class="esulMain lightHeading-2" style="color:#3b3b3b; font-size:40px; height:15%; line-height:normal;">Location</p>

               <script
                  src="http://maps.google.com/maps/api/js?key=AIzaSyDz7QG2HLHCz5jmxspYwozGs_P7JFZqx1o&region=kr"></script>

               <div id="map" style="border-radius:3rem; border:2px solid #dbdbdb; height:500px;"></div>
               <script type="text/javascript">
                            var map;
                            function initMap() {
                                var ll = {
                                    lat: 37.5006,
                                    lng: 127.036268,
                                };
                                map = new google.maps.Map(
                                    document.getElementById("map"),
                                    {
                                        zoom: 17,
                                        center: ll,
                                    }
                                );

                                new google.maps.Marker({
                                    position: ll,
                                    map: map,
                                    label: "ACENSE",
                                });
                            }
                            initMap();

                            function cc1() {
                                var ll = {
                                    lat: 33.369515,
                                    lng: 126.564646,
                                };
                                map.panTo(ll);
                                map.setZoom(3);
                            }
                        </script>
            </div>
         </div>
      </div>
   </div>


   <script src="js/bootstrap.bundle.min.js"></script>
   <script src="js/tiny-slider.js"></script>
   <script src="js/aos.js"></script>
   <script src="js/navbar.js"></script>
   <script src="js/glightbox.min.js"></script>
   <script src="js/rellax.min.js"></script>
   <script src="js/custom.js"></script>
   <script>
		    if(${memberId==null}){
			      let cart = [];
			      localStorage.setItem("cart", JSON.stringify(cart));
			      console.log("로그인이 안되어있어서 장바구니 비움");
			}  
            const wrap = document.querySelector(".wrap");
            const header = document.querySelector(".header");
            const popCookie = document.querySelector("#pop-cookie");
            
            const weather = document.querySelector("#weather");
            function onGeoOk(pos) {
               
            const url = "https://api.openweathermap.org/data/2.5/weather?lat="+pos.coords.latitude+"&lon="+pos.coords.longitude+"&appid=795da5b8d034b147344420a8ee942d47&units=metric";
            
            fetch(url)
            .then((response) => response.json())
            .then(function(json){
               weather.innerHTML = "최저 " + json.main.temp_min + "°C /  최고 " + json.main.temp_max + "°C&nbsp;" +
                     "<img src='https://openweathermap.org/img/wn/"+json.weather[0].icon+"@2x.png' style='height:40px;'/>";
               console.log(json);
            })
            .catch((error) => 
               {console.log("error:", error)}
            );
            }
            
            function onGeoError() {
               alert("Can't find you. No weather for you.");
            }
            
            navigator.geolocation.getCurrentPosition(onGeoOk, onGeoError);
            
            
            
            
            let lastX = 0;
            let lastY = 0;
            let startX = 0;
            let startY = 0;

            header.addEventListener("mousedown", function (e) {
                e.preventDefault();
                startX = e.clientX;
                startY = e.clientY;

                document.addEventListener("mouseup", onRemoveEvent);

                document.addEventListener("mousemove", onMove);
            });

            function onRemoveEvent() {
                document.removeEventListener("mouseup", onRemoveEvent);
                document.removeEventListener("mousemove", onMove);
            }

            function onMove(e) {
                e.preventDefault();
                lastX = startX - e.clientX;
                lastY = startY - e.clientY;

                startX = e.clientX;
                startY = e.clientY;

                wrap.style.top = wrap.offsetTop - lastY + "px";
                wrap.style.left = wrap.offsetLeft - lastX + "px";
            }
            
         var setCookie = function(name, value, day) { // 쿠키 셋 하는 함수
            var date = new Date();
            date.setTime(date.getTime() + day*24*60*60*1000);
            document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
         };
         
            function popClose() { // 팝업창을 닫을 때 일주일동안 보지 않기가 체크되어있다면 쿠키를 세팅
               if(popCookie.checked){
                  setCookie("popClose", true, 7);
               }
                wrap.style.display = "none";
            }
            
         var getCookie = function(name) {
            var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
            return value? value : null;
         };
         var isPopClose = getCookie("popClose");
            
           if("<%=application.getAttribute("popImg")%>" != "null"){ // 어플리케이션에 팝업이 세팅되어있을때
                 if(isPopClose == null){ // 쿠키가 설정되어있지 않다면
               wrap.style.display = "unset";
            }
            else{ // 쿠키가 설정되어 있다면
               wrap.style.display = "none";
            }
           }
           
           
           var coo = getCookie("test");
           console.log(coo+"쿠키");
           
           
           
           
            
  </script>
   <%@ include file="./footer.jsp"%>
</body>
</html>