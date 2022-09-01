<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
1) JSTL(Jsp Standard Tag Library, JSP 표준 태그 라이브러리)
2) JSTL 사용 이유 : model1은 jsp페이지 중심, model2은 java code(서블릿, 모델) 중심
jsp웹페이지에서 java 코드를 안 쓸 수는 없지만 이를 최소화 하기 위해 JSTL과 EL기법을 씀,
즉 JSP 내부의 복잡한 자바 코드를 대체하기 위한 태그
3) taglib prefix="태그 접두어" uri="태그 라이브러리의 식별자"
4) Core tag(핵심태그, 제일 자주 사용되는 태그들) => 태그 접두어로 접근
 -->    
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<c:set var="path" value="${ pageContext.request.contextPath }" />

<script src="${path}/include/jquery-3.6.0.min.js"></script>
<script src="${path}/include/js/bootstrap.js"></script>
<link rel="stylesheet" href="${path}/include/css/bootstrap.css">