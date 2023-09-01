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
	String sql = "select c.teacher_code, t.class_name, t.teachar_name, to_char(sum(c.tuition), '999,999,999') from tbl_teacher_202201 t, tbl_class_202201 c where t.teacher_code = c.teacher_code group by c.teacher_code, t.class_name, t.teachar_name order by c.teacher_code asc";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
%>
<section>
	<h1>강사매출현황</h1>
	<table border=1>
		<tr>
			<td>강사코드</td>
			<td>강의명</td>
			<td>강사명</td>
			<td>총매출</td>
		</tr>
		<%while(rs.next()){ %>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%="￦"+rs.getString(4) %></td>
		</tr>
		<%} %>
	</table>
</section>
<jsp:include page="footer.jsp" />