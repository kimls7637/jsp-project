<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%
request.setCharacterEncoding("utf-8");
// 쿠키 지정 name, value
Cookie cookie = new Cookie("test", "kimls");
// 쿠키의 유효시간 설정
cookie.setMaxAge(60*60);
// 쿠키 추가
response.addCookie(cookie);



// 쿠키 정보를 얻기
Cookie[] cookies = request.getCookies();
// 쿠키에 값이 있다면
for(int i = 0; i<cookies.length; i++){
	String name = cookies[i].getName(); // 쿠키 이름
	String value = cookies[i].getValue(); // 쿠키 값
	if(name.equals("test")){
		session.setAttribute("id", value);
	}
}




	pageContext.forward("main.jsp");
%>
