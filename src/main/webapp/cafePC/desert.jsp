<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="custom.css">
<%@ include file="../include/header.jsp" %>
</head>
<style>
h1{
	text-align: center;
}
</style>
<body>
<%
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String)session.getAttribute("userID");
	}

%>
<!-- navbar -->
<div class="container">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
<!-- container-fluid 가로크기를 기기해상도 상관없이 100%로 지정 -->
 <div class="container-fluid">
  <a class="navbar-brand active" href="main.jsp">Home</a>
  <!-- navbar-toggler : 접혔다 폈다하는 메뉴 서브 컴포넌트 -->
  <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
  data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
  aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
 </div>
 <%
 	if(userID == null) {
 %>
 <ul class="navbar-nav me-auto mb-2 mb-lg-0">
   <li class="nav-item">
    <a class="nav-link" href="bbs.jsp">Board</a>
   </li>
   <li class="nav-item">
    <a class="nav-link" href="login.jsp">Login</a>
   </li>
   <li class="nav-item">
    <a class="nav-link" href="join.jsp">join</a>
   </li>
  </ul>
 <%
 	}else {
 %>
 <ul class="navbar-nav me-auto mb-2 mb-lg-0">
   <li class="nav-item">
    <a class="nav-link" href="bbs.jsp">Board</a>
   </li>
   <li class="nav-item">
    <a class="nav-link" href="logoutAction.jsp">Logout</a>
   </li>
  </ul>
 <%
 	}
 %>
</nav>
</div>
<br>
<h1><b>desert</b></h1>
<div class="row">
<div class="col-lg-3">
<div class="card" style="width: 18rem;">
  <img class="card-img-top" src="images/녹차마카다미아스콘.jpg" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title">녹차 마카다미아 스콘</h5>
  </div>
</div>
</div>

<div class="col-lg-3">
<div class="card" style="width: 18rem;">
  <img class="card-img-top" src="images/미니클래식스콘.jpg" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title">미니 클래식 스콘</h5>
  </div>
</div>
</div>

<div class="col-lg-3">
<div class="card" style="width: 18rem;">
  <img class="card-img-top" src="images/클래식스콘.jpg" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title">클래식 스콘</h5>
  </div>
</div>
</div>

<div class="col-lg-3">
<div class="card" style="width: 18rem;">
  <img class="card-img-top" src="images/트리플미니스콘.jpg" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title">트리플 미니 스콘</h5>
  </div>
</div>
</div>
</div>
<br>
<div class="row">
<div class="col-lg-3">
<div class="card" style="width: 18rem;">
  <img class="card-img-top" src="images/탕종땅콩샌드.jpg" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title">탕종 땅콩 샌드</h5>
  </div>
</div>
</div>

<div class="col-lg-3">
<div class="card" style="width: 18rem;">
  <img class="card-img-top" src="images/리얼블루베리베이글.jpg" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title">리얼 블루베리 베이글</h5>
  </div>
</div>
</div>

<div class="col-lg-3">
<div class="card" style="width: 18rem;">
  <img class="card-img-top" src="images/리얼치즈베이글.jpg" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title">리얼 치즈 베이글</h5>
  </div>
</div>
</div>

<div class="col-lg-3">
<div class="card" style="width: 18rem;">
  <img class="card-img-top" src="images/바질토마토크림치즈베이글.jpg" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title">바질 토마토 크림치즈 베이글</h5>
  </div>
</div>
</div>
</div>
</body>
</html>