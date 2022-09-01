<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>
<%
HashMap<String, String> map=new HashMap<>();
map.put("포도", "grape");
map.put("오렌지", "orange");
map.put("바나나", "banana");
map.put("사과", "apple");
request.setAttribute("map", map);
%>
<jsp:forward page="ex06_result.jsp"></jsp:forward>

</body>
</html>