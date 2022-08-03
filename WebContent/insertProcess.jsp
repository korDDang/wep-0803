<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp"%>
<%
String sNo=request.getParameter("sNo");
String sName=request.getParameter("sName");
String kor=request.getParameter("kor");
String eng=request.getParameter("eng");
String math=request.getParameter("math");
String hist=request.getParameter("hist");
try{
	String sql="insert into score0803 values(?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, sNo);
	pstmt.setString(2, sName);
	pstmt.setString(3, kor);
	pstmt.setString(4, eng);
	pstmt.setString(5, math);
	pstmt.setString(6, hist);
	pstmt.executeUpdate();
	%><script>
	alert("성저입력이 완료 되었습니다!");
	location.href="select.jsp";
	</script>
	<% 
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("등록 실패");
}

%>
</body>
</html>