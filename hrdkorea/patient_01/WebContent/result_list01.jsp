<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<style>
	section{
		position: fixed;
		top: 200px;
		width: 100%;
		height: 100%;
	}
</style>

<jsp:include page="header.jsp" />

<jsp:include page="nav.jsp" />
<%

request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");

	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String status = null;
	String result = null;
	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);
	String sql = "select re.p_no, pa.p_name, la.t_name, re.t_sdate, re.t_status, re.t_ldate, re.t_result from tbl_patient_202004 pa, tbl_result_202004 re, tbl_lab_test_202004 la where pa.p_no =  re.p_no and la.t_code = re.t_code";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
%>

<section>
	<table border=1>
		<tr>
			<td>환자 코드</td>
			<td>환자 이름</td>
			<td>검사 명</td>
			<td>검사 시작일</td>
			<td>검사 상태</td>
			<td>검사 완료일</td>
			<td>검사 결과</td>
		</tr>
		<%while(rs.next()){
			String year = rs.getString(4).substring(0, 4);
			String month = rs.getString(4).substring(5, 7);
			String day = rs.getString(4).substring(8, 10);
			
			String year1 = rs.getString(6).substring(0, 4);
			String month1 = rs.getString(6).substring(5, 7);
			String day1 = rs.getString(6).substring(8, 10);
			
			if(rs.getString(5).equals("1   ")){
				status = "검사중";
			}else if(rs.getString(5).equals("2   ")){
				status = "검사완료";
			}
			
			if(rs.getString(7).equals("X   ")){
				result = "미입력";
			}else if(rs.getString(7).equals("P   ")){
				result = "양성";
			}else if(rs.getString(7).equals("N   ")){
				result = "음성";
			}
		%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=year+"-"+month+"-"+day %></td>
			<td><%=status %></td>
			<td><%=year1+"-"+month1+"-"+day1 %></td>
			<td><%=result %></td>
		</tr>	
		<% } %>
	</table>
</section>

<jsp:include page="footer.jsp" /> 