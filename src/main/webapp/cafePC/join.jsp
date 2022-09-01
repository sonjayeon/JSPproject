<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="custom.css">
<%@ include file="../include/header.jsp" %>
</head>
<body>
<div class="container">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
<!-- container-fluid 가로크기를 기기해상도 상관없이 100%로 지정 -->
 <div class="container-fluid">
  <a class="navbar-brand" href="main.jsp">Home</a>
  <!-- navbar-toggler : 접혔다 폈다하는 메뉴 서브 컴포넌트 -->
  <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
  data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
  aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
 </div>
 <div class="collapse navbar-collapse" id="navbarSupportedContent">
  <ul class="navbar-nav me-auto mb-2 mb-lg-0">
   <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="bbs.jsp">Board</a>
   </li>
   <li class="nav-item">
    <a class="nav-link" href="login.jsp">Login</a>
   </li>
   <li class="nav-item">
    <a class="nav-link" href="join.jsp">join</a>
   </li>
  </ul>
 </div>
</nav>
<div class="container">
 <h2 style="text-align:center;">회원가입</h2><br>
 <form method="post" action="joinAction.jsp">
  <div class="form-group">
   <input type ="text" class="form-control" placeholder="아이디" name ="userID" maxlength='20'>
  </div><br>
  <div class="form-group">
   <input type ="password" class="form-control" placeholder="비밀번호" name ="userPassword" maxlength='20'>
  </div><br>
  <div class="form-group">
   <input type ="text" class="form-control" placeholder="이름" name ="userName" maxlength='20'>
  </div><br>
  <div class="form-group" style="text-align: center;">
    <div class="btn-group" data-toggle="buttons">
     <label class="btn btn-primary active">
      <input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
     </label>
     <label class="btn btn-primary">
      <input type="radio" name="userGender" autocomplete="off" value="여자" checked>여자
     </label>
    </div>
  </div><br>
  <div class="form-group">
   <input type ="email" class="form-control" placeholder="이메일" name ="userEmail" maxlength='20'>
  </div><br>
  <button type="submit" class="btn btn-primary form-control">회원가입</button>
 </form>
</div>
</div>
</body>
</html>