<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<style>
	section{
		position: fixed;
		top: 70px;
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
	String sql = "select sa.pcode, p.pname, to_char(sum(sa.amount * p.cost), '999,999,999') from tbl_salelist_01 sa, tbl_shop_01 sh, tbl_pizza_01 p where sa.scode = sh.scode and sa.pcode = p.pcode group by sa.pcode, p.pname order by to_char(sum(sa.amount * p.cost), '999,999,999') desc";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
%>
<section>
	<h1>상품별 매출 현황</h1>
	<table border=1>
		<tr>
			<td>피자 코드</td>
			<td>피자 명</td>
			<td>총매출액</td>
		</tr>
		<%while(rs.next()){ %>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%="￦"+rs.getString(3) %></td>
		</tr>
		<%} %>
	</table>
</section>
<jsp:include page="footer.jsp" />