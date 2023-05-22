<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h2>선수관리</h2>
	<table border="1">
		<tr>
			<td>선수ID</td>
			<td>선수이름</td>
			<td>포지션</td>
			<td>선수등록일</td>
			<td>팀 이름</td>
		</tr>
<%
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	String sql = "select * from tbl_player_20221205, tbl_team_20221205 WHERE tbl_player_20221205.team_id = tbl_team_20221205.team_id";
	PreparedStatement ps = conn.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	while(rs.next()){
		String date1 = rs.getString("player_date");
		String date2 = date1.substring(0,4) + "년" + date1.substring(4,6) + "월" + date1.substring(6,8) + "일";
		String position = rs.getString("player_position");
		switch(position){
		case "GK":
			position = "골기퍼";
			break;
		case "DF":
			position = "수비수";
			break;
		case "MF":
			position = "미드필더";
			break;
		case "FW":
			position = "공격수";
			break;
		}
%>
		<tr>
			<td><a href="modify.jsp?pid=<%=rs.getString("player_id") %>"><%=rs.getString("player_id") %></a></td>
			<td>☞<%=rs.getString("player_name") %></td>
			<td><%=position %></td>
			<td><%=date2 %></td>
			<td><%=rs.getString("team_name") %></td>
		</tr>
<%
	}
}catch(Exception e){
	e.printStackTrace();
}
%>
	</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>