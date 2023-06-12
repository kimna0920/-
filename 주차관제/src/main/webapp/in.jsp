<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<script type="text/javascript" src="check.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<h2>차량입차</h2>
<form action="i-action.jsp" name="frm2" method ="get">
	<table border="1">
		<tr>
			<td>차량번호</td>
			<td>
				<input type="text" name="car_number">예)22가1111
			</td>
		</tr>
		<tr>
			<td>소유자이름</td>
			<td>
				<input type="text" name="owner_name">예)백선수
			</td>
		</tr>
		<tr>
			<td>주차위치선택</td>
			<td>
				<input type="radio" name="location" value="AA01">AA01
				<input type="radio" name="location" value="AA02">AA02
				<input type="radio" name="location" value="AA03">AA03
				<input type="radio" name="location" value="AA04">AA04
				<input type="radio" name="location" value="AA05">AA05
			</td>
		</tr>
		<tr>
			<td>입차시간</td>
			<td>
				<input type="text" name="entrance_time">예)22:22
			</td>
		</tr>
		<tr>
			<td colspan="2">
					<input type="submit" value="입차등록" onclick="insert()">
					<input type="reset" value="다시쓰기">
			</td>
		</tr>
	</table>
</form>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>