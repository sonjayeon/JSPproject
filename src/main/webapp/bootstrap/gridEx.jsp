<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>gridEx</title>
<%@ include file="../include/header.jsp" %>

<script type="text/javascript">
function winSize(){
	var w=window.innerWidth; //outerWidth(바깥쪽 넓이값)
	var h=window.innerHeight; //outerHeight(바깥쪽 높이) 
	var txt="현재 브라우저 크기 : 가로="+w+",세로="+h;
	document.getElementById("result").innerHTML = txt;
}
</script>
</head>
<body onresize="winSize()">
<h2 id="result"></h2>
<h2>부트 스트랩 그리드 시스템</h2>
<p>Bootstrap의 그리드 시스템은 페이지에 최대 12개의 열을 허용한다.</p>
<p>효과를 보려면 브라우저 창의 크기를 조절합니다.</p>
<div class="row bg-primary">
 <div class="col-md-1">.col-md-1</div>
 <div class="col-md-1">.col-md-1</div>
 <div class="col-md-1">.col-md-1</div>
 <div class="col-md-1">.col-md-1</div>
 <div class="col-md-1">.col-md-1</div>
 <div class="col-md-1">.col-md-1</div>
 <div class="col-md-1">.col-md-1</div>
 <div class="col-md-1">.col-md-1</div>
 <div class="col-md-1">.col-md-1</div>
 <div class="col-md-1">.col-md-1</div>
 <div class="col-md-1">.col-md-1</div>
 <div class="col-md-1">.col-md-1</div>
</div>
<div class="row bg-secondary">
 <div class="col-md-8" >.col-md-8</div>
 <div class="col-md-4" >.col-md-4</div>
</div>
<div class="row bg-warning">
 <div class="col-md-4" >.col-md-4</div>
 <div class="col-md-4" >.col-md-4</div>
 <div class="col-md-4" >.col-md-4</div>
</div>
<div class="row bg-success">
 <div class="col-md-6" >.col-md-6</div>
 <div class="col-md-6" >.col-md-6</div>
</div>

</body>
</html>