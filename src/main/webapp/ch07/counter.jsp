<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="common.Util" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>counter</title>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>
<%
String count=Util.getCookie(request.getCookies(), "count");
int intCount=0;

//방문 시간 저장
Date date=new Date();//날짜 객체 생성
long now_time=date.getTime();//현재 시각


String visitTime=Util.getCookie(request.getCookies(), "visit_time");
out.println(visitTime + "<br>");
out.println(visitTime.getClass().getSimpleName()+"<br>");//visitTime의 데이터타입 확인
long visit_time=0;//String 타입으로 리턴받은 방문시각을 계산할 수 있는 변수로 준비

//방문시각(visitTime)이 null이 아니고 빈문자열이 아니면 즉, 값이 있으면
if(visitTime != null && !visitTime.equals("")){
	visit_time=Long.parseLong(visitTime);//계산을 위해 String을 Long으로 변환처리
}

out.print("현재시각 : "+now_time+"<br>");
out.print("방문시각 : "+visit_time+"<br>");


if(count==null || count.equals("")){ //첫 방문일 경우
	//쿠키변수 생성 : 첫 방문일 때 초기값 1을 줌
	response.addCookie(new Cookie("count","1"));
//첫 방문시간 저장
 response.addCookie(new Cookie("visit_time",Long.toString(now_time)));

}else{//재방문일 경우
	//방문시간 변경
	long period = now_time - visit_time; //방문시간=현재시각-방문시각
	intCount = Integer.parseInt(count)+1;
	//조회수 방지를 위한 조건설정
	if(period > 3*1000){//일정시간(3초)이 경과하면 카운터 수정
		//24시간이면 24*60*60*1000
		//카운터값 변경
		response.addCookie(new Cookie("count",Integer.toString(intCount)));
	 //방문시간 업데이트
		response.addCookie(new Cookie("visit_time",Long.toString(now_time)));
	}
}
//Integer.toString(숫자) : 숫자를 문자열로
String counter=Integer.toString(intCount);


out.println("첫번째(인덱스 0) 숫자 : " + counter.charAt(0));
String img="<img src='../images/"+counter.charAt(0)+".gif'>";
out.println(img);

out.println("<br>");
for(int i=0; i<counter.length(); i++){
	String img3="<img src='../images/"+counter.charAt(i)+".gif'>";
	out.print(img3);
}
%>
</body>
</html>