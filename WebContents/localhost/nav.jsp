<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String uid = (String)session.getAttribute("uid");
	request.setAttribute("Writer",uid);
	System.out.println("nav uid = "+uid);
	
	String insertCont = null;
	
	String outhtml = "";
	String myhtml  = "";
	// 로그인되엇을때
	 if(uid != null && !(uid.equals("")) && !(uid.equals("null")) ){ 
	    myhtml  = "<a href=\"MyPage.html\">내 정보</a>";
	    
	    
	    /* <div class="alertBox">
	    <div class="tri"></div>
	    <span>글</span>
	    <button id="outyes">예</button>
	    <button id="outno">아니오</button>
	  	</div> */
	    
	    
		outhtml = "<li class=\"menu\">";
		outhtml += "<a id=\"logout\" href=\"#\">로그아웃</a>";
		outhtml += "<div class=\"alertBox\">";
		outhtml += "<div class=\"tri\"></div>";
		outhtml += "<span>로그아웃 하시겠습니까?</span>";
		outhtml += "<button id=\"outyes\">예</button>";
		outhtml += "<button id=\"outno\">아니오</button>";
		outhtml += "</div>";
		outhtml += "</li>";
		System.out.println("로그인 성공");
		insertCont = "location.href ='write.jsp'";
	 } else {	// 로그인되징 않았을대
		myhtml  = "<a href=\"Login.html\">로그인</a>";
		outhtml = "";
		/* session.invalidate();  */
		System.out.println("로그인 실패");
		insertCont = "location.href ='Login.html'";
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> <!-- 80 -->
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<style>
	#topnav {
		background: linear-gradient( to right, rgba(255, 77, 46,0.8), rgba(255, 155, 47,0.8) );
		position: fixed;
		width: 100%;
		height: 60px;
		top:0px;
		left:0px;
		z-index:99;
	}
	.logoTitle {
		/* float: left; */
		margin: 20px;
		color: white;
		line-height: 10px;
		font-weight: bold;
		display: inline-block;
		padding: 10px;
	
	}
	#topmenus {
		float: right;
		font-weight: bold;
		height: 60px;
		z-index: 100;
	}
	.menu {
		display: inline-block;
		padding: 10px;
		line-height: 40px;
	}
	.menu > a {
		color : white;
	}
	.tri{
		width: 0px;
		height: 0px;
		position: absolute;
		right: 24px;
		bottom: 98px;
		border-top:9px solid none;
		border-bottom:9px solid whitesmoke;
		border-right: 9px solid transparent;
		border-left: 9px solid  transparent;
	}
	.alertBox {
		width: 200px;
		height: 100px;
		position: absolute;
		top:56px;
		right: 10px;
		background-color: whitesmoke;
		border-radius: 30px;
		text-align: center;
	}
	.alertBox span {
		position: relative;
		top:10px;
	}
	.alertBox button {
		width: 60px;
		height: 30px;
		margin:10px;
		position: relative;
		top: 10px;
		background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));
		border-radius: 10px;
		border: none;
		color: white;
		font-weight: bold;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		$('#login').html('<%=myhtml%>');
		$('#topmenus').append('<%=outhtml%>');
		
		
		$('.alertBox').hide();
		
		$('#logout').on('click', function() {
			$('.alertBox').show(300);
		});
		
		$('#outno').on('click', function() {
			$('.alertBox').hide(300);
		});
		
		$('#outyes').on('click', function() {
			location.href = 'logout.jsp';
		});
		
	});
</script>
</head>
<body>
	<nav id="topnav">
			<li class="logoTitle"><a href="frontpage.jsp">TripTrip</a></li>
		<ul id="topmenus" class="clearfix">
			<li class="menu" id="community"><a href="project.jsp">커뮤니티</a></li> <!-- 나중에 Commu.jsp로 바꿀것 -->
			<li class="menu" id="login"><a href="Login.html">로그인</a></li>
		</ul>
	</nav>
</body>
</html>