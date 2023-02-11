<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- 이슬완료? -->
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

<style>
.btn-primary {
	backgroundACENSE-color: #2935a5;
	border: 0;
}

@media ( min-width : 768px) {
	.navbar-vertical .navbar-collapse:before {
		content: '';
		display: block;
		margin: 0;
	}
}

.bg-gradient-primary {
	background: linear-gradient(360deg, #2935a5 0, #d3e0ff 100%) !important
}

.preview-container img {
	max-height: 500px;
	max-width: 500px;
}
</style>
</head>

<body class="">
	<%@ include file="./nav-menu.jsp"%>

	<div class="main-content">
		<div class="main-content">
			<div class="header bg-gradient-primary pb-8 pt-5 pt-md-8"></div>

			<div class="container-fluid mt--7">
				<div class="row">
					<form action="insertPopup.do" style="width: 100%;" id="add-form"
						method="post" enctype="multipart/form-data">
						<div class="col-xl-8 order-xl-1"
							style="flex: 0%; max-width: 100%;">
							<div class="card bg-secondary shadow">
								<div class="card-header bg-white border-0">
									<div class="row align-items-center">
										<div class="col-8" style="flex: 0 0 70%; max-width: none;">
											<h3 class="mb-0">팝업 설정</h3>
										</div>
										<div class="col-4 text-right" style="flex: 0 0 30%;">
											<!-- 팝업창이 이미 있으면 추가를 변경으로 바꿀거에요 -->
											<c:if test="${popLink==null}">
												<button class="btn btn-sm btn-primary">추가</button>
											</c:if>
											<c:if test="${popLink!=null}">
												<button class="btn btn-sm btn-primary">변경</button>
											</c:if>
											<a href="deletePopup.do" class="btn btn-sm btn-primary"
												id="popup-delete">삭제</a>
										</div>
										<div class="col-4 text-right"></div>
									</div>
								</div>


								<div class="card-body">
									<div class="row" style="margin: 0;">
										<div style="width: 100%;">
											<div class="form-group">
												<label class="form-control-label" for="input-first-name">팝업
													링크</label> <input type="text"
													class="form-control form-control-alternative"
													placeholder="Link" id="input-link" name="popLink"
													value="${popLink}" required />
											</div>
										</div>
									</div>
									<div class="row" style="margin: 0;">
										<div style="width: 100%;">
											<div class="form-group">
												<label class="form-control-label" for="input-file">팝업
													사진</label> <br> <label for="input-file"
													class="btn btn-sm btn-primary">사진첨부</label> <input
													type="file" id="input-file"
													class="form-control form-control-alternative"
													style="display: none;"
													accept="image/gif, image/jpeg, image/png, image/jpg"
													name="popImg"/>
											</div>
										</div>
									</div>
									<div class="row" style="margin: 0;">
										<div style="width: 100%;">
											<div class="form-group">
												<label class="form-control-label" for="input-first-name">미리보기</label>

												<div class="preview-container">
													<a href="#" target="_self" id="preview-link"> <img
														src="./upload/${popImg}" alt="" id="preview-img">
													</a>
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
		</div>

	</div>
	<!--   Core   -->
	<script src="./assets/js/plugins/jquery/dist/jquery.min.js"></script>
	<script
		src="./assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!--   Optional JS   -->
	<script src="./assets/js/plugins/chart.js/dist/Chart.min.js"></script>
	<script src="./assets/js/plugins/chart.js/dist/Chart.extension.js"></script>
	<!--   Argon JS   -->
	<script src="./assets/js/argon-dashboard.js?v=1.1.2"></script>
	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
	<script>
      window.TrackJS && TrackJS.install({
         token : "ee6fab19c5a04ac1a32a645abde4613a",
         application : "argon-dashboard-free",
      });
   </script>
   
	<script>
	
	const $inputLink = document.getElementById("input-link");
	// 링크
	const $previewLink = document.getElementById("preview-link");
	// 미리보기
	const $addForm = document.getElementById("add-form");
	// 팝업 폼태그
	const $fileInput = document.getElementById("input-file");
	// 사진
	const $previewImg = document.getElementById("preview-img");
	// 프리뷰
	const reader = new FileReader();
	// 파일리더
	
	$inputLink.addEventListener("input", function() {
	// 링크를 박으면
		$previewLink.setAttribute("href", this.value);
		// 미리보기 링크박기
		$previewLink.setAttribute("target", "_blank");
		// 관리자페이지에서는 따로 창을 띄울것
	})
	      
	reader.onload = function(e){
	// 리더가 로드되면
		$previewImg.src = e.target.result;
		// 결과를 미리보기 이미지에 박아 
	}
	
	$fileInput.addEventListener("change", function(){
	// 파일이 들어오면
		try{
			const files = this.files;
			// 입력받은 파일
	   
			if(files && files[0]){ // 파일을 여러개 선택해서 보낼 수 있어서 배열로 들어옴
			// 배열의 첫번째 값이 들어있는지 확인
				const fileName = this.value.split(".");
				// 파일형태를 알아보기 위해 . 을 기준으로 스플릿해서 자름 xxx.jsp > xxx jsp
				const ex = fileName.at(-1); // 배열의 제일 마지막것 jsp
				if(ex == "jpg" || ex == "jpeg" || ex == "png" || ex == "gif"){
				// 형태가 사진형태라면
					reader.readAsDataURL(files[0]);
					// 리더 로드 (파일의 첫번째 값)
				}else{
					alert("사진만 첨부해주세요.");
					$previewImg.src = "";
				}
			}else{ // 잘 안들어왔으면
				$previewImg.src = ""; //미리보기는 없어용!
			}
		}catch(error){ 
		}
	})
            
	$addForm.addEventListener("submit", function(event){
		if($previewImg.src == ""){  // 미리보기 사진이 없으면
			alert("사진은 필수입니다.");
			event.preventDefault();
		}
	});
	
	</script>
	
</body>
</html>