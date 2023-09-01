<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<style>
	section{
		position: fixed;
		top: 65px;
		left: 0;
		width: 100%;
		height: 100%;
	}
	h1{
		text-align: center;
	}
	table{
		text-align: center;
		margin: auto;
	}
</style>
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
<% 
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	Class.forName("oracle.jdbc.OracleDriver");
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "1234";
	
	conn = DriverManager.getConnection(url, user, pw);
	String sql = "select substr(c.regist_month, 1, 4), substr(c.regist_month, 5, 2), c.c_no, m.c_name, t.class_name, c.class_area, to_char(c.tuition, '999,999,999'), m.grade from tbl_member_202201 m, tbl_class_202201 c, tbl_teacher_202201 t where m.c_no = c.c_no and t.teacher_code = c.teacher_code";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
%>
<section>
	<h1>회원정보조회</h1>
	<table border=1>
		<tr>
			<td>수강일</td>
			<td>회원번호</td>
			<td>회원명</td>
			<td>강의명</td>
			<td>강의장소</td>
			<td>수강료</td>
			<td>등급</td>
		</tr>
		<%while(rs.next()){ %>
		<tr>
			<td><%=rs.getString(1)+"년"+rs.getString(2)+"월" %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
			<td><%=rs.getString(6) %></td>
			<td><%="￦"+rs.getString(7) %></td>
			<td><%=rs.getString(8) %></td>
		</tr>
		<%} %>
	</table>
</section>
<jsp:include page="footer.jsp" />