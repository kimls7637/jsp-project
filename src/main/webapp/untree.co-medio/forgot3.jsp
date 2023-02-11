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

.hero.overlay {
	position: unset;
}
</style>
</head>
<body>

	<%@ include file="./header.jsp"%>

	<div class="hero overlay">
		<div class="img-bg rellax img-fluid">
			<img src="images/main.png" alt="Image" class="img-fluid" />
		</div>
		<div class="container">
			<div class="row align-items-center">
				<!-- 이 사이에 아이디버번찾기 폼 -->
				<div class="a-page">
					<div class="form">
						<div style="width: 100%; padding: 45px;">
							<fieldset class="pw">
								<div class="pwfind">
									<c:if test="${searchPw == null}">
										<legend>아이디</legend>
									</c:if>
									<c:if test="${searchPw != null}">
										<legend>비밀번호 변경</legend>
									</c:if>

								</div>
								<c:if test="${searchId != null }">
								<input type="text" name="id" value="${searchId}" readonly />
</c:if>
								<c:if test="${searchPw == null}">
								<c:if test="${searchId == null }">
								<input type="text" name="id" value="아이디가 없습니다." readonly />
								</c:if>
								<c:if test="${searchId != null }">
									<div style="display: flex; justify-content: space-between;">
										<a href="login.jsp" style="width: 49%;"><button
												class="okk" type="button">로그인</button></a> <a
											href="searchPw.do?id=${searchId}&phone=${phone}"
											style="width: 49%;"><button class="okk" type="button">비밀번호
												변경</button></a>
									</div>
									</c:if>
								</c:if>
								<c:if test="${searchPw != null}">
									<form action="updateMem.do">
										<input type="hidden" name="id" value="${searchId}" /> <input
											id="input-password" name="pw" type="password"
											placeholder="password"
											pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$"
											maxlength="16" required style="margin: 35px 0 0 0;" />
										<p class="guard">pw는 특수문자를 제외한 8~16자의 알파벳, 숫자를 사용하세요.</p>

										<input id="confirm-password" type="password"
											placeholder="password confirm" maxlength="16" required
											style="margin: 0;" />
										<p class="guard" id="result-password">pw가 일치하지 않습니다.</p>
										<button type="submit" style="color: white">변경하기</button>
									</form>
								</c:if>
							</fieldset>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.3.min.js"
		integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
		crossorigin="anonymous"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/tiny-slider.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/navbar.js"></script>
	<script src="js/glightbox.min.js"></script>
	<script src="js/rellax.min.js"></script>
	<script src="js/custom.js"></script>
	<script>
    const $inputPassword = document.getElementById("input-password");
    const $confirmPassword = document.getElementById("confirm-password");
    const $resultPassword = document.getElementById("result-password");
    
    $confirmPassword.addEventListener("input", function(){
       if(this.value == $inputPassword.value){
          $resultPassword.innerText = "pw가 일치합니다";
          $resultPassword.style.color = "white";
       }
       else{
          $resultPassword.innerText = "pw가 일치하지 않습니다";
          $resultPassword.style.color = "red";
       }
    })
    
          $inputPassword.addEventListener("input", function(){
       if(this.value == $confirmPassword.value){
          $resultPassword.innerText = "pw가 일치합니다";
          $resultPassword.style.color = "white";
       }
       else{
          $resultPassword.innerText = "pw가 일치하지 않습니다";
          $resultPassword.style.color = "red";
       }
    })
	</script>
</body>
</html>
