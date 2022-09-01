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
#jumbotron1{
	background-image: url('images/나무.jpg');
	background-size: cover;
	color:white;
}
#jumbotron2{
	background-image: url('images/카페.jpg');
	background-size: cover;
	color:white;
}
#jumbotron3{
	background-image: url('images/라벤더.jpg');
	background-size: cover;
	color:white;
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
<div class="container" id="jumbotron1">
 <div class="jumbotron jumbotron-fluid">
  <div class="container">
  <br>
    <h1 class="display-4">음료</h1>
    <p class="lead">바리스타의 숙련된 기술로 취향까지 담은 음료를 경험해 보세요.</p>
     <a class="btn btn-outline-light btn-lg" href="drink.jsp" role="button">자세히 보기</a>
    <br><br>
  </div>
</div>
</div>
<br><br>
<div class="container" id="jumbotron2">
 <div class="jumbotron jumbotron-fluid">
  <div class="container">
  <br>
    <h1 class="display-4">디저트</h1>
    <p class="lead">신선한 식재료로 만든 다양한 디저트를 소개합니다.</p>
     <a class="btn btn-outline-light btn-lg" href="desert.jsp" role="button">자세히 보기</a>
    <br><br>
  </div>
</div>
</div>
<br><br>
<div class="container" id="jumbotron3">
 <div class="jumbotron jumbotron-fluid">
  <div class="container">
  <br>
    <h1 class="display-4">상품</h1>
    <p class="lead">시즌마다 다양한 모습으로 즐거움을 주는 상품들을 만나보세요.</p>
     <a class="btn btn-outline-light btn-lg" href="items.jsp" role="button">자세히 보기</a>
    <br><br>
  </div>
</div>
</div>
</body>
</html>