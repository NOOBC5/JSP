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
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");

String registration_code = request.getParameter("registration_code");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

Class.forName("oracle.jdbc.OracleDriver");

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String pw = "1234";

conn = DriverManager.getConnection(url, user, pw);
String sql = "select p.registration_code, p.name, h.game_numbers, h.appearance, h.hit_numbers, h.home_runs, round(((((h.hit_numbers + h.home_runs) / h.appearance) * 100) + home_runs), 2), h.put_out, h.double_play, h.error_count, h.put_out + (h.double_play * 2) - (h.error_count * 5) from tbl_player_info p, tbl_hitter_info h where p.registration_code = h.registration_code and p.registration_code = ?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, registration_code);
pstmt.executeUpdate();
rs = pstmt.executeQuery();
%>
<section>
	<h1>선수 등록 코드 : <%=registration_code %> 성적조회</h1>
		<table border=1>
			<tr>
				<td>선수등록코드</td>
				<td>선수명</td>
				<td>게임 수</td>
				<td>타석 수</td>
				<td>안타 수</td>
				<td>홈런 수</td>
				<td>공격 포인트</td>
				<td>아웃카운트 수</td>
				<td>더블플레이 수</td>
				<td>에러 수</td>
				<td>수비 포인트</td>
			</tr>
			<%while(rs.next()){ %>
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
				<td><%=rs.getString(6) %></td>
				<td><%=rs.getString(7) %></td>
				<td><%=rs.getString(8) %></td>
				<td><%=rs.getString(9) %></td>
				<td><%=rs.getString(10) %></td>
				<td><%=rs.getString(11) %></td>
			</tr>
			<%} %>
		</table>
		<input type="button" value="돌아가기 " onclick="location.href='index.jsp';">
</section>
<jsp:include page="footer.jsp"></jsp:include>