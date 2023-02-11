<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:if test="${qnaList.size()==0}">
	<h1 class="heading-2 mb-3" style="font-size: 50px;">No QnA</h1>
</c:if>
<c:if test="${qnaList.size()!=0}">

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
								style="color: black !important; font-size: 40px; padding: 30px">NO
								QnA</h5>
						</th>
					</tr>
				</c:if>

				<c:forEach var="v" items="${qnaList}" begin="0"
					end="${qnaList.size()}" varStatus="status">
					<tr>
						<td><div class="tb-center">${status.count}</div></td>
						<td><div class="tb-left">
								<c:if test="${memberId!='admin'}">
									<img src="images/qn.png">
								</c:if>
							</div></td>
						<td>
							<div class="tb-left">
								<a
									href="javascript:qnaDetail('<c:out value='${v.qId}'/>','<c:out value='${v.qNum}'/>', '<c:out value='${memberId}'/>')">${v.qTitle}</a>
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
</c:if>

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
