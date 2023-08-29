<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<style>
section {
	position: fixed;
	top: 40px;
	left: 0;
	width: 100%;
	height: 100%;
}

h1 {
	text-align: center;
}

table {
	text-align: center;
	margin: auto;
}
</style>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<%
	String number = null;

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	Class.forName("oracle.jdbc.OracleDriver");
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "1234";
	
	conn = DriverManager.getConnection(url, user, pw);
	String sql = "select p.serial_no, p.artist_id, a.artist_name,substr(artist_birth, 1, 4), substr(artist_birth, 5, 2), substr(artist_birth, 7, 2), p.point, m.mento_name from tbl_artist_201905 a, tbl_mento_201905 m, tbl_point_201905 p where a.artist_id = p.artist_id and m.mento_id = p.mento_id order by p.serial_no asc";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
%>
<section>
	<h1>참가자목록조회</h1>
		<table border=1>
			<tr>
				<td>채점번호</td>
				<td>참가번호</td>
				<td>참가자명</td>
				<td>생년월일</td>
				<td>점수</td>
				<td>평점</td>
				<td>멘토</td>
			</tr>
			<%while(rs.next()){ 
				
				if( 90 <= rs.getInt(7)){
					number = "A";
				}else if( 80 <= rs.getInt(7)){
					number = "B";
				}else if( 70 <= rs.getInt(7)){
					number = "C";
				}else if( 60 <= rs.getInt(7)){
					number = "D";
				}else {
					number = "F";
				}
			%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4)+"년"+rs.getString(5)+"월"+rs.getString(6)+"일" %></td>
					<td><%=rs.getString(7) %></td>
					<td><%=number %></td>
					<td><%=rs.getString(8) %></td>
				</tr>
			<%} %>
		</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>