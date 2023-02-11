<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="join">
	<div class="cateTit_v2 join" style="margin-top: 0px;">
		<em class="title">회원정보 확인</em>
	</div>
	<form action="deleteMem.do" method="POST" id="out-form"
		onsubmit="chekcDelete(event);">
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
								<span class="empha"></span>이름
							</div>
						</th>
						<td>
							<div class="col-cell">
								<input type="text" name="name" id="hname" value="${memberName}"
									class="MS_input_txt normal-input" size="15" maxlength="30"
									readonly />
							</div>
						</td>
					</tr>
					<c:if test="${memberId.indexOf('@')==-1}">
						<tr>
							<th>
								<div class="head-cell">
									<span class="empha"></span>아이디
								</div>
							</th>
							<td>
								<div class="col-cell">
									${memberId} <input type="hidden" name="id" id="id" />
								</div>
							</td>
						</tr>

						<tr>
							<th>
								<div class="head-cell">
									<span class="empha">*</span>비밀번호 입력
								</div>
							</th>
							<td>
								<div class="col-cell">
									<input type="password" name="pw"
										class="MS_input_txt normal-input" required />
								</div>
							</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>

		<div class="btnArea join-footer">
			<button type="submit" class="cbtn form">탈퇴하기</button>
		</div>
	</form>
</div>