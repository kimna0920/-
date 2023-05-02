<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h2>참가자 목록 조회</h2>
	<table border="1">
		<tr>
			<td>참가번호</td>
			<td>참가자명</td>
			<td>생년월일</td>
			<td>성별</td>
			<td>특기</td>
			<td>소속사</td>
		</tr>
<%
String gender = "";
String talent = "";
 try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection
				("jdbc.oracle:thin:@//localhost:1521/xe", "system", "1234");
		String sql = "select * from tbl_artist_201905";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery(sql);
	 while(rs.next()){
	 	gender = rs.getString("gender");
	 	switch(gender){
	 	case "F":
	 		gender = "여";
	 		break;
	 	case "M":
	 		gender = "남";
	 		break;
	 	}
	 	
	 	switch(talent){
	 	case "1":
	 		talent = "보컬";
	 		break;
	 	case "2":
	 		talent = "댄스";
	 		break;
	 	case "3":
	 		talent = "랩";
	 		break;
	 	}
 
%>
	<tr>
		<td><%=rs.getString("artist_id") %></td>
		<td><%=rs.getString("artist_name") %></td>
		<td><%=rs.getString("birth") %></td>
		<td><%=gender %></td>
		<td><%=talent %></td>
		<td><%=rs.getString("agency") %></td>
	</tr>
<%
 	}
 }	catch(Exception e){
		e.printStackTrace();
	}
%>
	</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>