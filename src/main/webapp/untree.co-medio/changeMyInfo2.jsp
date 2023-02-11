<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="join">
	<div class="cateTit_v2 join" style="margin-top: 0px;">
		<em class="title">회원정보 입력</em>
	</div>
	<form action="updateMem.do" method="POST" onsubmit="checkSubmit(event);">
		<!-- 일반회원 기본 노출 -->
		<div id="personInfo">
			<table class="person-tb">
				<colgroup>
					<col style="width: 155px" />
					<col style="width: auto" />
				</colgroup>
				<tbody>
					<tr>
						<th>
							<div class="head-cell">
								아이디
							</div>
						</th>
						<td>
							<div class="col-cell">${memberId}</div>
						</td>
					</tr>
					<tr>
						<th>
							<div class="head-cell">
								<span class="empha">*</span>이름
							</div>
						</th>
						<td>
							<div class="col-cell">
								<input type="text" name="name" id="dd" value="${memberName}"
									class="MS_input_txt normal-input" pattern="^[가-힣]{2,}$"
									required />
								<div class="guard">이름은 한글만 허용하며 2글자 이상 입력하세요.</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>
							<div class="head-cell">
								<span class="empha"></span>비밀번호
							</div>
						</th>
						<td>
							<div class="col-cell">
								<input type="password" name="pw" id="input-password"
									class="MS_input_txt normal-input"
									pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$"
									autocomplete="off" /> <span class="guard" id="check-password"
									style="visibility: hidden;"> <br>비밀번호는 특수문자를 제외한 최소
									하나의 문자와 숫자를 포함하며 8~16자까지 허용됩니다.
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<th>
							<div class="head-cell">
								<span class="empha"></span>비밀번호 확인
							</div>
						</th>
						<td>
							<div class="col-cell">
								<input type="password" name="pwCheck" readonly
									id="confirm-password" class="MS_input_txt normal-input" />
								<div class="guard" id="result-password"
									style="visibility: hidden;">pw가 일치하지 않습니다.</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>
							<div class="head-cell">
								<span class="empha">*</span>휴대폰
							</div>
						</th>
						<td>
							<div class="col-cell">
							<div style="margin-bottom: 10px;">
								<input type="tel" name="phone" id="pp" class="normal-input"
									pattern="[0-9]{3,3}-[0-9]{4,4}-[0-9]{4,4}" maxlength="13"
									value="${memberPhone}" required />
									<button type="button" id="phCheck" onclick="sms()" style="border: 1px solid #b0b0b0; border-radius: 2px; padding: 2px; background-color:white;">인증번호 전송</button>
								</div>
								<div>
								<input type="text" placeholder="인증번호" id="userCheck" class="normal-input"
									pattern="^[0-9]{5,5}$" maxlength="5">
								<button id="checkSms" type="button" onclick="smsCheck()" style="border: 1px solid #b0b0b0; border-radius: 2px; padding: 2px; background-color:white">인증번호
									확인</button>
									</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- #personInfo -->

		<div class="btnArea join-footer">
			<!-- <a href="javascript:alert('정보변경 완료');" class="cbtn form"> 수정하기 </a> -->
			<button class="cbtn form" type="submit">수정하기</button>
		</div>
		<!-- use_contract -->
	</form>
