<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05_result</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>
<%-- <%@ page import="java.util.ArrayList" %>
<%
ArrayList<String> items=(ArrayList<String>)request.getAttribute("items");
for(String str : items){
	out.println(str+"<br>");
}

%> --%>

<!-- El/JSTL -->
<!-- forEach문 2가지 종류가 있다.
1) forEach var="변수" begin="시작" end="끝" - java의 일반 for문과 비슷
2) forEach var="개별변수" items="집합변수" - java 확장 for문(forEach문)과 비슷
 -->
 
<c:forEach var="fruit" items="${requestScope.items}">
 ${fruit}<br>
</c:forEach>


</body>
</html>