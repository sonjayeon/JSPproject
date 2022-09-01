<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
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
<%
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String)session.getAttribute("userID");
	}
	int pageNumber = 1;
	if(request.getParameter("pageNumber") != null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
%>

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
 <%
 	if(userID == null) {
 %>
 <ul class="navbar-nav me-auto mb-2 mb-lg-0">
   <li class="nav-item active">
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
<div class="container">
 <div class="row">
  <table class="table table-striped table-hover" style="text-align: center; border: 1px solid #dddddd">
   <thead>
    <tr>
    	<th style="background-color: #eeeeee; text-align: center;">번호</th>
    	<th style="background-color: #eeeeee; text-align: center;">제목</th>
    	<th style="background-color: #eeeeee; text-align: center;">작성자</th>
    	<th style="background-color: #eeeeee; text-align: center;">작성일</th>
    </tr>
   </thead>
   <tbody>
   		<%
   			BbsDAO bbsDAO = new BbsDAO();
   			ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
   			for(int i=0; i < list.size(); i++){
   		%>
   		<tr>
   			<td><%=list.get(i).getBbsID()%></td>
   			<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle()%></a></td>
   			<td><%=list.get(i).getUserID()%></td>
   			<td><%=list.get(i).getBbsDate()%></td>
   		</tr>
   		<%
   			}
   		%>
   </tbody>
  </table>
  <%
  	if(pageNumber != 1){	
  	
  %>
  	<div class="pull-right">
  	<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arrow-left">이전</a>
  <%
  	}if(bbsDAO.nextPage(pageNumber + 1)){	
  %>
  <div class="pull-right">
    <a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arrow-left">다음</a>
  <%
  	}
  %>
  <a href="write.jsp" class="btn btn-primary">글쓰기</a>
  </div>
 </div>
 </div>
</div>
</body>
</html>