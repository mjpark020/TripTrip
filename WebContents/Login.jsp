<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="DBConnection.jsp" %>

<%
   // 넘어온 값 저장
   // custno,custname,phone,address,joindate,grade,city
   request.setCharacterEncoding("UTF-8");
   
	String   id  = request.getParameter("id");
	String pass = request.getParameter("pass");
	


	sql     =  " SELECT MEM_ID,MEM_PWD,MEM_NAME ";
	sql    +=  " FROM TRIPMEMBER";
	sql    +=  " WHERE  MEM_ID = ?";
	
	pstmt   =  conn.prepareStatement( sql );

	
	pstmt.setString(1, id );
	rs   =	pstmt.executeQuery();
	String sid;
	String spass;
	String name;
	
	rs.next();

	sid = rs.getString("MEM_ID");
	spass = rs.getString("MEM_PWD");
	name = rs.getString("MEM_NAME"); 
    
	String tag ="";
	
	
	if(id.equals(sid) && pass.equals(spass)){

		session.setAttribute("uid", sid); 
		tag = "<script>";
		tag += "alert('환영합니다');";
		tag += "location.href = \"frontpage.jsp\"";
		tag += "</script>";
		System.out.println("성공");
		System.out.println(sid);
		
	}else{
		tag ="<script>";
		tag += "alert('아이디또는 비밀번호가 일치하지 않습니다')";
		tag +=" location.href = \"Login.html\"";
		tag +="</script>";
	}
		out.print(tag);
		System.out.println(tag);
%>




















 