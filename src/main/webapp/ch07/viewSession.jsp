<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Enumeration"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>
<%
//Enumeration을 사용해서 세션의 key set을 가져옴
Enumeration<String> attr=session.getAttributeNames();
while(attr.hasMoreElements()){//다음 요소가 있으면
	String key=attr.nextElement();//다음 요소를 읽음
	Object value=session.getAttribute(key);//리턴타입이 Object
	out.println("변수명 : "+key);
	out.println(", 값 : "+value+"<br>");
}

String id=(String)session.getAttribute("id");
int age=0;
if(session.getAttribute("age") != null){
	age=(int)session.getAttribute("age");
}

double height=0;
if(session.getAttribute("height") != null){
	height=(double)session.getAttribute("height");
}
%>

아이디 : <%= id %> <br>
나이 : <%= age %> <br>
키 : <%= height%> <br>

<a href="deleteSession.jsp"> 세션 삭제</a>

</body>
</html>