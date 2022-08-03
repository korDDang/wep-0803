<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.math.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>성적조회</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section class="sec1">
<br>
<h2>성적조회목록</h2>
<br>
<hr>
<table border="1" class="tab2">
<tr>
	<th>학년</th>
	<th>반</th>
	<th>번호</th>
	<th>성명</th>
	<th>국어</th>
	<th>영어</th>
	<th>수학</th>
	<th>역사</th>
	<th>총점</th>
	<th>평균</th>
</tr>
<%
DecimalFormat fo=new DecimalFormat("0.###");
fo.setRoundingMode(RoundingMode.FLOOR);
int total=0;
double cnt=0;
int kor2=0;
int math2=0;
int eng2=0;
int hist2=0;
int total2=0;
double korcnt=0;
double mathcnt=0;
double histcnt=0;
double engcnt=0;
double totalcnt=0;
 try{
	 String sql="select * from score0803";
	 pstmt=conn.prepareStatement(sql);
	 rs=pstmt.executeQuery();
	 while(rs.next()){
		 String sNo=rs.getString(1);
		 String sno=sNo.substring(0,1);
		 String sno1=sNo.substring(1,3);
		 String sno2=sNo.substring(3,5);
		 String sName=rs.getString(2);
		 int kor=rs.getInt(3);
		 double kor1=rs.getDouble(3);
		 int eng=rs.getInt(4);
		 double eng1=rs.getDouble(4);
		 int math=rs.getInt(5);
		 double math1=rs.getDouble(5);
		 int hist=rs.getInt(6);
		 double hist1=rs.getDouble(6);
		total=kor+eng+math+hist;
		cnt=(kor1+eng1+math1+hist1)/4;
		kor2+=kor;
		eng2+=eng;
		math2+=math;
		hist2+=hist;
		total2=kor2+eng2+math2+hist2;
		korcnt+=kor1;
		mathcnt+=math1;
		histcnt+=hist1;
		engcnt+=eng1;
		totalcnt=(korcnt+mathcnt+histcnt+engcnt)/4;
%>
<tr>
	<td><%=sno %></td>
	<td><%=sno1%></td>
	<td><%=sno2 %></td>
	<td><%=sName %></td>
	<td><%=kor %></td>
	<td><%=eng %></td>
	<td><%=math %></td>
	<td><%=hist %></td>
	<td><%=total %></td>
	<td><%=fo.format(cnt)%></td>
</tr>
<%
	 }
	 }catch(SQLException e){
		 e.printStackTrace();
		 System.out.println("조회 실패");
	 }
%>
<tr>
	<td></td>
	<td></td>
	<td></td>
	<td>총점</td>
	<td><%=kor2%></td>
	<td><%=eng2 %></td>
	<td><%=math2 %></td>
	<td><%=hist2 %></td>
	<td><%=total2 %></td>
	<td><%=totalcnt %></td>
</tr>
<%
double avkor=0;
double aveng=0;
double avmath=0;
double avhist=0;
double avtotal=0;
double avcnt=0;
try{
	String sql="select avg(kor),avg(eng),avg(math),avg(hist) from score0803";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		avkor=rs.getDouble(1);
		 aveng=rs.getDouble(2);
		 avmath=rs.getDouble(3);
		 avhist=rs.getDouble(4);
		 avtotal=avkor+aveng+avmath+avhist;
		 avcnt=avtotal/4;
	}
}catch(Exception e){
	e.printStackTrace();
}
%>
<tr>
	<td></td>
	<td></td>
	<td></td>
	<td>총평균</td>
	<td><%=fo.format(avkor) %></td>
	<td><%=fo.format(aveng) %></td>
	<td><%=fo.format(avmath) %></td>
	<td><%=fo.format(avhist) %></td>
	<td><%=fo.format(avtotal) %></td>
	<td><%=fo.format(avcnt) %></td>
</tr>

</table>
<hr>
</section>
<%@ include file="footer.jsp" %>

</body>
</html>