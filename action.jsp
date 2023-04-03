<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
Connection conn = null;
Statement stmt = null;
String mode=request.getParameter("mode");
String id = request.getParameter("id");
String name = request.getParameter("name");
int credit=0;
int lecturer=0;
int week=0;
int start_hour=0;
int end_hour=0;
try {
	conn = Util.getConnection();
	stmt = conn.createStatement();
	String sql = "";
	switch(mode) {
	case "delete":
		sql = "delete from course_tbl where id = '"+id+"'";
		stmt.executeUpdate(sql);
%>
		<jsp:forward page="list.jsp"></jsp:forward>
<%
		break;
	case "modify":
		System.out.println("check01 : ");
		credit=Integer.parseInt(request.getParameter("credit"));
		System.out.println("check02 : ");
		lecturer=Integer.parseInt(request.getParameter("lecturer"));
		System.out.println("check03 : ");
		week=Integer.parseInt(request.getParameter("week"));
		start_hour=Integer.parseInt(request.getParameter("start_hour"));
		end_hour=Integer.parseInt(request.getParameter("end_hour"));
		System.out.println("credit : "+credit);
		sql = String.format("update course_tbl set name='%s', credit=%d, lecturer=%d, week=%d, start_hour=%d, end_hour=%d where id='%s'",
							name, credit, lecturer, week, start_hour, end_hour, id);
		stmt.executeUpdate(sql);
%>
		<jsp:forward page="modify.jsp"></jsp:forward>
<%
		break;
	case "insert":
		System.out.println("id : "+id);
		credit=Integer.parseInt(request.getParameter("credit"));
		System.out.println("check02 : ");
		lecturer=Integer.parseInt(request.getParameter("lecturer"));
		System.out.println("check03 : ");
		week=Integer.parseInt(request.getParameter("week"));
		start_hour=Integer.parseInt(request.getParameter("start_hour"));
		end_hour=Integer.parseInt(request.getParameter("end_hour"));
		System.out.println("credit : "+credit);
		
		sql = String.format("insert into course_tbl values('%s', '%s', %d, %d, %d, %d, %d)",
				id, name, credit, lecturer, week, start_hour, end_hour);
		stmt.executeUpdate(sql);
	}
	
} catch(Exception e) {
	e.printStackTrace();
}
%>
</body>
</html>