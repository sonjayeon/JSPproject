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
<%-- <%
session.setAttribute("name", "김철수");
session.setAttribute("age", 20);
session.setAttribute("job", "dba");
session.setAttribute("addr", "서울 강남구 역삼동");
%> --%>

<c:set var="name" value="김철수" scope="session"></c:set>
<c:set var="age" value="20" scope="session"></c:set>
<c:set var="job" value="dba" scope="session"></c:set>
<c:set var="addr" value="서울 강남구 역삼동" scope="session"></c:set>

세션 변수가 생성되었습니다.<br>
<a href="ex04_result.jsp">확인</a>

</body>
</html>