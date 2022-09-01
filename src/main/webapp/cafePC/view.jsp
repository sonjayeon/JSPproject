<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
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
    String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
    if (session.getAttribute("userID") != null)
    {
        userID = (String)session.getAttribute("userID");
    }
    int bbsID = 0;
    if (request.getParameter("bbsID") != null)
    {
        bbsID = Integer.parseInt(request.getParameter("bbsID"));
    }
    if (bbsID == 0)
    {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('유효하지 않은 글입니다')");
        script.println("location.href = 'bbs.jsp'");
        script.println("</script>");
    }
    Bbs bbs = new BbsDAO().getBbs(bbsID);
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
	 <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
	  <thead>
	  	<tr>
	  		<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
	  	</tr>
	  </thead>
	  <tbody>
	   <tr>
	   		<td style="width: 20%;">글 제목</td>
	   		<td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
	   </tr>
	   <tr>
	   		<td>작성자</td>
	   		<td colspan="2"><%= bbs.getUserID() %></td>
	   </tr>
	   <tr>
	   		<td>작성일자</td>
	   		<td colspan="2"><%= bbs.getBbsDate()%></td>
	   </tr>
	   <tr>
	   		<td>내용</td>
	   		<td colspan="2" style="min-height: 200px; text-align: left;"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
	   </tr>
	  </tbody>
	  </table>
	  <div class="pull-right">
	  <a href="bbs.jsp" class="btn btn-primary">목록</a>  
	  	<%
	  if(userID != null && userID.equals(bbs.getUserID())){
		%>
		<a href="update.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">수정</a>
		<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">삭제</a>
		<%   
	  	}
	  %>
	<input type="submit" class="btn btn-primary" value="글쓰기">
	</div>
	</div>
	</div>
</body>
</html>