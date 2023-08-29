<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%	
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	String saleno = request.getParameter("saleno");
	String scode = request.getParameter("scode");
	String saledate = request.getParameter("saledate");
	String pcode = request.getParameter("pcode");
	String amount = request.getParameter("amount");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	Class.forName("oracle.jdbc.OracleDriver");
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "1234";
	
	conn = DriverManager.getConnection(url, user, pw);
	String sql = "insert into tbl_salelist_01 values(?, ?, ?, ?, ?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, saleno);
	pstmt.setString(2, scode);
	pstmt.setString(3, saledate);
	pstmt.setString(4, pcode);
	pstmt.setString(5, amount);
	pstmt.executeUpdate();
	
	response.sendRedirect("index.jsp");
%>