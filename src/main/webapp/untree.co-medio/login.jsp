<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!-- 자동입력문자. -->
<%@ include file="./autoInsertMoonJa.jsp"%>
<!-- 자동입력문자 끝.-->
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- 이슬로그인유지쿠키확인요망 -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<meta name="author" content="Untree.co" />
<link rel="shortcut icon" href="favicon.png" />

<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap5" />

<link rel="icon" href="images/favicon.ico">
<link
   href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Roboto:wght@300;400&display=swap"
   rel="stylesheet" />

<link rel="stylesheet" href="fonts/icomoon/style.css" />
<link rel="stylesheet" href="fonts/feather/style.css" />

<link rel="stylesheet" href="css/tiny-slider.css" />
<link rel="stylesheet" href="css/aos.css" />
<link rel="stylesheet" href="css/glightbox.min.css" />
<link rel="stylesheet" href="css/style.css" />

<!--  자동입력방지 문자 시작.-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Imagetoolbar" content="no" />
<script type="text/javascript"
   src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<!-- 자동입력방지문자 끝. -->

<title>ACENSE</title>
<style type="text/css">
.loginkeeping {
   margin: 0;
   display: inline-block;
}

.align-items-center {
   padding-top: 0px !important;
}

.login-page {
   width: 650px;
   padding: 15% 0 0;
   margin: 0 auto 100px;
}

input, button {
   line-height: 25px !important;
}

.form {
   position: relative;
   z-index: 1;
   background: #ffffff4d;
   max-width: 700px;
   margin: 0 auto 100px;
   padding: 80px;
   text-align: center;
   box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
      rgba(0, 0, 0, 0.24);
}

.form input {
   font-family: "Roboto", sans-serif;
   outline: 0;
   background: #f2f2f2;
   width: 100%;
   border: 0;
   margin: 0 0 15px;
   padding: 15px;
   box-sizing: border-box;
   font-size: 17px;
}

.form button {
   font-family: "Roboto", sans-serif;
   text-transform: uppercase;
   outline: 0;
   background: #13121196;
   width: 100%;
   border: 0;
   padding: 15px;
   color: #ffffff;
   font-size: 17px;
   -webkit-transition: all 0.3 ease;
   transition: all 0.3 ease;
   cursor: pointer;
}

.form button:hover, .form button:active, .form button:focus {
   background: #b39ddbb0;
}

.form .message {
   margin: 15px 0 0;
   color: #462088;
   font-size: 20px;
}

.form .message a {
   color: black;
   text-decoration: none;
   font-weight: bold;
}

.form .message a:hover {
   color: #462088;
}

.forgot {
   color: black;
   margin: 15px;
   text-decoration-line: underline;
   font-size: 17px;
   text-align: right;
}

.loginkeeping {
   width: auto !important;
   margin-right: 10px !important;
}

.forgot a {
   color: black;
   font-weight: bold;
}

.forgot a:hover {
   color: #462088;
}

.img-bg rellax {
   display: flex;
}

.tl {
   text-align: left;
   color: black;
   font-weight: bold;
}

.message {
   color: white;
   font-weight: bold;
}

h4 {
   font-size: 26px;
   margin-bottom: 20px;
}

