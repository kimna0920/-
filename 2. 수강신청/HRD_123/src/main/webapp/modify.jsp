<%@page import="java.sql.ResultSet"%>
<%@page import="DBPKG.Util"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
<h2><b>교과목 수정</b></h2><br>

<form method="post" action="action.jsp">
<input type="hidden" name="mode" value="modify">
<table>
<%
request.setCharacterEncoding("UTF-8");
Connection conn = null;
Statement stmt = null;
String id = request.getParameter("id");
String name="";
int credit=0;
int lecturer=0;
int week=0;
int start_hour=0;
int end_hour=0;

try {
	conn = Util.getConnection();
	stmt = conn.createStatement();
	String sql = "select * from course_tbl where id = " + id;
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	name = rs.getString("name");
	credit = rs.getInt("credit");
	lecturer = rs.getInt("lecturer");
	week = rs.getInt("week");
	start_hour = rs.getInt("start_hour");
	end_hour = rs.getInt("end_hour");
} catch(Exception e) {
	e.printStackTrace();
}
%>
	<tr>
		<td>과목코드</td>
		<td><input type="text" name="id" value="<%=id %>" readonly></td>
	</tr>
	<tr>
		<td>과목명</td>
		<td><input type="text" name="name" value="<%=name %>"></td>
	</tr>
	<tr>
		<td>학점</td>
		<td><input type="text" name="credit" value="<%=credit %>"></td>
	</tr>
	<tr>
		<td>담당강사</td>
		<td>
			<select name="lecturer">
				<option value="0" >담당 강사
				<option value="1" <%if(lecturer==1) out.println("selected"); %>>[1]김교수
				<option value="2" <%if(lecturer==1) out.println("selected"); %>>[2]이교수
				<option value="3" <%if(lecturer==1) out.println("selected"); %>>[3]박교수
				<option value="4" <%if(lecturer==1) out.println("selected"); %>>[4]우교수
				<option value="5" <%if(lecturer==1) out.println("selected"); %>>[5]최교수
				<option value="6" <%if(lecturer==1) out.println("selected"); %>>[6]임교수
			</select>
		</td>
	</tr>
	<tr>
		<td>요일</td>
		<td>
		<%
			if(week==0) {
				
			}
		%>
			<input type="radio" name="week" value="1" <%if(week==1) out.println("checked"); %>> <label>월</label>
			<input type="radio" name="week" value="2" <%if(week==2) out.println("checked"); %>> <label>화</label>
			<input type="radio" name="week" value="3" <%if(week==3) out.println("checked"); %>> <label>수</label>
			<input type="radio" name="week" value="4" <%if(week==4) out.println("checked"); %>> <label>목</label>
			<input type="radio" name="week" value="5" <%if(week==5) out.println("checked"); %>> <label>금</label>
		</td>
	</tr>
	<tr>
		<td>시작 시간</td>
		<td><input type="text" name="start_hour" value="<%=start_hour %>"></td>
	</tr>
	<tr>
		<td>종료 시간</td>
		<td><input type="text" name="end_hour" value="<%=end_hour %>"></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="수정" onclick="return alert('교과목 수정이 완료되었습니다.')">
			<input type="reset" value="취소" onclick="return alert('교과목 수정이 취소되었습니다.')">
		</td>
	</tr>
</table>
</form>

</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>