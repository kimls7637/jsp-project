<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%
	ArrayList<String> datas = new ArrayList<>(Arrays.asList("월!", "화!", "수!", "목!", "금!", "토!", "일!"));
	ArrayList<Integer> datas2 = new ArrayList<>(Arrays.asList(50,20,4,52,152,21,213));

	
	request.setAttribute("datas", datas);
	request.setAttribute("datas2", datas2);
	
	ArrayList<String> datas3 = new ArrayList<>(Arrays.asList("테트", "가방", "가구", "음식"));
	ArrayList<Integer> datas4 = new ArrayList<>(Arrays.asList(20, 50, 20, 10));

	
	request.setAttribute("datas3", datas3);
	request.setAttribute("datas4", datas4);
	
	
	pageContext.forward("adminMain.jsp");
%>
