<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String pid = request.getParameter("player_id");
String pname = request.getParameter("player_name");
String position = request.getParameter("player_position");
String pdate = request.getParameter("player_date");
String tid = request.getParameter("team_id");
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	String sql = "UPDATE tbl_player_20221205 SET player_name=?, player_position =?, player_date =?, team_id =? "+
			"where  player_id=?";
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, pname);
	ps.setString(2, position);
	ps.setString(3, pdate);
	ps.setString(4, tid);
	ps.setString(5, pid);
	ps.executeUpdate();
%>
<jsp:forward page="list.jsp"></jsp:forward>
<%
}catch(Exception e){
	e.printStackTrace();
}
%>