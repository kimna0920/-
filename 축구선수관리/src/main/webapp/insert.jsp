<%@ page import="java.sql.*" %>
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
<%
request.setCharacterEncoding("UTF-8");
String pid = request.getParameter("pid");
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	String sql = "Select max(player_id) + 1 from tbl_player_20221205";
	PreparedStatement ps = conn.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	rs.next();
	
%>
	<h2>선수 등록</h2>
	<form action="i-action.jsp" method="get" name="frm">
		<table border="1">
			<tr>
				<td>선수ID</td>
				<td><input type="text" name="player_id" value="<%=rs.getString(1) %>"></td>
			</tr>
			<tr>
				<td>선수이름</td>
				<td><input type="text" name="player_name"></td>
			</tr>
			<tr>
				<td>선수포지션</td>
				<td>
					<input type="radio" name="player_position" value="GK">골키퍼
					<input type="radio" name="player_position" value="DF">수비수
					<input type="radio" name="player_position" value="MF">미드필더
					<input type="radio" name="player_position" value="FW">공격수
				</td>
			</tr>
			<tr>
				<td>선수등록일</td>
				<td><input type="text" name="player_date"></td>
			</tr>
			<tr>
				<td>선수소속팀</td>
				<td>
					<select name="team_id">
						<option value="K00">무소속</option>
						<option value="K01">울산현대</option>
						<option value="K02">삼성블루윙즈</option>
						<option value="K03">스틸러스</option>
						<option value="K04">유나이티드</option>
						<option value="K05">현대모터스</option>
						<option value="K06">부산소마고</option>
						<option value="K07">드래곤즈</option>
						<option value="K08">일화천마</option>
						<option value="K09">FC서울</option>
						<option value="K10">시티즌</option>
						<option value="K11">경남FC</option>
						<option value="K12">광주상무</option>
						<option value="K13">강원FC</option>
						<option value="K14">제주유나이티드FC</option>
						<option value="K15">대구FC</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="수정" onclick="return modify()">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
<%
}
catch(Exception e){
	e.printStackTrace();
}
%>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>