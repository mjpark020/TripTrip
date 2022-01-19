<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="DBConnection.jsp" %>

<%
   // 넘어온 값 저장
   // custno,custname,phone,address,joindate,grade,city
   request.setCharacterEncoding("UTF-8");
   
	String	id	= request.getParameter("id");
	String	email	= request.getParameter("email");
	
	System.out.println(id);

	sql     =  "SELECT MEM_PWD, MEM_ID, EMAIL";
	sql    +=  " FROM TRIPMEMBER";
	sql    +=  " WHERE  MEM_ID = ? AND EMAIL = ?";
	
	pstmt   =  conn.prepareStatement( sql );

	System.out.println(email);
	
	pstmt.setString(1, id );
	pstmt.setString(2, email);
	rs   =	pstmt.executeQuery();
	String sid = null;
	String semail = null;
	String pass = null;
	if(rs.next()){

	sid = rs.getString("MEM_ID");
	semail = rs.getString("EMAIL");
	pass = rs.getString("MEM_PWD"); 
	}
		String tag ="";
		System.out.println(id);
	if(id.equals(sid) && email.equals(semail)) {
	
		tag = "<script>";
		tag += "alert('비밀번호는 : ";
		tag += pass; 		
		tag += " 입니다. ');";
		tag += "location.href = \"Login.html\"";
		tag += "</script>";
		System.out.println("성공");
		
	}else{
		tag ="<script>";
		tag += "alert('아이디 또는 이메일이 일치하지 않습니다');";
		tag +=" location.href = \"findpwd.html\"";
		tag +="</script>";
	}
		out.print(tag);
		System.out.println(tag);
%>