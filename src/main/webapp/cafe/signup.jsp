<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<script src="../include/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function check() {
	// 아이디 체크
	var userid = document.getElementById("userid");
	if(userid.value == "") {
		alert("아이디는 필수 입력입니다.");
		userid.focus();
		return;
	}
	
	//(영문, 숫자를 사용한 4~10자리로 입력) 
	var exp1 = /^[A-Za-z0-9]{4,10}$/;
	console.log("test : " + exp1.test(userid.value));
	// test(검사할 문자열)는 규칙에 맞으면 true, 틀리면 false 리턴
	if(!exp1.test(userid.value)) {
		alert("아이디는 영문, 숫자를 사용한 4~10자리로 입력");
		userid.focus();
		return;
	}
	
	// 비밀번호 체크
	var passwd = document.getElementById("passwd");
	var passwd2 = document.getElementById("passwd2");
	if(passwd.value == ""){
		alert("비밀번호는 필수 입력입니다.");
		passwd.focus();
		return;
	}
	
	//(영문대소문자,숫자,특수기호(!@#$%^*+=-)를 모두 사용하여 8~12자리로 입력)
	var exp2 = /(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^*+=-])(?=.*\d){8,12}/;
	//()괄호를 쓸 때는 시작^, 끝$기호를 쓰면 안됨.
	//적어도 소문자 하나, 대문자 하나, 특수문자 하나, 
	if(!exp2.test(passwd.value)){
		alert("비밀번호는 영문대소문자,숫자,특수기호(!@#$%^*+=-)를 모두 사용하여 8~12자리로 입력하세요");
		passwd.focus();
		return;
	}
	
	if(passwd.value != passwd2.value) {
		alert("비밀번호 불일치");
		return;
	}
	//이름 체크
	var name = document.getElementById("name");
	if(name.value == ""){
		alert("이름은 필수 입력입니다.");
		name.focus();
		return;
	}
	
	var exp3 = /^[가-힣]+$/;//한글만 입력하는 정규식
	if(!exp3.test(name.value)){
		alert("이름은 한글만 가능합니다.");
		name.focus();
		return;
	}
	// 이메일 체크
	var eamil = document.getElementById("email");
	var exp4 = /^[a-z0-9]{2,}@[a-z0-9]{2,}\.[a-z]{2,}$/;
	if(!exp4.test(email.value)){
		alert("이메일 형식이 잘못되었습니다. ex)abc@abc.com");
		email.focus();
		return;
	}
	
	//전화번호 체크
	var phone=document.getElementById("hp");
	var exp5=/^[0-9]+$/;
	//var exp5 = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
	
	// 입력값.match(정규표현식) : 규칙에 맞는 부븐을 찾아 배열로 반환하고 대응되는 문자열을
	// 못찾으면 null값을 반환하는 특징.
	console.log("match : " + hp.value.match(exp5));
	console.log("test : " + exp5.test(hp.value));
	if(!hp.value.match(exp5)){
		alert("전화번호는 숫자만 입력하세요.");
		hp.focus();
		return;
	}
	alert("가입을 축하합니다.");
	insert();
}

function insert(){
	var param="userid="+$("#userid").val() + "&passwd="+$("#passwd").val() +"&name="+$("#name").val()+"&email="+$("#email").val()+"&hp="+$("#hp").val()+"&zipcode="+$("#zipcode").val()+"&address1="+$("#address1").val()+"&address2="+$("#address2").val();
	$.ajax({
		type: "post",
		url: "/jsp02/member_servlet/join.do",
		data: param,
		success: function(){
			$("#userid").val("");
			$("#passwd").val("");
			$("#passwd2").val("");
			$("#name").val("");
			$("#email").val("");
			$("#hp").val("");
			$("#zipcode").val("");
			$("#address1").val("");
			$("#address2").val("");
		}
	});
}
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
   <h1>회원가입</h1>
  </div>
  <div data-role="content">
   <div>
    <h2 align="center">회원가입</h2>
    <hr>
    아이디 <input id="userid" placeholder="영문, 숫자를 사용한 4~10자리로 입력"><br>
	비밀번호 <input type="password" id="passwd" placeholder="영문대소문자,숫자,특수기호(!@#$%^*+=-)를 모두 사용하여 8~12자리로 입력"><br>
	비밀번호 확인 <input type="password" id="passwd2"><br>
	이름 <input id="name" placeholder="이름은 한글만 가능합니다."><br>
	이메일 <input id="email" placeholder="abc@abc.com"><br>
	핸드폰 <input id="hp" placeholder="숫자만 입력해주세요."><br>
	우편번호 <input id="zipcode"><br>
	주소 <input id="address1"><br>
	상세주소 <input id="address2"><br>
	<button type="button" id="btnSave" onclick="check()">가입하기</button>	
   </div>
   <div id="result"></div>
   <div>
   </div>
  </div>
 </div>
</body>
</html>