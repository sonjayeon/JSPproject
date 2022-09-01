<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteSession</title>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>
<%
//session.removeAttribute("id");//id만 삭제
session.removeAttribute("passwd");
//session.invalidate();//세션을 초기화
%>
세션이 삭제되었습니다. <br>
<a href="viewSession.jsp">세션 확인</a>
</body>
</html>