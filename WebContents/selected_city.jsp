<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dao.areaDao"%>
<%@page import="vo.areaVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String areaCode = request.getParameter("areaCode");
	if(areaCode == null){
		areaCode = "1";
	}
	// int arr[] = {1, 2, 3, 4, 5, 6, 7, 8, 31, 32 ,33, 34, 35, 36, 37, 38, 39};
	
	areaDao aDao = new areaDao();
	
	// 사이드바 노가다
	List<areaVo> areaList = aDao.getAreaList();
	request.setAttribute("areaList", areaList);
	
	List<areaVo> area1 = aDao.getSigunguList(1);
	request.setAttribute("area1", area1);
	
	List<areaVo> area2 = aDao.getSigunguList(2);
	request.setAttribute("area2", area2);
	
	List<areaVo> area3 = aDao.getSigunguList(3);
	request.setAttribute("area3", area3);
	
	List<areaVo> area4 = aDao.getSigunguList(4);
	request.setAttribute("area4", area4);
	
	List<areaVo> area5 = aDao.getSigunguList(5);
	request.setAttribute("area5", area5);
	
	List<areaVo> area6 = aDao.getSigunguList(6);
	request.setAttribute("area6", area6);
	
	List<areaVo> area7 = aDao.getSigunguList(7);
	request.setAttribute("area7", area7);
	
	List<areaVo> area8 = aDao.getSigunguList(8);
	request.setAttribute("area8", area8);
	
	List<areaVo> area31 = aDao.getSigunguList(31);
	request.setAttribute("area31", area31);
	
	List<areaVo> area32 = aDao.getSigunguList(32);
	request.setAttribute("area32", area32);
	
	List<areaVo> area33= aDao.getSigunguList(33);
	request.setAttribute("area33", area33);
	
	List<areaVo> area34 = aDao.getSigunguList(34);
	request.setAttribute("area34", area34);
	
	List<areaVo> area35 = aDao.getSigunguList(35);
	request.setAttribute("area35", area35);
	
	List<areaVo> area36 = aDao.getSigunguList(36);
	request.setAttribute("area36", area36);
	
	List<areaVo> area37 = aDao.getSigunguList(37);
	request.setAttribute("area37", area37);
	
	List<areaVo> area38 = aDao.getSigunguList(38);
	request.setAttribute("area38", area38);
	
	List<areaVo> area39 = aDao.getSigunguList(39);
	request.setAttribute("area39", area39);
	
	// 현재 위치 이름 + 좌표
	int aCode = Integer.parseInt(areaCode);
	List<areaVo> list = aDao.getSigunguList(aCode);
	
	String areaName = list.get(0).getAreaName();
	int nx = list.get(0).getNx();
	int ny = list.get(0).getNy();
	
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>title here</title>
    <style>
        * {
            margin: 0 auto;
            padding: 0;
            list-style: none;
        }

        .clearfix::before,
        .clearfix::after {
            display: block;
            content: "";
            clear: both;
        }

        html,
        body {
            width: 100%;
            height: 100%;
        }
		
        #wrap {
            width: 100%;
            height: 100%;
            /* background-color: red; */
            display: grid;
            grid-template-rows: 46% 54%;
        }

        #weather {
            width: 100%;
            height: 100%;
            position: relative;
            background-color: #777;
        }
        
		#weather #areaName {
			color: white;
			position: absolute;
			font-size: 50px;
			font-weight: bold;
			top: 70px;
			left: 20%;
			background: rgba(0, 0, 0, 0.5);
		}
		
        #weather>img {
            width: 100%;
            height: 100%;
            min-width: 1200px;
            min-height: 300px;
        }

        #weather #weatherInfo {
            position: absolute;
            top: 70%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 15%;
            height: 40%;
            min-height: 140px;
            background-color: rgba(0, 0, 0, 0.5);
            text-align: center;
            color: white;
        }
        #weatherInfo img {
	        width: 40%;
            height: auto;
            filter: invert(1);
        }
        #contents {
            width: 88%;
            height: 100%;
            /* background-color: #444; */
            display: grid;
            grid-template-columns: 28% 72%;
        }

        #side {
            padding-top: 50px;
            width: 99%;
            /* background-color: #111; */
            border-right: 1px solid rgb(230, 230, 230);
            display: flex;
            flex-direction: column;
        }
        /* 지역별 영역 글씨 */
        #side .nav>div {
            margin: 0;
            text-align: left;
            font-size: 18px;
            font-weight: bold;
            /* margin-right: 50px; */
            margin-left: auto;
            padding-left: 30px;
            width: 150px;
            height: 60px;
            line-height: 60px;
            border: 1px solid white;
            background-color: rgb(230, 230, 230);
        }
        
        .nav {
            margin: 0;
            margin-left: auto;
        }
        .nav li {
            text-align: left;
            
        }
        #side span ,#side a{
            margin: 0;
            padding-left: 30px;
            display: block;
            width: 150px;
            height: 60px;
            line-height: 60px;
            border: 1px solid white;
        }
        
        #side .nav>ul>li>span {
            background-color: tomato;
            color: white;
            font-size: 18px;
            font-weight: bold;
        }

        #side .submenu {
            display: none;
        }

        #side .submenu a {
            background-color: orange;
            text-decoration: none;
            color: black;
        }
		.areaName > span {
			cursor: pointer;
		}
		
        #list {
            width: 100%;
            /* background-color: aliceblue; */
            text-align: center;

        }

        #list #locations {
            width: 85%;
            margin-left: 10%;
            margin-top: 100px;
            /* margin-right: 100px; */
            /* margin-left: 200px; */
            /* background-color: antiquewhite; */
            display: flex;
            flex-wrap: wrap;
            flex-direction: row;
            justify-content: stretch;
            align-content: flex-start;
        }

        #list #locations div {
            width: 280px;
            height: 250px;
            border: 1px solid olive;
            margin: 30px 20px;
            border-bottom: 4px solid;
            border-image: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));
            border-image-slice: 1;
            border-top: none;
            border-left: none;
            border-right: none;
        }
        
        #list #locations div:hover {
        	cursor: pointer;
        }
        
        #locations div img {
            width: inherit;
            height: inherit;
        }
     	#locations a {
     		color: black;
     	}
     	
        #list #pager {
            margin: 50px 0px;
        }
        
        #list #pager a{
        	color: black;
        	font-weight: bold;
        	line-height: 40px;
        	display: inline-block;
        	width: 40px;
        	height: 40px;
        	border-left: 1px solid black;
        	border-bottom: 1px solid black;
        	border-top: 1px solid black;
        }
        #list #pager a:first-child {
        	border-top-left-radius: 10px;
        	border-bottom-left-radius: 10px;
        }
        #list #pager a:last-child {
        	border-right: 1px solid black;
        	border-top-right-radius: 10px;
        	border-bottom-right-radius: 10px;
        }
        #list #pager a:hover {
        	background-color: orange;
        }
        
        form {
        	display: none;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/weather.js"></script>
    <script>
    	// 날씨
    	function getWeather(aCode, gCode, nx, ny) {
    		var result = getWeatherParam(aCode, gCode);
    		var base_date = result[0];
    		var base_time = result[1];
    		var toTime = result[2];
    		
    		$.ajax({
    			url: 'http://localhost:9090/TripTrip/weather',
    			data: { base_date: base_date,
    					base_time: base_time,
    					nx: nx,
    					ny: ny
    				},
    			type: 'GET',
    			success: function(xml) {
    				console.log(base_date);
    				console.log(base_time);
    				console.log(nx);
    				console.log(ny);
    				console.log(toTime);
    				
    				var tmp = 0;
					var sky = 0;
					var pty = 0;
					
    				$(xml).find('item').each(function(index, item) {
    					var fcstTime = $(this).find('fcstTime').html();
    					var category = $(this).find('category').html();
    					var fcstValue = $(this).find('fcstValue').html();
    					
    					// 값 들고오는거
    					if(fcstTime == toTime){
    						
    						if(category == 'TMP'){
    							tmp = fcstValue;
    							console.log(fcstValue);
    						}else if(category == 'SKY'){
    							sky = fcstValue;
    						}else if(category == 'PTY'){
    							pty = fcstValue;
    						}
    					}
    				});
    				// 날씨 이미지 설정
					console.log('sky: ' + sky);
					console.log('pty: ' + pty);
					
					if(sky == 1){ // 맑음
						$('#weatherBack').attr("src", "img/weather/sunny.gif");
						$('#weatherIcon').attr("src", "img/weather/ico/sunny.png");
					}else if(sky == 3){ // 구름많음
						$('#weatherBack').attr("src", "img/weather/cloudy.gif");
						$('#weatherIcon').attr("src", "img/weather/ico/cloudy.png");
					}else if(sky == 4){ // 흐림
						$('#weatherBack').attr("src", "img/weather/cloudy.gif");
						$('#weatherIcon').attr("src", "img/weather/ico/cloudy2.png");
					}
					
					if(pty == 1 || pty == 2 || pty == 4){ // 비, 비/눈, 소나기
						$('#weatherBack').attr("src", "img/weather/rain.gif");
						$('#weatherIcon').attr("src", "img/weather/ico/rain.png");
					}else if(pty == 3){ // 눈
						$('#weatherBack').attr("src", "img/weather/snow.gif");
						$('#weatherIcon').attr("src", "img/weather/ico/snow.png");
					}
					
					$('#TMP').html('현재온도: ' + tmp + '°C');
    			},
    			error: function(xhr){
    				alert(xhr.status + '' + xhr.statusText);
    			}
    		});
    	}
    	
		/* 대충 관광지이름, 사진들고오는거  */
		function getTourList(aCode, gCode, page, aName, gName, nx, ny) {
			
			var totalCount = 0;
			var numOfRows = 12;
    		$.ajax({
    			// xml이 실행중인 자바스크립트와 주소가 다르면 cors 정책에 의해 오류발생
    			// 해결책 : 자바로 data를 가져온다 - servlet
    			url : 'http://localhost:9090/TripTrip/tourlist',
    			data : {
    					areaCode: aCode,
    					sigunguCode: gCode,
    					pageNo: page
    					},
    			type : 'GET'
    				/* beforeSend: function() {
    				$('html').css("cursor", "wait");
    			},
    			complete: function() {
    				$('html').css("cursor", "auto");
    			} */
    		})
    		.done(function(xml) {
    				var html = '';
    				
    				$(xml).find('item').each(function(index, item) {
    					var title = $(this).find('title').html();
    					var firstimage = $(this).find('firstimage').html();
    					var contentid = $(this).find('contentid').html();
    					var mapx = $(this).find('mapx').html();
    					var mapy = $(this).find('mapy').html();
    					var addr1 = $(this).find('addr1').html();
    					var sigunguCode = $(this).find('sigungucode').html();

    					html += '<div onclick=\"javascript:viewPage(';
    					html += contentid + ',' + mapx + ',' + mapy + ',' + '\'' + title + '\'';
    					html += ',' + '\'' + addr1 + '\'' + ',' + aCode +','+ '\'' + firstimage + '\' ,' + sigunguCode + ');\">';
    					if (firstimage == undefined) {
    						html += '<img src=\"img/noimg.png\">';
    					} else {
    						html += '<img src=\"' + firstimage + '\">';
    					}
					
    					html += '<span>';
    					html += '<a href=\"javascript:viewPage(';
    					html += contentid + ',' + mapx + ',' + mapy + ',' + '\'' + title + '\');\">';
    					html += title + '</a>'
    					html += '</span>';
    					html += '</div>';
    				});
    				$('#locations').html(html);

    				// 페이지 생성
    				totalCount = $(xml).find('totalCount').html();
    				var totalPage = Math.ceil(totalCount/numOfRows);
    				var pagehtml = '';
    				for(var i=1; i<=totalPage; i++){
    					pagehtml += '<a href=\"#\" onclick=\"javascript:getTourList(';
    					pagehtml += aCode + ',' + gCode + ',' + i + ',';
    					pagehtml += '\'' + aName + '\',' + '\'' + gName + '\',' + nx + ',' + ny;
    					pagehtml += ');\">' + i;
    					pagehtml += '</a>';
    				}
    				$('#pager').html(pagehtml);
    				$('#pager a').eq(page-1).css("background-color", "tomato");
    				
    				var pageDiv = Math.ceil(page/10);
    				console.log(pageDiv);
    				
    				
    				
    				var areahtml = aName + ' ' + gName;
    				$('#areaName').html(areahtml);
    				
    				getWeather(aCode, gCode, nx, ny);
    				
    			  
    		}).fail(function(xhr) {
    			if(xhr.statusText == "timeout"){
					alert('잠시후 재시도 해주세요');
				}
				// alert(xhr.status + ':' + xhr.statusText);
    		})
		} // 관광지
		
		function viewPage(contentid, mapx, mapy, title, addr1, areaCode, firstimage, gCode){
			$('#contentid').val(contentid);
			$('#mapx').val(mapx);
			$('#mapy').val(mapy);
			$('#title').val(title);
			$('#addr1').val(addr1);
			$('#areaCode').val(areaCode);
			$('#firstimage').val(firstimage);
			$('#gCode').val(gCode);
			
			
			$('#viewPage').submit(); // 전송
		}
		
        $(function () {
    		
    		getTourList(<%=areaCode%>, 0, 1, '<%=areaName%>', '', <%=nx%>, <%=ny%>);
    			
            // 메뉴 애니메이션
            $(".nav > ul > li").hover(function () {
                $(this).find(".submenu").stop().slideDown();
            }, function () {
                $(this).find(".submenu").stop().slideUp();
            });
        })
    </script>
</head>

<body>
    <div id="wrap">
    	<%@ include file="nav.jsp"%>
        <section id="weather">
            <img id="weatherBack" src="" />
            <div id="areaName"></div>
            <div id="weatherInfo">
                <div>오늘 날씨</div>
                <img id="weatherIcon" src="" />
                <div id="TMP">현재온도: </div>
            </div>
        </section>
        <section id="contents">
            <aside id="side">
                <nav class="nav">
                    <div>지역별</div>
                    <ul>	
                        <li class="areaName">
							<span onclick="javascript:getTourList(1, 0, 1, '서울', '' , 60, 127 )">서울</span>
							<ul class="submenu">
								<c:forEach var="area1" items="${area1}">
									<li><a href="javascript:getTourList(1, ${area1.sigunguCode},1, '${area1.areaName}', '${area1.sigunguName}', ${area1.nx}, ${area1.ny})">${area1.sigunguName}</a></li>
								</c:forEach>
							</ul>
						</li>
						<li class="areaName">
							<span onclick="javascript:getTourList(2, 0, 1, '인천', '' , 55, 124 )">인천</span>
							<ul class="submenu">
								<c:forEach var="area2" items="${area2}">
									<li><a href="javascript:getTourList(2, ${area2.sigunguCode},1, '${area2.areaName}', '${area2.sigunguName}', ${area2.nx}, ${area2.ny})">${area2.sigunguName}</a></li>
								</c:forEach>
							</ul>
						</li>
						<li class="areaName">
							<span onclick="javascript:getTourList(3, 0, 1, '대전', '' , 67, 100 )">대전</span>
							<ul class="submenu">
								<c:forEach var="area3" items="${area3}">
									<li><a href="javascript:getTourList(3, ${area3.sigunguCode},1, '${area3.areaName}', '${area3.sigunguName}', ${area3.nx}, ${area3.ny})">${area3.sigunguName}</a></li>
								</c:forEach>
							</ul>
						</li>
						<li class="areaName">
							<span onclick="javascript:getTourList(4, 0, 1, '대구', '' , 89, 90 )">대구</span>
							<ul class="submenu">
								<c:forEach var="area4" items="${area4}">
									<li><a href="javascript:getTourList(4, ${area4.sigunguCode},1, '${area4.areaName}', '${area4.sigunguName}', ${area4.nx}, ${area4.ny})">${area4.sigunguName}</a></li>
								</c:forEach>
							</ul>
						</li>
						<li class="areaName">
							<span onclick="javascript:getTourList(5, 0, 1, '광주', '' , 58, 74 )">광주</span>
							<ul class="submenu">
								<c:forEach var="area5" items="${area5}">
									<li><a href="javascript:getTourList(5, ${area5.sigunguCode},1, '${area5.areaName}', '${area5.sigunguName}', ${area5.nx}, ${area5.ny})">${area5.sigunguName}</a></li>
								</c:forEach>
							</ul>
						</li>
						<li class="areaName">
							<span onclick="javascript:getTourList(6, 0, 1, '부산', '' , 98, 76 )">부산</span>
							<ul class="submenu">
								<c:forEach var="area6" items="${area6}">
									<li><a href="javascript:getTourList(6, ${area6.sigunguCode},1, '${area6.areaName}', '${area6.sigunguName}', ${area6.nx}, ${area6.ny})">${area6.sigunguName}</a></li>
								</c:forEach>
							</ul>
						</li>
						<li class="areaName">
							<span onclick="javascript:getTourList(7, 0, 1, '울산', '' , 102, 84 )">울산</span>
							<ul class="submenu">
								<c:forEach var="area7" items="${area7}">
									<li><a href="javascript:getTourList(7, ${area7.sigunguCode},1, '${area7.areaName}', '${area7.sigunguName}', ${area7.nx}, ${area7.ny})">${area7.sigunguName}</a></li>
								</c:forEach>
							</ul>
						</li>
						<li class="areaName">
							<span onclick="javascript:getTourList(8, 0, 1, '세종', '' , 66, 103 )">세종</span>
							<ul class="submenu">
								<c:forEach var="area8" items="${area8}">
									<li><a href="javascript:getTourList(8, ${area8.sigunguCode},1, '${area8.areaName}', '${area8.sigunguName}', ${area8.nx}, ${area8.ny})">${area8.sigunguName}</a></li>
								</c:forEach>
							</ul>
						</li>
						<li class="areaName">
							<span onclick="javascript:getTourList(31, 0, 1, '경기도', '' , 60, 120 )">경기도</span>
							<ul class="submenu">
								<c:forEach var="area31" items="${area31}">
									<li><a href="javascript:getTourList(31, ${area31.sigunguCode},1, '${area31.areaName}', '${area31.sigunguName}', ${area31.nx}, ${area31.ny})">${area31.sigunguName}</a></li>
								</c:forEach>
							</ul>
						</li>
						<li class="areaName">
							<span onclick="javascript:getTourList(32, 0, 1, '강원도', '' , 73, 134 )">강원도</span>
							<ul class="submenu">
								<c:forEach var="area32" items="${area32}">
									<li><a href="javascript:getTourList(32, ${area32.sigunguCode},1, '${area32.areaName}', '${area32.sigunguName}', ${area32.nx}, ${area32.ny})">${area32.sigunguName}</a></li>
								</c:forEach>
							</ul>
						</li>
						<li class="areaName">
							<span onclick="javascript:getTourList(33, 0, 1, '충청북도', '' , 69, 107 )">충청북도</span>
							<ul class="submenu">
								<c:forEach var="area33" items="${area33}">
									<li><a href="javascript:getTourList(33, ${area33.sigunguCode},1, '${area33.areaName}', '${area33.sigunguName}', ${area33.nx}, ${area33.ny})">${area33.sigunguName}</a></li>
								</c:forEach>
							</ul>
						</li>
						<li class="areaName">
							<span onclick="javascript:getTourList(34, 0, 1, '충청남도', '' , 68, 100 )">충청남도</span>
							<ul class="submenu">
								<c:forEach var="area34" items="${area34}">
									<li><a href="javascript:getTourList(34, ${area34.sigunguCode},1, '${area34.areaName}', '${area34.sigunguName}', ${area34.nx}, ${area34.ny})">${area34.sigunguName}</a></li>
								</c:forEach>
							</ul>
						</li>
						<li class="areaName">
							<span onclick="javascript:getTourList(35, 0, 1, '경상북도', '' , 89, 91 )">경상북도</span>
							<ul class="submenu">
							<c:forEach var="area35" items="${area35}">
									<li><a href="javascript:getTourList(35, ${area35.sigunguCode},1, '${area35.areaName}', '${area35.sigunguName}', ${area35.nx}, ${area35.ny})">${area35.sigunguName}</a></li>
								</c:forEach>
							</ul>
						</li>
						<li class="areaName">
							<span onclick="javascript:getTourList(36, 0, 1, '경상남도', '' , 91, 77 )">경상남도</span>
							<ul class="submenu">
							<c:forEach var="area36" items="${area36}">
									<li><a href="javascript:getTourList(36, ${area36.sigunguCode},1, '${area36.areaName}', '${area36.sigunguName}', ${area36.nx}, ${area36.ny})">${area36.sigunguName}</a></li>
								</c:forEach>
							</ul>
						</li>
						<li class="areaName">
							<span onclick="javascript:getTourList(37, 0, 1, '전라북도', '' , 63, 89 )">전라북도</span>
							<ul class="submenu">
							<c:forEach var="area37" items="${area37}">
									<li><a href="javascript:getTourList(37, ${area37.sigunguCode},1, '${area37.areaName}', '${area37.sigunguName}', ${area37.nx}, ${area37.ny})">${area37.sigunguName}</a></li>
								</c:forEach>
							</ul>
						</li>
						<li class="areaName">
							<span onclick="javascript:getTourList(38, 0, 1, '전라남도', '' , 51, 67 )">전라남도</span>
							<ul class="submenu">
							<c:forEach var="area38" items="${area38}">
									<li><a href="javascript:getTourList(38, ${area38.sigunguCode},1, '${area38.areaName}', '${area38.sigunguName}', ${area38.nx}, ${area38.ny})">${area38.sigunguName}</a></li>
								</c:forEach>
							</ul>
						</li>
						<li class="areaName">
							<span onclick="javascript:getTourList(39, 0, 1, '경상남도', '' , 52, 38 )">제주</span>
							<ul class="submenu">
							<c:forEach var="area39" items="${area39}">
									<li><a href="javascript:getTourList(39, ${area39.sigunguCode},1, '${area39.areaName}', '${area39.sigunguName}', ${area39.nx}, ${area39.ny})">${area39.sigunguName}</a></li>
								</c:forEach>
							</ul>
						</li>
                    </ul>
                </nav>
            </aside>
            <div id="list">
                <div id="locations"></div>
                <div id="pager"></div>
            </div>
        </section>
    </div>
    <!-- 다음페이지로 넘길거 -->
    <form id="viewPage" action="city_info.jsp" method="POST">
    	<input id="contentid" type="hidden" name="contentid" />
    	<input id="mapx" type="hidden" name="mapx" />
    	<input id="mapy" type="hidden" name="mapy" />
    	<input id="title" type="hidden" name="title" />
    	<input id="addr1" type="hidden" name="addr1" />
    	<input id="areaCode" type="hidden" name="areaCode" />
    	<input id="firstimage" type="hidden" name="firstimage" />
    	<input id="gCode" type="hidden" name="sigunguCode" />
    </form>
</body>
</html>