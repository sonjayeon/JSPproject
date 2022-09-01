<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06_result</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>

<h2>EL/JSTL코드로 출력</h2>

${map["포도"]}<br>
${map["오렌지"]}<br>
${map["바나나"]}<br>
${map["사과"]}<br>

<hr>
<!-- 전체값을 출력할 경우 -->
<c:forEach var="fruit" items="${requestScope.map}">
${fruit}<br>
</c:forEach>
</body>
</html>