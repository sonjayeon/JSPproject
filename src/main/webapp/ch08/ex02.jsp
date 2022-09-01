<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02</title>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>
<%--<%
String name=request.getParameter("name");
if(name==null){
	name="";
}
 --%>
<!-- EL을 쓰면 null처리 코드를 생략할 수 있다. -->
<form method="get">
이름 : <input name="name" value="${param.name }">
<input type="submit" value="확인">
</form>
이름 : ${param.name }
</body>
</html>