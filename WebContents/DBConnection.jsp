 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%
    /* POST 방식 한글깨짐 방지 */ 
	request.setCharacterEncoding("UTF-8");

    Class.forName("oracle.jdbc.OracleDriver");
    String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
	String  dbuser = "test01";	
	String  dbpwd  = "1234";
	String  sql  = "";

	Connection        conn = DriverManager.getConnection(dburl, dbuser, dbpwd);
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	out.print("Database 접속에 성공하였습니다");

%>












