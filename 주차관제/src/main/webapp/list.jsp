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
<table border="1">
	<tr>
		<td>차량번호</td>
		<td>차량종류</td>
		<td>소유주이름</td>
		<td>주차위치</td>
		<td>입차시간</td>
		<td>출차시간</td>
	</tr>
<%
request.setCharacterEncoding("UTF-8");
String car_number = request.getParameter("car_number");
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system","1234");
	String sql = "select c.car_number, c.car_name, c.owner_name, p.location, p.entrance_time, p.departure_time " +
	"from tbl_car_202301 c, tbl_parking_202301 p " +
	"where trim(p.car_number) = ? and c.car_number = p.car_number";
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, car_number);
	ResultSet rs = ps.executeQuery();

	rs.next();
	System.out.println(rs.getString(1));
%>
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><%=rs.getString(6) %></td>
	</tr>
<%
}catch(Exception e){
	e.printStackTrace();
}
%>
</table>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>