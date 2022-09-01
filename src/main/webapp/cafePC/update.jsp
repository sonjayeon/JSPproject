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
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String)session.getAttribute("userID");
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인을 하세요.')");
        script.println("location.href = 'login.jsp'");
        script.println("</script>");
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
	        script.println("alert('유효하지 않은 글입니다.')");
	        script.println("location.href = 'bbs.jsp'");
	        script.println("</script>");
	    }
	    Bbs bbs = new BbsDAO().getBbs(bbsID);
	    if(!userID.equals(bbs.getUserID())){
	    	PrintWriter script = response.getWriter();
	        script.println("<script>");
	        script.println("alert('권한이 없습니다.')");
	        script.println("location.href = 'bbs.jsp'");
	        script.println("</script>");
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
 
 <ul class="navbar-nav me-auto mb-2 mb-lg-0">
   <li class="nav-item">
    <a class="nav-link" href="bbs.jsp">Board</a>
   </li>
   <li class="nav-item">
    <a class="nav-link" href="logoutAction.jsp">Logout</a>
   </li>
  </ul>
</nav>
</div>
<div class="container">
	<div class="row">
	<form method="post" action="updateAction.jsp?bbsID=<%=bbsID%>">
	 <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
	  <thead>
	  	<tr>
	  		<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 수정 양식</th>
	  	</tr>
	  </thead>
	  <tbody>
	   <tr>
	   		<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%=bbs.getBbsTitle()%>"></td>
	   </tr>
	   <tr>		
			<td><textarea class="form-control" placeholder="글 내용"  name="bbsContent" maxlength="2048" style="height:350px"><%=bbs.getBbsContent() %></textarea></td>	   </tr>
	  </tbody>
	  </table>
	 <div class="pull-right">
	<input type="submit" class="btn btn-primary" value="글수정">
	</div>
	</form>	
	</div>
	</div>
</body>
</html>