<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ attribute name="type"%>

<c:if test="${memberId!='admin'}">
   <c:if test="${memberId != null}">
   <div class="bbs-btm">
      <div class="bbs-link">
         <a href="qnaUser.jsp" class="CSSbuttonWhite">WRITE</a>
      </div>
   </div>
   </c:if>
</c:if>

<c:if test="${memberId == null}">
   <div class="bbs-btm">
      <div class="bbs-link">
      <a href="javascript:alert('로그인시 이용가능합니다.')" class="CSSbuttonWhite">WRITE</a>
      
      
         <!--  <a href="qnaUser.jsp" class="CSSbuttonWhite">WRITE</a>-->
      </div>
   </div>
</c:if>
      

