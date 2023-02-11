<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- 이슬 인증API추가요망 -->
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
<style type="text/css">
.img-fluid {
   position: fixed !important;
   width: 100vw;
   height: 110vh;
}

.guard {
   text-align: left;
   color: red;
   font-size: 13px;
   line-height: 2rem;
   transition: all 1s;
   font-weight: bold;
}

#dd:valid+.guard {
   color: white !important;
}

#input-password:valid+.guard {
   color: white !important;
}

#pp:valid+button {
   color: white !important;
   pointer-events: auto !important;
}

.ii {
   margin: 15px 0 0 0 !important;
}

.align-items-center {
   padding-top: 0px !important;
}

.login-page {
   width: 1500px;
   padding: 15% 0 0;
   margin: 0 auto 100px;
}

.a-page {
   padding: 25% 0 0;
   margin: 0 auto 100px;
}

.form {
   display: flex; /* 화면비율맞춰주는 */
   position: relative;
   z-index: 1;
   background: #ffffff4d;
   max-width: 700px;
   margin: 0 auto 100px;
   padding: 45px;
   text-align: center;
   box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
      rgba(0, 0, 0, 0.24);
}

@media ( max-width : 992px) {
   .form {
      flex-direction: column;
   }
   .login-page {
      padding: 20% 0 0;
   }
}

input, button {
   line-height: 25px !important;
}

button {
   margin-bottom: 0px !important;
}

.form input {
   margin: 0 0 15px;
   font-family: "Roboto", sans-serif;
   outline: 0;
   background: #f2f2f2;
   width: 100%;
   border: 0;
   padding: 15px;
   box-sizing: border-box;
   font-size: 17px;
}

button {
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
   background: #b39ddb9c;
}

.form .message {
   margin: 15px 0 0;
   color: #b3b3b3;
   font-size: 20px;
}

.form .message a {
   color: #e91e63;
   text-decoration: none;
   font-weight: bold;
}

.forgot {
   margin: 15px;
   text-decoration-line: underline;
   font-size: 17px;
}

.form div {
   /* float: left; */
   
}

.id-form, .pw-form {
   margin: 50px;
}

.pw-form button {
   margin-bottom: 15px;
}

.id-form button {
   
}

fieldset .id {
   
}

fieldset .pw {
   
}

.idfind, .pwfind, .pwtext, .pwagain {
   color: black;
   font-weight: bold;
}

legend {
   margin-bottom: 15px;
}

.pwtext {
   font-weight: bold;
   font-size: 20px;
   margin: 10px 0px 10px 0px;
}

.ag {
   margin-bottom: 5px !important;
}

.okk {
   margin: 30px 0px 0px 0px;
}

