<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>
<%
//쿠키 수정(value만 수정), 삭제,수정함수는 따로 없음
response.addCookie(new Cookie("id","park"));
%>

쿠키가 변경되었습니다.
<a href="useCookie.jsp">쿠키 확인</a>
</body>
</html>