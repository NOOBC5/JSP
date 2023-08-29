<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	String artist_id = request.getParameter("artist_id");
	String artist_name = request.getParameter("artist_name");
	String artist_birth = request.getParameter("year"+"month"+"day");
	String artist_gender = request.getParameter("artist_gender");
	String talent = request.getParameter("talent");
	String agency = request.getParameter("agency");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	Class.forName("oracle.jdbc.OracleDriver");
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "1234";
	
	conn = DriverManager.getConnection(url, user, pw);
	String sql = "insert into tbl_artist_201905 values(?, ?, ?, ?, ?, ?)";
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, artist_id);
	pstmt.setString(2, artist_name);
	pstmt.setString(3, artist_birth);
	pstmt.setString(4, artist_gender);
	pstmt.setString(5, talent);
	pstmt.setString(6, agency);
	pstmt.executeUpdate();
	
	response.sendRedirect("index.jsp");
%>