.img-fluid {
   position: fixed !important;
   width: 100vw;
   height: 110vh;
}
.cat img {
   position: unset;
   -webkit-transform: unset;
   -ms-transform: unset;
   transform: unset;
   width: 50%;
}
.answer {
   display: flex;
   justify-content: space-between;
}
.reLoad {
}
.soundOn {
}
</style>
</head>
<body>

   <%@ include file="./header.jsp"%>

   <div class="hero overlay">
   <img src="images/main.png" alt="Image" class="img-fluid">
      <div class="container">
         <div class="row align-items-center">
            <!-- 이 사이에 로그인 폼 -->
            <div class="login-page">
               <div class="form">
                  <div class="register">
                     <h4>
                        <strong>로그인</strong>
                     </h4>
                  </div>
                  <form action="login.do" class="login-form" id="login-form"
                     method="POST">
                     
                     <input type="text" placeholder="id" id="id" name="id"
                        value="${userId}" /> 
                        
                                       <input type="password"
                        placeholder="password" name="pw" id="pw"/>
                        
                     <!-- 자동입력방지 문자 시작. -->
                     <c:if test="${cnt>=3}">
                     <div class="cat">
                        <div id="catpcha"></div>
                        <div id="audiocatpch" style="display: none;"></div>
                        <div class="answer" style="margin: 15px 0 0 0;">
                        <input type="text" id="answer" name="answer" placeholder="정답을입력해주세요." style="width:73%; margin:0;" required/>
                        <button id="reLoad" type="button" style="width:12%; margin:0; padding:3px;">
                        <img src="./images/esulReload.png" alt="새로고침" style="filter: invert(70%)" />
                        </button>
                        <button id="soundOn" type="button" style="width:12%; margin:0; padding:3px;">
                        <img src="./images/esulVolumn.png" alt="소리듣기" style="filter: invert(70%)"/>
                        </button>
                        
                                 </div> 
                        <!-- 
                        <input type="button" id="frmSubmit" value="확인" />
                         -->
                     </div>
                       </c:if>
                     <!-- 자동입력방지문자 끝. -->
                     <div class="tl">
                        <label> <input class="loginkeeping" type="checkbox"
                           id="login-cookie" name="remeber" value="check" style="margin: 10px 0;"/>로그인상태유지
                        </label>
                     </div>
                     <div class="forgot">
                        Forgot <a href="forgot.jsp"> ID </a>/<a href="forgot2.jsp">
                           PW </a>
                     </div>
                     <button id="submit-login" type="button">login</button>
                     <div>
                        <a href="javascript:kakaoLogin();"><img
                           src="images/kakaobtn.png" alt="카카오계정 로그인"
                           style="height: 60px; width:100%; left: 93px; position: unset; transform: unset; margin-top: 20px;" /></a>
                     </div>
                     <div class="message">
                        Not registered? &nbsp; <a href="register.jsp">Create an
                           account</a>
                     </div>
                  </form>
                  <form action="join.do" method="POST">
                     <input type="hidden" name="name" value="param">
                  </form>
               </div>
            </div>
            <!-- /////////////////////////////  -->
         </div>
      </div>
   </div>
   <script>
    /*
    const $loginForm = document.getElementById("login-form");
    // 로그인 폼 태그
    const $loginCookie = document.getElementById("login-cookie");
    // 로그인상태유지
    const $id = document.getElementById("id");
    // 인풋 아이디
      
   $loginForm.addEventListener("submit", function(){
   // 로그인 폼이 서브밋 되었을 때
      if($loginCookie.checked){
      // 로그인상태유지가 체크되어있다면
         $.cookie(id.value , "true", { expires: 30 });
         // 쿠키생성(30일)
      }
      alert("로그인 성공");
   })
   */
   // 로그아웃 하면
   //<%-- $.removeCookie("<%=session.getAttribute("UserId")%>");--%>
    // 세션에 저장되어있는 아이디가 키값인 쿠키 삭제
    </script>
   <%-- 카카오 토~크 로그인  --%>
   <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
   <script>
        window.Kakao.init('201e2627789e3c826127d97f4d6d7252');

        function kakaoLogin() {
            window.Kakao.Auth.login({
               scope: 'profile_nickname,account_email', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
                success: function(response) {
                    window.Kakao.API.request({ // 사용자 정보 가져오기 
                       
                       url: '/v2/user/me',
                        success: (res) => {                           
                            const kakao_account = res.kakao_account;
                            //console.log(kakao_account)                        
                            //console.log(kakao_account.email)
                            //console.log(kakao_account.profile.nickname)                            
                            //회원가입 컨트롤로 보냄
                            post_to_url('join.do', {'id':kakao_account.email,'name':kakao_account.profile.nickname});
                        }
                    });
                },
                fail: function(error) {
                    console.log(error);
                }
            });
        }
   
        <%-- 카카오 토~크 로그아웃--%>
        window.Kakao.init('201e2627789e3c826127d97f4d6d7252');
       function kakaoLogout() {
           if (!Kakao.Auth.getAccessToken()) {
              console.log('Not logged in.');
              return;
           }
           Kakao.Auth.logout(function(response) {
              alert(response +' logout');
             // window.location.href='/'
           });
    };
      
    function post_to_url(path, params, method) {
        method = method || "post";
        var form = document.createElement("form");
        form.setAttribute("method", method);
        form.setAttribute("action", path);
        for(var key in params) {
            var hiddenField = document.createElement("input");
            hiddenField.setAttribute("type", "hidden");
            hiddenField.setAttribute("name", key);
            hiddenField.setAttribute("value", params[key]);
            form.appendChild(hiddenField);
        }
        document.body.appendChild(form);
        form.submit();
    }
    </script>
   <script type="text/javascript">

