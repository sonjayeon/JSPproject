<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sessionTime</title>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>
<h2>세션의 유효 시간</h2>
<%
int timeout=session.getMaxInactiveInterval();
//session.setMaxInactiveInterval(1200);//1200초(20분)으로 변경
out.println("세션의 유효시간 : "+timeout);
%>

</body>
</html>