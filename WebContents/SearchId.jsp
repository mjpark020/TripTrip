<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="DBConnection.jsp" %>

<%
   // 넘어온 값 저장
   // custno,custname,phone,address,joindate,grade,city
   request.setCharacterEncoding("UTF-8");
   
	String	name	= request.getParameter("name");
	String	email	= request.getParameter("email");
	
	System.out.println(name);

	sql     =  "SELECT MEM_ID, MEM_NAME, EMAIL";
	sql    +=  " FROM TRIPMEMBER";
	sql    +=  " WHERE  MEM_NAME = ? AND EMAIL = ?";
	
	pstmt   =  conn.prepareStatement( sql );

	System.out.println(email);
	
	pstmt.setString(1, name );
	pstmt.setString(2, email);
	rs   =	pstmt.executeQuery();
	String sname = null;
	String semail = null;
	String id = null;
	if(rs.next()){

	sname = rs.getString("MEM_NAME");
	semail = rs.getString("EMAIL");
	id = rs.getString("MEM_ID"); 
	}
		String tag ="";
		System.out.println(id);
	if(name.equals(sname) && email.equals(semail)) {
	
		tag = "<script>";
		tag += "alert('아이디는 : ";
		tag += id; 		
		tag += " 입니다. ');";
		tag += "location.href = \"Login.html\"";
		tag += "</script>";
		System.out.println("성공");
		
	}else{
		tag ="<script>";
		tag += "alert('이름 또는 이메일이 일치하지 않습니다');";
		tag +=" location.href = \"findid.html\"";
		tag +="</script>";
	}
		out.print(tag);
		System.out.println(tag);
%>