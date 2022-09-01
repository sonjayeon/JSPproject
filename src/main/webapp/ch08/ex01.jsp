<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01</title>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>
<!-- 
1) EL특징 : JSP에 내장되어 있다. 코드가 깔끔하다. 제어문(조건문, 반복문)의 기능이 없다.
간단한 계산은 가능하다.
2) JSTL의 특징 : 외부 라이브러리(JAR 파일)가 필요, 조건 제어문, 복잡한 연산이 가능하다.
따라서 EL은 단독으로 쓰이지 않고 JSTL과 혼합해서 쓴다.
 -->
 
 <!-- #{변수 or 수식} -->
 <!-- EL은 간단한 사칙연산 및 삼항연산 등은 가능하다. -->
 ${2 + 5 }<br>
 ${4 / 5 }<br>
 ${7 mod 5 }<br> <!-- 나머지 연산 -->
 ${2 < 3 }<br>
 ${3.1 le 3.2 }<br> <!-- LEss(작다) -->
 ${(5>3)? 5 : 3 }<br> <!-- 삼항연산자 -->
 
</body>
</html>