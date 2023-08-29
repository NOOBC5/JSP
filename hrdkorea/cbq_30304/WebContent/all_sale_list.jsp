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
	String sql = "select sa.saleno, sa.scode, sh.sname, to_char(sa.saledate, 'YYYY-MM-DD'), sa.pcode, p.pname, sa.amount, to_char((p.cost * sa.amount), '999,999,999') from tbl_salelist_01 sa, tbl_shop_01 sh, tbl_pizza_01 p where sa.scode = sh.scode and sa.pcode = p.pcode order by sa.saleno asc";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
%>
<section>
	<h1>통합매출현황조회</h1>
	<table border=1>
		<tr>
			<td>매출전표번호</td>
			<td>지점</td>
			<td>판매일자</td>
			<td>피자코드</td>
			<td>피자명</td>
			<td>판매수량</td>
			<td>매출액</td>
		</tr>
		<%while(rs.next()){ %>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2)+"-"+rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
			<td><%=rs.getString(6) %></td>
			<td><%=rs.getString(7) %></td>
			<td><%="￦"+rs.getString(8) %></td>
		</tr>
		<%} %>
	</table>
</section>
<jsp:include page="footer.jsp" />