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
			<td>선수이름</td>
			<td>포지션</td>
			<td>팀이름</td>
			<td>경기장이름</td>
			<td>좌석 수</td>
		</tr>
<%
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	String sql = "select p.player_name, p.player_position, t.team_name, s.stadium_name, s.stadium_count "+ 
	"FROM tbl_player_20221205 p, tbl_stadium_20221205 s, tbl_team_20221205 t "+
	"WHERE p.team_id = t.team_id AND t.stadium_id = s.stadium_id AND s.stadium_count >= 30000";
	PreparedStatement ps = conn.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	while(rs.next()){
		String position = rs.getString(2);
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
			<td>☞<%=rs.getString("player_name") %></td>
			<td><%=position %></td>
			<td><%=rs.getString("team_name") %></td>
			<td><%=rs.getString("stadium_name") %></td>
			<td><%=rs.getInt("stadium_count") %></td>
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