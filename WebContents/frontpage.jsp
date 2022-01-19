<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<style>
	#slide {
		position: relative;
		width: 100vw;
		height: 100vh;
		margin: 0 auto; 
		text-align: center;
		overflow: hidden;
	}
	.slideList {
		width: inherit;
		height: inherit;
		position: relative;
	}
	#slide img {
		width: 100%;
		height: 100%;
		min-width: 1200px;
		min-height: 800px;
		display: block;
		position: absolute;
		top:0;
		left:0;
	}
	#enter {
		position: absolute;
		top: 85%;
		left: 50%;
		transform: translate(-50%, -50%);
		width: 15%;
		height: 7%;
		min-height: 40px;
		background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));
		border: solid rgba(255,255,255,0.8) 2px;
		border-radius: 40px;
		color: white;
		font-size: 2vmax;
		font-weight: bold;
	}
	#enter:hover {
		background: linear-gradient(to left, rgba(255, 77, 46, 0.8), rgba(255, 155, 47, 0.8));
		transition-duration: 1s;
		cursor: pointer;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
	$(function() {
        $(".slideList").children("div:gt(0)").hide();
        var current = 0;

        setInterval(function(){
            var next = (current+1) % 3;
			$(".slideList").find("div").eq(current).fadeOut(2500);
        	$(".slideList").find("div").eq(next).fadeIn(1500);
            current = next;
        },4000);
        
        $('#enter').on('click', function(){
        	location.href = 'main.jsp';
        });
	});
</script>
</head>
<body>
	<div id="wrapper">
		<!-- 상단바 -->
		<%@include file="nav.jsp" %>
		
		<section id=slide>
			<div class="slideList">
				<div class="slideImg"><img src="img/slide1.jpg" alt="경북 경주 안압지"></div>
				<div class="slideImg"><img src="img/slide2.jpg" alt="울산"></div>
				<div class="slideImg"><img src="img/slide3.jpg" alt="경북 경주 안압지"></div>

				<button id="enter">여행의 시작</button>
			</div>
		</section> <!-- slide -->
		
	</div> <!-- wrapper -->
</body>
</html>