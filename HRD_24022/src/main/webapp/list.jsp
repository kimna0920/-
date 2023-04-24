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
	<h2>제품조회</h2>
	<table border="1">
		<tr>
			<td>제품코드</td>
			<td>제품명</td>
			<td>사이즈</td>
			<td>매입단가</td>
			<td>출고단가</td>
		</tr>
<%
try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system", "1234");
		String sql = "select * from tbl_product_202002";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery(sql);
		while(rs.next()){
			
%>
		<tr>
			<td><%=rs.getString("p_code") %></td>
			<td><%=rs.getString("p_name") %></td>
			<td><%=rs.getInt("p_size") %></td>
			<td><%=rs.getInt("p_incost") %></td>
			<td><%=rs.getInt("p_outcost") %></td>
		</tr>	
<%
		}
} catch(Exception e){
		e.printStackTrace();
	}
%>

	</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>