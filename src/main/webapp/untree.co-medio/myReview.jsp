<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:if test="${review.size()==0}">
	<h1 class="heading-2 mb-3" style="font-size: 50px;">No Review</h1>
</c:if>
<c:if test="${review.size()!=0}">
	<c:forEach var="v" items="${review}" begin="0" end="${review.size()}"
		varStatus="status">
		<div style="display: flex;">
			<div
				style="width: 20%; display: flex; flex-direction: column; align-items: center;">
				<div class="connect_img">
					<a href="productDetail.do?pNum=${v.rPNum}" class="img-block"> <img
						src="${v.rPImg}" alt="${v.rPName}"
						style="max-height: 100px; max-width: 100px;" />
					</a>
				</div>
				<div class="article_info connect_info">
					<p class="txt_brand"></p>

					<p class="list_info">${v.rPName}</p>
				</div>
			</div>

			<div
				style="width: 90%; display: flex; flex-direction: column; justify-content: center;">
				<blockquote style="margin: 0px;">
					<p>${v.rContent}</p>
				</blockquote>
				<h3>${v.rStarId}</h3>
				<span class="rate"> <c:forEach begin="1"
						end="${Integer.parseInt(v.rGrade)}" varStatus="st">
						<i class="icon-star2"></i>
					</c:forEach>
				</span>
			</div>
		</div>
	</c:forEach>
</c:if>