</div>
<script>

		const inputName = document.getElementById("dd");
		// 아이디
		const inputPw = document.getElementById("input-password");
		// 비밀번호
		const checkPw = document.getElementById("check-password");
		// 비밀번호 안내문구
		const inputCpw = document.getElementById("confirm-password");
		// 비밀번호 확인
		const checkCpw = document.getElementById("result-password");
		// 비밀번호 확인 안내문구
		const inputPh = document.getElementById("pp");
		// 전화번호
		const checkPh = document.getElementById("phCheck");
		// 인증번호 발송
		const inputSms = document.getElementById("userCheck");
		// 인증번호
		const checkSms = document.getElementById("checkSms");
		// 인증번호 확인
		const orgName = inputName.value;
		// 기존 이름
		const orgPh = inputPh.value;
		// 기존 전화번호
		let orgNameFlag = true;
		let orgPhFlag = true;
		let number = 0;
		let smsBtn = false;
		let smsCheckBtn = false;
		let smsbabo = false;
		
		// 기본세팅
		checkPw.style.visibility="hidden";
		checkCpw.style.visibility="hidden";
		checkPh.style.visibility="hidden";
		checkSms.style.visibility="hidden";
		inputCpw.readOnly=true;
		inputSms.readOnly=true;

		// 이름이 바뀌면
		inputName.addEventListener("input", function () {
			if(this.value == orgName){
				orgNameFlag = true;
			}
			else{
				orgNameFlag = false;
			}
		})
		
		// 비밀번호가 바뀌면
		inputPw.addEventListener("input", function(){
			if(this.value == ""){
				checkPw.style.visibility="hidden";
				checkCpw.style.visibility="hidden";
				inputCpw.removeAttribute("required");
				inputCpw.value="";
				inputCpw.readOnly=true;
			}
			else{
				checkPw.style.visibility="visible";
				checkCpw.style.visibility="visible";
				inputCpw.setAttribute("required", true);
				inputCpw.readOnly=false;
				if(this.value == inputCpw.value){
					checkCpw.innerText = "pw가 일치합니다";
					checkCpw.style.color = "black";
					smsbabo = true;
				}
				else{
					checkCpw.innerText = "pw가 일치하지 않습니다";
					checkCpw.style.color = "red";
					smsbabo = false;
				}
			}
		})
		
		// 비밀번호 확인이 바뀌면
		inputCpw.addEventListener("input", function(){
				if(this.value == inputPw.value){
					checkCpw.innerText = "pw가 일치합니다";
					checkCpw.style.color = "black";
					smsbabo = true;
				}
				else{
					checkCpw.innerText = "pw가 일치하지 않습니다";
					checkCpw.style.color = "red";
					smsbabo = false;
				}
		})
		
		// 전화번호가 바뀌면
		inputPh.addEventListener("input", function () {
	        this.value = this.value.replace(/[^0-9]/g, '') // 숫자를 제외한 모든 문자 제거
	        this.value = this.value.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
			orgPhFlag = true;
			smsBtn = false;
			checkPh.style.visibility="hidden";
			checkSms.style.visibility="hidden";
			inputSms.value="";
			inputSms.readOnly=true;
			if(this.value != orgPh){
				orgPhFlag = false;
				if(this.value.length == this.maxLength){
					checkPh.style.visibility="visible";
					/*
					inputSms.readOnly=false;
					if(inputSmsLength){
						checkSms.style.visibility="visible";
					}
					*/
				}
			}
		})
		
		// 인증번호가 바뀌면
		inputSms.addEventListener("input", function(){
			this.value = this.value.replace(/[^0-9]/g, '') // 숫자를 제외한 모든 문자 제거
			smsCheckBtn = false;
			if(this.value.length == this.maxLength){
				checkSms.style.visibility="visible";
			}
			else{
				checkSms.style.visibility="hidden";
			}
		})
		
		// 인증번호전송
		function sms(){
	          var userPhoneNum = $("#pp").val();
	          $.ajax({
	             type: 'POST',
	             url: 'Sms',
	             data: {userPhoneNum:userPhoneNum},
	             success: function(randNum){
	                console.log("로그:인증번호["+randNum+"]")
	                if(randNum != null){
	                	inputSms.readOnly=false;
	                   alert("인증번호 전송이 완료되었습니다!");
	                   number = randNum;   //랜덤문자인증번호
	                   smsBtn = true;
	                } 
	                else{
	                   alert(" 전송이 불가합니다.."); 
	                   smsBtn = false;
	                }
	             }
	          })
		}
		
		// 인증번호확인
		function smsCheck(){
			if(inputSms.value == number){
				alert("인증번호가 일치합니다!");
				smsCheckBtn = true;
			}
			else{
				alert("인증번호가 일치하지 않습니다.다시 입력하세요!");
				smsCheckBtn = false;
			}
		}
		
		// 서브밋하면
		function checkSubmit(event){
			if(orgNameFlag && orgPhFlag){
				if(inputPw.value == ""){
					alert("변경할 내용이 없습니다");
					event.preventDefault();
					return;
				}
			}
			if(inputPw.value != ""){
				if(!smsbabo){
					alert("비밀번호를 확인해주세요");
					event.preventDefault();
					return;
				}
			}
			if(!orgPhFlag){
				if(!smsBtn){
					alert("인증번호를 전송해주세요");
					event.preventDefault();
					return;
				}
				if(!smsCheckBtn){
					alert("인증번호를 확인해주세요");
					event.preventDefault();
					return;
				}
			}
			alert("변경 완료");
			
		}

          </script>