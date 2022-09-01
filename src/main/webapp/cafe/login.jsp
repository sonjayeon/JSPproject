<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<script src="../include/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#btnLogin").click(function() {
		var param="userid="+$("#userid").val()+"&passwd="+$("#passwd").val();
		$.ajax({
			type: "post",
			url: "/jsp02/member_servlet/login.do",
			data: param,
			success: function(result) {
				 alert("로그인되었습니다.");
				 $("#result").html(result);
				 $("#userid").val("");
				 $("#passwd").val(""); 
				 
			}
		});
	});
});
</script>
<style type="text/css">
@font-face {
    font-family: 'ChosunCentennial';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-02@1.0/ChosunCentennial.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
*{
	font-family: 'ChosunCentennial';
}
h2 {
	text-align: center;
}
img {
	text-align: center;
}

#panel1{
	text-align: center;
}
.bu{
	text-align: center;
	width: 75%;
}
.b{
	text-align: center;
	width:60%;
	font-size: 10px;
}
</style>
</head>
<body>
<div data-role="page" id="page1">
  <div data-role="header" data-theme="a" data-position="fixed">
   <a href="index.html" data-transition="slide" data-direction="reverse"><img src="images/free-icon-font-angle-left-3916962.png" width="14px"></a>
   <h1>로그인</h1>
  </div>
  <div data-role="content">
   <div>
    <h2 align="center">로그인</h2>
    <div data-role="content">
   아이디 <input id="userid">
   비밀번호 <input type="password" id="passwd">
    <div class="ui-grid-b">
   <div><button id="btnLogin">확인</button></div>
   <div><button onclick="location.href='index.html'">취소</button></div>
  </div>
  <div id="result"></div>
   </div>
  </div>
 </div>
 </div>
</body>
</html>