<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
	<h2>멘토 점수 조회</h2>
	<table>
		<tr>
			<td>채점번호</td>
			<td>참가번호</td>
			<td>참가자명</td>
			<td>생년월일</td>
			<td>점수</td>
			<td>평점</td>
			<td>멘토명</td>
		</tr>
<%
String grade = "";
int score = 0;
try (Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
    PreparedStatement pstmt = con.prepareStatement("SELECT * FROM tbl_artist_201905, tbl_mento_201905, tbl_point_201905 WHERE tbl_artist_201905.artist_id = tbl_point_201905.artist_id AND tbl_mento_201905.mento_id = tbl_point_201905.mento_id");
    ResultSet rs = pstmt.executeQuery();) {
    while(rs.next()){
        score = rs.getInt("score");
        if(score < 60){
            grade  = "F";
        }
        else if(score < 70){
            grade  = "D";
        }
        else if(score < 80){
            grade  = "C";
        }
        else if(score < 90){
            grade  = "B";
        }
        else{
            grade  = "A";
        }
%>
		<tr>
			<td><%=rs.getString("serial_no") %></td>
			<td><%=rs.getString("artist_no") %></td>
			<td><%=rs.getString("artist_name") %></td>
			<td><%=rs.getString("birth") %></td>
			<td><%=score %></td>
			<td><%=grade %></td>
			<td><%=rs.getString("serial_no") %></td>
		</tr>
<%
    }
} catch(Exception e){
    e.printStackTrace();
}
%>
	</table>
</section>
</body>
</html>
