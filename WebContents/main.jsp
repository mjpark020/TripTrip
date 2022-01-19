<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8"); 
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<!-- <link rel="stylesheet" type="text/css" href="css/test.css" /> -->
<link rel="stylesheet" type="text/css" href="css/style.css" />
<style>
#main {
	margin: 0 auto;
	margin-top: 5%;
	margin-right: 0px;
	width: 100vw;
}

.main {
	width: 100vw;
	text-align: center;
	display: flex;
	flex-wrap: wrap;
}

.main>div {
	
	margin: 9px;
	background-repeat: no-repeat;
	background-position: center;
	height: 300px;
	width: 300px;
	background-size: cover;
	color: white;
	display: table;
}

.main div span {
	text-align: center;
	line-height: 300px;
	font-weight: bold;
	font-size: 30px;
}

.main>div:hover span {
	display: none;
}

.main>div:hover div {
	display: table-cell;
	vertical-align: middle;
}

.main div div {
	display: none;
	width: 300px;
	height: 300px;
	background-color: rgba(0, 0, 0, 0.3);
}

.main a {
	color: white;
	font-size: 30px;
}

/* .busan a {
                    opacity: 0;
                    padding-top: 42%;
                }

                .busan:hover {
                    width: 240px;
                    height: 240px;
                    opacity: 0.6;
                    padding: 30px;
                }

                .busan:hover a {
                    opacity: 0.8;
                } */
</style>
</head>

<body>
	<%@ include file="nav.jsp"%>
	<%  %>
	<section id="main">
		<div class="main clearfix">
			<div class="seoul" style="background-image: url(img/seoul.jpg);"
				id="seoul">
				<div>
					<a href="selected_city.jsp?areaCode=1">관광지 보기</a><br><br>
					<a href="selected_city_acco.jsp?areaCode=1">관광지 주변 숙소</a>
				</div>
				<span>서울</span>
			</div>
			<div class="incheon" style="background-image: url(img/incheon.jpg);"
				id="incheon">
				<div>
					<a href="selected_city.jsp?areaCode=2">관광지 보기</a><br><br>
					<a href="selected_city_acco.jsp?areaCode=2">관광지 주변 숙소</a>
				</div>
				<span>인천</span>
			</div>
			<div class="daejeon" style="background-image: url(img/daejeon.jpg);"
				id="daejeon">
				<div>
					<a href="selected_city.jsp?areaCode=3">관광지 보기</a><br><br>
					<a href="selected_city_acco.jsp?areaCode=3">관광지 주변 숙소</a>
				</div>
				<span>대전</span>
			</div>
			<div class="daegu" style="background-image: url(img/daegu.jpg);"
				id="daegu">
				<div>
					<a href="selected_city.jsp?areaCode=4">관광지 보기</a><br><br>
					<a href="selected_city_acco.jsp?areaCode=4">관광지 주변 숙소</a>
				</div>
				<span>대구</span>
			</div>
			<div class="gwangju" style="background-image: url(img/gwangju.png);"
				id="gwangju">
				<div>
					<a href="selected_city.jsp?areaCode=5">관광지 보기</a><br><br>
					<a href="selected_city_acco.jsp?areaCode=5">관광지 주변 숙소</a>
				</div>
				<span>광주</span>
			</div>
			<div class="busan" style="background-image: url(img/busan.jpg);"
				id="busan">
				<div>
					<a href="selected_city.jsp?areaCode=6">관광지 보기</a><br><br>
					<a href="selected_city_acco.jsp?areaCode=6">관광지 주변 숙소</a>
				</div>
				<span>부산</span>
			</div>
			<div class="ulsan" style="background-image: url(img/ulsan.jpg);"
				id="ulsan">
				<div>
					<a href="selected_city.jsp?areaCode=7">관광지 보기</a><br><br>
					<a href="selected_city_acco.jsp?areaCode=7">관광지 주변 숙소</a>
				</div>
				<span>울산</span>
			</div>
			<div class="sejong" style="background-image: url(img/sejong.jpg);"
				id="sejong">
				<div>
					<a href="selected_city.jsp?areaCode=8">관광지 보기</a><br><br>
					<a href="selected_city_acco.jsp?areaCode=8">관광지 주변 숙소</a>
				</div>
				<span>세종</span>
			</div>
			<div class="gyeonggido"
				style="background-image: url(img/gyeonggido.png);" id="gyeonggido">
				<div>
					<a href="selected_city.jsp?areaCode=31">관광지 보기</a><br><br>
					<a href="selected_city_acco.jsp?areaCode=31">관광지 주변 숙소</a>
				</div>
				<span>경기도</span>
			</div>
			<div class="gangwondo"
				style="background-image: url(img/gangwondo.jpg);" id="gangwondo">
				<div>
					<a href="selected_city.jsp?areaCode=32">관광지 보기</a><br><br>
					<a href="selected_city_acco.jsp?areaCode=32">관광지 주변 숙소</a>
				</div>
				<span>강원도</span>
			</div>
			<div class="choongbook"
				style="background-image: url(img/choongbook.jpg);" id="choongbook">
				<div>
					<a href="selected_city.jsp?areaCode=33">관광지 보기</a><br><br>
					<a href="selected_city_acco.jsp?areaCode=33">관광지 주변 숙소</a>
				</div>
				<span>충청북도</span>
			</div>
			<div class="choongnam"
				style="background-image: url(img/choongnam.jpg);" id="choongnam">
				<div>
					<a href="selected_city.jsp?areaCode=34">관광지 보기</a><br><br>
					<a href="selected_city_acco.jsp?areaCode=34">관광지 주변 숙소</a>
				</div>
				<span>충청남도</span>
			</div>
			<div class="gyeongbook"
				style="background-image: url(img/gyeongbook.jpg);" id="gyeongbook">
				<div>
					<a href="selected_city.jsp?areaCode=35">관광지 보기</a><br><br>
					<a href="selected_city_acco.jsp?areaCode=35">관광지 주변 숙소</a>
				</div>
				<span>경상북도</span>
			</div>
			<div class="gyeongnam"
				style="background-image: url(img/gyeongnam.jpg);" id="gyeongnam">
				<div>
					<a href="selected_city.jsp?areaCode=36">관광지 보기</a><br><br>
					<a href="selected_city_acco.jsp?areaCode=36">관광지 주변 숙소</a>
				</div>
				<span>경상남도</span>
			</div>
			<div class="jeonbook"
				style="background-image: url(img/jeonbook.jpg);" id="jeonbook">
				<div>
					<a href="selected_city.jsp?areaCode=37">관광지 보기</a><br><br>
					<a href="selected_city_acco.jsp?areaCode=37">관광지 주변 숙소</a>
				</div>
				<span>전라북도</span>
			</div>
			<div class="jeonnam" style="background-image: url(img/jeonnam.jpg);"
				id="jeonnam">
				<div>
					<a href="selected_city.jsp?areaCode=38">관광지 보기</a><br><br>
					<a href="selected_city_acco.jsp?areaCode=38">관광지 주변 숙소</a>
				</div>
				<span>전라남도</span>
			</div>
			<div class="jaeju" style="background-image: url(img/jaeju.jpg);"
				id="jaeju">
				<div>
					<a href="selected_city.jsp?areaCode=39">관광지 보기</a><br><br>
					<a href="selected_city_acco.jsp?areaCode=39">관광지 주변 숙소</a>
				</div>
				<span>제주도</span>
			</div>
		</div>
	</section>
</body>

</html>