var rand;

 

//캡차 오디오 요청

function audioCaptcha() {

        $.ajax({

               url: 'captcha/CaptChaAudio.jsp',

               type: 'POST',

               dataType: 'text',

               data: 'rand=' + rand + '&ans=y',

               async: false,         

               success: function(resp) {

                       var uAgent = navigator.userAgent;

                       var soundUrl = 'captcha/CaptChaAudio.jsp?rand=' + resp + '&ans=' + resp;

                       //console.log(soundUrl);

                       if (uAgent.indexOf('Trident') > -1 || uAgent.indexOf('MSIE') > -1) {

                              winPlayer(soundUrl+'&agent=msie');

                       } else if (!!document.createElement('audio').canPlayType) {

                              try { new Audio(soundUrl).play(); } catch(e) { winPlayer(soundUrl); }

                       } else window.open(soundUrl, '', 'width=1,height=1');

               }

        });

}

function winPlayer(objUrl) {

        $('#audiocatpch').html(' <bgsound src="' + objUrl + '">');

}

 

//캡차 이미지 요청 (캐쉬문제로 인해 이미지가 변경되지 않을수있으므로 요청시마다 랜덤숫자를 생성하여 요청)

function changeCaptcha() {

        rand = Math.random();

        $('#catpcha').html('<img src="<%=ctx%>/untree.co-medio/captcha/CaptChaImg.jsp?rand=' + rand + '"/>');

}


$(document).ready(function() {

       

        changeCaptcha(); //캡차 이미지 요청

       

        $('#reLoad').click(function(){ changeCaptcha(); }); //새로고침버튼에 클릭이벤트 등록

        $('#soundOn').click(function(){ audioCaptcha(); });  //음성듣기버튼에 클릭이벤트 등록

       

        //확인 버튼 클릭시

        $('#submit-login').click(function(){
        	if( $('#id').val()=="" || $('#pw').val()=="") {
        		alert("정보를 입력해주세요");
        	}
        	else if( $('#answer').val()!=null ) {
               if ( !$('#answer').val() ) {
                       alert('이미지에 보이는 숫자 또는 스피커를 통해 들리는 숫자를 입력해 주세요.');

               } else {

                       $.ajax({

                              url: 'captcha/captchaSubmit.jsp',

                              type: 'POST',

                              dataType: 'text',

                              data: 'answer=' + $('#answer').val(),

                              async: false,         

                              success: function(resp) {

                                      if(resp=="입력값이 일치하지 않습니다."){

                                          $('#answer').val('');
                                          $('#pw').val('');
                                    	  alert(resp);
                                          $('#reLoad').click();
                                      }
                                      else{
                                    	  console.log("으ㅏ아ㅏㄱ악");
                                    	  $('#login-form').submit();
                                      }

                              }

                       });

               }
        	}
        	else{
        			$('#login-form').submit();
        	}

        });

});

</script>
<script>
if(${userId!=null}){
	alert("입력정보를 확인해주세요.");
}
</script>
   <script src="js/tiny-slider.js"></script>
   <script src="js/aos.js"></script>
   <script src="js/navbar.js"></script>
   <!— 상품 오버레이 클릭시 나오는 모달창 임시 주석 —>
   <script src="js/glightbox.min.js"></script>
   <script src="js/rellax.min.js"></script>
   <script src="js/custom.js"></script>
</body>
</html>