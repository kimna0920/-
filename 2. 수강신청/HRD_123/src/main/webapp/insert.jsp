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
<script type="text/javascript" src="check.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<section>
<h2><b>교과목 추가</b></h2><br>

<form method="post" action="action.jsp" name="frm">
<input type="hidden" name="mode" value="insert">
<table>
	<tr>
		<td>과목코드</td>
		<td><input type="text" name="id"></td>
	</tr>
	<tr>
		<td>과목명</td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>학점</td>
		<td><input type="text" name="credit"></td>
	</tr>
	<tr>
		<td>담당강사</td>
		<td>
		<select name="lecturer">
			<option value="0">담당 강사
			<option value="1">[1]김교수
			<option value="2">[2]이교수
			<option value="3">[3]박교수
			<option value="4">[4]우교수
			<option value="5">[5]최교수
			<option value="6">[6]임교수
		</select>
		</td>
	</tr>
	<tr>
		<td>요일</td>
		<td>
			<input type="radio" name="week" value="1" > <label>월</label>
			<input type="radio" name="week" value="2" > <label>화</label>
			<input type="radio" name="week" value="3" > <label>수</label>
			<input type="radio" name="week" value="4" > <label>목</label>
			<input type="radio" name="week" value="5" > <label>금</label>
		</td>
	</tr>
	<tr>
		<td>시작 시간</td>
		<td><input type="text" name="start_hour"></td>
	</tr>
	<tr>
		<td>종료 시간</td>
		<td><input type="text" name="end_hour"></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="추가" onclick="return check()">
			<input type="reset" value="취소" onclick="return alert('교과목 추가가 취소되었습니다.')">
		</td>
	</tr>
</table>
</form>

</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>