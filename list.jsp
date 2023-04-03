<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<section>
<h2><b>회원목록조회/수정</b></h2><br>
	<form>
	
	<table>
		<tr>
			<td>과목코드</td>
			<td>과목명</td>
			<td>학점</td>
			<td>담당교사</td>
			<td>요일</td>
			<td>시작시간</td>
			<td>종료시간</td>
			<td>삭제</td>
		</tr>
<%
Connection conn = null;
Statement stmt = null;
String week="";
try {
	conn = Util.getConnection();
	stmt = conn.createStatement();
	String sql = "select id, c.name as cname, credit, l.name as lname, start_hour, end_hour, week from course_tbl c join lecturer_tbl l on(c.lecturer = l.idx)";
	ResultSet rs = stmt.executeQuery(sql);
	
	while(rs.next()) {
		switch(rs.getInt("week")) {
		case 1:
			week = "월요일";
			break;
		case 2:
			week = "화요일";
			break;
		case 3:
			week = "수요일";
			break;
		case 4:
			week = "목요일";
			break;
		case 5:
			week = "금요일";
			break;
		}
		
		int shour = rs.getInt("start_hour");
		int ehour = rs.getInt("end_hour");
		String start_hour;
		String end_hour;
		String id = rs.getString("id");
		
		if(shour/100 <= 9) {
			start_hour = "0"+Integer.toString(shour);
		}
		else {
			start_hour = Integer.toString(shour);
		}
		
		
		if(ehour/100 <= 9) {
			end_hour = "0"+Integer.toString(ehour);
		}
		else {
			end_hour = Integer.toString(ehour);
		}
		
%>
		<tr>
			<td><a href="modify.jsp?id=<%=id %>"><%=rs.getString("id") %></a></td>
			<td><%=rs.getString("cname") %></td>
			<td><%=rs.getInt("credit") %></td>
			<td><%=rs.getString("lname") %></td>
			<td><%=week %></td>
			<td><%=start_hour.substring(0, 2)+"시"+start_hour.substring(2, 4)+"분" %></td>
			<td><%=end_hour.substring(0, 2)+"시"+end_hour.substring(2, 4)+"분" %></td>
			<td><a href="action.jsp?id=<%=id %>&mode=delete">삭제</a></td>
		</tr>
<%
	}
} catch(Exception e) {
	e.printStackTrace();
}
%>
	</table>
</form>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>