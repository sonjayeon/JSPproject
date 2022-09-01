<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteCookie</title>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>
<%
//전체 쿠키 삭제
Cookie[] cookies = request.getCookies();
if(cookies != null){
	for(int i=0; i<cookies.length; i++){
		//쿠키 유효시간을 0으로 설정해서 만료시킴
		cookies[i].setMaxAge(0);
		//응답 헤더에 추가
		response.addCookie(cookies[i]);
	}
}
%>
쿠키가 삭제되었습니다.
<a href="useCookie.jsp">쿠키 확인</a>

</body>
</html>