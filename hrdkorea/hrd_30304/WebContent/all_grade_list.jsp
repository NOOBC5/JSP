<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<style>
section {
	position: fixed;
	top: 60px;
	left: 0px;
	width: 100%;
	height: 100%;
}

h1 {
	text-align: center;
}
table{
	text-align: center;
	margin: auto;
}
</style>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<%
String sosok = null;
String grade = null;

request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

Class.forName("oracle.jdbc.OracleDriver");

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String pw = "1234";

conn = DriverManager.getConnection(url, user, pw);
String sql = "select h.registration_code, p.name, substr(p.birth_day, 1, 4), substr(p.birth_day, 5, 2), substr(p.birth_day, 7, 2), p.height, p.weight, substr(h.registration_code, 1, 1), round((((((h.hit_numbers + h.home_runs) / h.appearance) * 100) + h.home_runs) + (h.put_out + (h.double_play * 2) - (h.error_count * 5))) / 2, 0), rank() over(order by ((((h.appearance + h.home_runs) / h.hit_numbers) * 100) + h.home_runs) + (h.put_out + (h.double_play * 2) - (h.error_count * 5)) desc) from tbl_player_info p, tbl_hitter_info h where p.registration_code = h.registration_code";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
%>
<section>
	<h1>전체 타자 성적 조회</h1>
		<table border=1>
			<tr>
				<td>선수등록코드</td>
				<td>선수명</td>
				<td>생년월일</td>
				<td>키</td>
				<td>몸무게</td>
				<td>소속</td>
				<td>선수 등급</td>
				<td>순위</td>
			</tr>
			<%while(rs.next()){ 
				if(rs.getString(8).equals("A")){
					sosok = "1군";
				}else if(rs.getString(8).equals("B")){
					sosok = "2군";
				}
				
				if(90 <= rs.getInt(9) && rs.getInt(9) <= 100 ){
					grade = "A";
				}else if(80 <= rs.getInt(9) && rs.getInt(9) <= 89 ){
					grade = "B";
				}else if(70 <= rs.getInt(9) && rs.getInt(9) <= 79 ){
					grade = "C";
				}else if(60 <= rs.getInt(9) && rs.getInt(9) <= 69 ){
					grade = "D";
				}else if(rs.getInt(9) <= 59 ){
					grade = "F";
				}
			%>
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3)+"년"+rs.getString(4)+"월"+rs.getString(5)+"일" %></td>
				<td><%=rs.getString(6) %></td>
				<td><%=rs.getString(7) %></td>
				<td><%=sosok %></td>
				<td><%=grade %></td>
				<td><%=rs.getString(10) %></td>
			</tr>
			<%} %>
		</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>