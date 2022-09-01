<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>
<c:set var="num" value="<%=new Integer(100) %>" scope="page" />
<c:set var="num" value="200" scope="request" />
<c:set var="num" value="300" scope="session" />
<c:set var="num" value="400" scope="application" />

${num}<br> <!-- pageScope 생략 가능 -->
${pageScope.num}<br>
${requestScope.num}<br>
${sessionScope.num}<br>
${applicationScope.num}<br>
</body>
</html>