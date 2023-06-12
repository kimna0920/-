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
	<h2>차량조회</h2>
	<form name="frm" method="get" action="list.jsp">
		<table border="1">
			<tr>
				<td>
					차량번호 입력
				</td>
				<td>
					<input type="text" name="car_number">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="차량조회" onclick="serch()">
					<input type="button" value="홈으로" onclick="index()">
				</td>
			</tr>
		</table>
	</form>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>