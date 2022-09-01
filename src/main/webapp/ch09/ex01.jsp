<%@page import="org.apache.taglibs.standard.lang.jstl.EnumeratedMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>
<h2>Java 코드</h2>
<%-- <%
Enumeration<String> headerNames=request.getHeaderNames();
while(headerNames.hasMoreElements()){ // 다음 요소가 있으면
	String key=(String)headerNames.nextElement(); // 값을 읽음
	String value=request.getHeader(key); // 헤더값 조회
	out.print(key+" : " + value + "<br>");
}
%> --%>

<h2>JSTL코드</h2>
<c:forEach var="h" items="${header}">
 ${h.key} => ${h.value} <br>
</c:forEach>
<hr>

<!-- 사용영역 : page < request < session < application -->
<c:set var="browser" value="${header['user-agent']}" scope="page" />
<c:out value="${browser}" />
${browser}
<hr>
<c:remove var="browser" /><!-- java의 removeAttribute()대체 -->
<c:out value="${browser}" />
</body>
</html>