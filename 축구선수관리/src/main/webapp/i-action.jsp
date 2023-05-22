<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String player_id = request.getParameter("player_id");
String player_name = request.getParameter("player_name");
String player_position = request.getParameter("player_position");
String player_date = request.getParameter("player_date");
String team_id = request.getParameter("team_id");
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	String sql = "insert into tbl_player_20221205 values(?,?,?,?,?)";
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1,player_id);
	ps.setString(2,player_name);
	ps.setString(3,player_position);
	ps.setString(4,player_date);
	ps.setString(5,team_id);
	ps.executeUpdate();

%>
<jsp:forward page="list.jsp"></jsp:forward>
<%
}catch(Exception e){
	e.printStackTrace();
}
%>