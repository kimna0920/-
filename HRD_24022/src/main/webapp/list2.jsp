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
			<td>입출고번호</td>
			<td>제품코드</td>
			<td>제품명</td>
			<td>입출고구분</td>
			<td>수량</td>
			<td>거래처</td>
			<td>거래일자</td>
		</tr>
<%
try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system", "1234");
		String sql = "SELECT t_no, tp.p_code, p_name, t_type, t_cnt, tc.c_name, t_date "+
				"FROM tbl_product_202002 tp, tbl_company_202002 tc, tbl_inout_202002 ti "+
				"WHERE ti.p_code = tp.p_code AND ti.c_code = tc.c_code ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery(sql);
		while(rs.next()){
			
%>
		<tr>
			<td><%=rs.getString("t_no") %></td>
			<td><%=rs.getString("p_code") %></td>
			<td><%=rs.getString("p_name") %></td>
			<td><%=rs.getString("t_type") %></td>
			<td><%=rs.getString("t_cnt") %></td>
			<td><%=rs.getString("c_name") %></td>
			<td><%=rs.getDate("t_date") %></td>
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