.pwagain {
   text-align: left;
}
</style>
</head>
<body>

   <%@ include file="./header.jsp"%>

   <!-- div 클래스에 v-h-full 먹혀있는데 height:100vh; (100vh : 브라우저화면길이의100%) 여서 짤렸나봐요 ㅇㅅㅇ -->
   <div class="hero overlay">
      <div class="img-bg rellax img-fluid">
         <img src="images/main.png" alt="Image" class="img-fluid" />
      </div>
      <div class="container">
         <div class="row align-items-center">
            <!-- 이 사이에 아이디버번찾기 폼 -->
            <div class="a-page">
               <div class="form">
                  <div style="width: 100%">
                     <form action="searchId.do" class="pw-form" id="find-form" method="post" onsubmit="checkSubmit(event);">
                        <fieldset class="pw">
                           <div class="pwfind"
                              style="font-size: 25px; padding-bottom: 30px">아이디 찾기</div>
                           <div style="display: flex">
                              <input style="width: calc(70% - 10px); margin-right: 10px;"
                                 id="pp" class="userPhoneNum" type="tel" name="phone"
                                 placeholder="phone number"
                                 pattern="[0-9]{3,3}-[0-9]{4,4}-[0-9]{4,4}" maxlength="13"
                                 required />
                              <button type="button" onclick="sms()" id="ppBtn" style="width: 30%; height: 55px;">인증번호
                                 받기</button>
                           </div>
                           <div style="display: flex;">
                              <input style="width: calc(70% - 10px); margin-right: 10px;"
                                 type="text" placeholder="인증번호를 입력하세요" id="userCheck" maxlength="5" required>
                              <button type="button" id="chkBtn" style="width: 30%; height: 55px;" onclick="smsCheck()">인증번호
                                 확인</button>
                           </div>

                           <button class="okk" type="submit">✔ OK</button>
                        </fieldset>
                     </form>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <script>
          /*   const $findForm = document.getElementById("find-form");

            $findForm.addEventListener("submit", function (e) {
                alert("이메일 전송 완료");
            }); */

             const $inputPhone = document.getElementById("pp");
            const $checkPhone = document.getElementById("userCheck");
            let phFlag=false;
      
            document.getElementById("ppBtn").style.color = "gray";
            document.getElementById("ppBtn").style.pointerEvents = "none";
            document.getElementById("chkBtn").style.color = "gray";
            document.getElementById("chkBtn").style.pointerEvents = "none";
            
      $inputPhone.addEventListener("input", function(event){
         phFlag=false;
         this.value = this.value.replace(/[^0-9]/g, '') // 숫자를 제외한 모든 문자 제거
         this.value = this.value.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
         if (this.value.length == this.maxLength){
             document.getElementById("ppBtn").style.pointerEvents = "unset";
             document.getElementById("ppBtn").style.color = "white";
         }else{
            document.getElementById("ppBtn").style.pointerEvents = "none";
          document.getElementById("ppBtn").style.color = "gray";
         }
      });
      
      $checkPhone.addEventListener("input", function(event){
         phFlag=false;
          this.value = this.value.replace(/[^0-9]/g, '') // 숫자를 제외한 모든 문자 제거
          this.value = this.value.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
            document.getElementById("chkBtn").style.pointerEvents = "none";
             document.getElementById("chkBtn").style.color = "gray";
          if (this.value.length == this.maxLength){
             if(flag){
                  document.getElementById("chkBtn").style.pointerEvents = "unset";
                  document.getElementById("chkBtn").style.color = "white";
             }
          }
       });
      
     
      function checkSubmit(event){
      if(!phFlag){
          alert("인증번호를 확인해주세요");
             event.preventDefault();
      }
      }
   
      
      
        </script>
   <script src="https://code.jquery.com/jquery-3.6.3.min.js"
      integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
      crossorigin="anonymous"></script>
   <script type="text/javascript">
      var number=0;  //랜덤문자인증번호 저장할 변수   
      var phoneCheck=0;  //인증번호 일치, 불일치 변수
       let flag = false;
   
      //인증번호 전송하기: sms()
       function sms(){  
          console.log('로그 1 : sms()라는 JS 함수가 연결되었음');
          var userPhoneNum = $(".userPhoneNum").val();
          console.log('로그2 : userPhoneNum '+userPhoneNum);
          
          //Sms서블릿클래스로 이동함.
          $.ajax({
             type: 'POST',
             url: 'Sms',
             data: {userPhoneNum:userPhoneNum},
             success: function(randNum){
                console.log("로그:인증번호["+randNum+"]")
                if(randNum != null){
                   alert("인증번호 전송이 완료되었습니다!");
                   number = randNum;   //랜덤문자인증번호
                   flag=true;
                       if ($checkPhone.value.length == $checkPhone.maxLength){
                          if(flag){
                               document.getElementById("chkBtn").style.pointerEvents = "unset";
                               document.getElementById("chkBtn").style.color = "white";
                          }
                       }
                } 
                else{
                   alert("인증번호 전송이 불가합니다..");
                   flag=false;
                }
                
             }
          })
          
       }
       
     //인증번호 비교: sms()
       function smsCheck(){
          console.log('로그 : smsCheck()라는 JS 함수가 연결되었음');
          var checkNum = $("#userCheck").val();
          console.log('로그(사용자가 입력한 값) : checkNum '+checkNum);
          
          //SmsCheck서블릿클래스로 이동
          $.ajax({
             type: 'POST',
             url: 'SmsCheck',
             data: {randNum:number, checkNum:checkNum},
             success: function(result){
                console.log("로그 result:["+result+"]")
                console.log(typeof result);
                if(result == "1"){
                   alert("인증번호가 일치합니다!");
                   phFlag=true;
                //   phoneCheck = 1;  //인증번호 일치
                //   console.log("로그:["+phoneCheck+"]");
                
                } 
                else{
                   alert("인증번호가 일치하지 않습니다.다시 입력하세요!");  //인증번호 불일치
                   phFlag=false;
                }
                
             }
          })

          
          
       }
       
   </script>
   <script src="js/bootstrap.bundle.min.js"></script>
   <script src="js/tiny-slider.js"></script>
   <script src="js/aos.js"></script>
   <script src="js/navbar.js"></script>
   <script src="js/glightbox.min.js"></script>
   <script src="js/rellax.min.js"></script>
   <script src="js/custom.js"></script>
</body>
</html>