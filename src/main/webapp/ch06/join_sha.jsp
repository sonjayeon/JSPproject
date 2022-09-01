<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<script src="../include/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function() {//웹페이지가 로딩되자마자 자동으로 호출하여 실행
	list();
	$("#btnSave").click(function(){
		insert();
	});
});

function insert(){
	var param="userid="+$("#userid").val()
	+"&passwd="+$("#passwd").val()
	+"&name="+$("#name").val()
	+"&email="+$("#email").val()
	+"&hp="+$("#hp").val();
	$.ajax({
		typ: "post",
		url: "/jsp02/member_servlet/join_sha.do",
		data: param,
		success: function(){
			list();//회원목록 갱신
			//입력값 초기화
			$("#userid").val("");
			$("#passwd").val("");
			$("#name").val("");
			$("#email").val("");
			$("#hp").val("");
		}
	});
	
}

function list(){
	//백그라운드로 실행
	$.ajax({
		type: "post",
		url: "/jsp02/member_servlet/list.do",
		success: function(result) {
			console.log(result);//F12 개발자모드에서 출력
			$("#memberList").html(result);
		}
	});
	
}
</script>
</head>
<body>
<h2>회원가입(SHA256)</h2>
아이디 : <input id="userid">
비번 : <input type="password" id="passwd"> <br>
이름 : <input id="name">
이메일 : <input id="email"> <br>
핸드폰 : <input id="hp">
<button type="button" id="btnSave">추가</button>

<div id="memberList"></div>
</body>
</html>