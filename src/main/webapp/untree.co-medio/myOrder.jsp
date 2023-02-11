<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:if test="${myOrder.size()==0}">
	<h1 class="heading-2 mb-3" style="font-size: 50px;">No Order</h1>
</c:if>
<c:if test="${myOrder.size()!=0}">
	<div>
		<p style="position: unset; text-align: right;">
			<span class="fc-blue">${memberName}</span>님께서 주문하신 내역입니다.
		</p>
		<table class="table_basic cart_table n-cart-table">

			<thead>
				<tr class="esulTr" style="background-color: #f3f3f3;">
					<th>주문번호</th>
					<th>상품명</th>
					<th>판매가</th>
					<th>수량</th>
					<th>리뷰</th>
					<th>주문금액</th>

				</tr>
			</thead>
			<tbody>
				<c:set var="esul" value="0" />
				<c:set var="esul1" value="0" />
				<c:set var="esul2" value="0" />
				<c:forEach var="v" items="${myOrder}" begin="0"
					end="${myOrder.size()}" varStatus="status">

					<tr class="cart-group">

						<c:if test="${esul2 == esul1}">
							<c:forEach var="m" items="${mapList[esul]}" varStatus="status2">
								<td style="border-right: 1px solid #5b5b5b;"
									rowspan="${m.value}">${m.key} <c:set var="esulf"
										value="true" /> <c:forEach var="total" items="${myOrder}"
										begin="0" end="${myOrder.size()}" varStatus="statusss">
										<c:if test="${total.oNum==m.key}">
											<c:if test="${esulf}">
												<br>(${total.oDate})
                                     <c:set var="esulf" value="false" />
											</c:if>
										</c:if>
									</c:forEach>
								</td>
							</c:forEach>

						</c:if>

						<td>
							<div class="connect_img">
								<a href="productDetail.do?pNum=${v.oPNum}" class="img-block">
									<img src="${v.oPImg}" alt="${v.oPName}"
									style="max-height: 100px; max-width: 100px;" />
								</a>
							</div>
							<div class="article_info connect_info">
								<p class="txt_brand"></p>

								<p class="list_info">${v.oPName}</p>
							</div>
						</td>
						<td class="td_price">${v.oPPrice}원</td>
						<td>${v.oCnt}개</td>
						<td><c:set var="esulrrr" value="true" /> <c:forEach
								var="rrr" items="${review}" begin="0" end="${review.size()}"
								varStatus="status">
								<c:if test="${esulrrr}">
									<c:if test="${rrr.rPNum==v.oPNum}">
               리뷰완료
               <c:set var="esulrrr" value="false" />
									</c:if>
								</c:if>

							</c:forEach> <c:if test="${esulrrr}">
								<a href="review.jsp?pNum=${v.oPNum}"><button
										class="reviewButton">리뷰등록</button></a>

							</c:if></td>

						<c:if test="${esul2 == esul1}">
							<c:forEach var="m" items="${mapList[esul]}" varStatus="status2">
								<td style="border-left: 1px solid #5b5b5b;" rowspan="${m.value}">
									<c:set var="esulf" value="true" /> <c:forEach var="total"
										items="${myOrder}" begin="0" end="${myOrder.size()}"
										varStatus="statusss">
										<c:if test="${total.oNum==m.key}">
											<c:if test="${esulf}">
                                     ${total.totalPrice}원
                                     <c:set var="esulf" value="false" />
											</c:if>
										</c:if>
									</c:forEach>
								</td>
								<c:set var="esul1" value="${m.value}" />
							</c:forEach>

							<c:set var="esul2" value="0" />
							<c:set var="esul" value="${esul+1}" />
						</c:if>

						<c:set var="esul2" value="${esul2+1}" />

					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
</c:if>