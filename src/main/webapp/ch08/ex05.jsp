<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>
<%
ArrayList<String> items=new ArrayList<>();
items.add("오렌지");
items.add("사과");
items.add("포도");
items.add("복숭아");
request.setAttribute("items", items);
%>
<jsp:forward page="ex05_result.jsp"></jsp:forward>
</body>
</html>