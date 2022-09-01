<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>makeCookie</title>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>
<%@ page import="java.net.URLEncoder" %>
<%
Cookie cookie=new Cookie("id","kim");
Cookie cookie2=new Cookie("pwd","1234");

//톰캣하위 버전에서는 특수문자, 한글을 쓰면 에러가 나기 때문에 인코딩을 해야함
//Cookie cookie3=new Cookie("name", URLEncoder.encode("김철수","utf-8"));
Cookie cookie3=new Cookie("name","김철수");
Cookie cookie4=new Cookie("age","20");

response.addCookie(cookie);//응답헤더에 쿠키 추가
response.addCookie(cookie2);
response.addCookie(cookie3);
response.addCookie(cookie4);
%>

쿠키가 생성되었습니다. <br>
<a href="useCookie.jsp">쿠키 확인</a>

</body>
</html>