<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
   request.setCharacterEncoding("UTF-8");
   String contentid = request.getParameter("contentid");
   String mapx = request.getParameter("mapx");
   String mapy = request.getParameter("mapy");
   String title = request.getParameter("title");
   String addr1 = request.getParameter("addr1");
   String areaCode = request.getParameter("areaCode");
   String firstimage = request.getParameter("firstimage");
   
   
   double nx = Double.parseDouble(mapx);
   double ny = Double.parseDouble(mapy);
   
   System.out.println(nx);
   System.out.println(ny);
   System.out.println(addr1);
   
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        }
		
        #wrap { 
        	width: 100%;
            /* background-color: blue; */
            display: grid;
            grid-template-rows: 400px 1fr;
        }
        
        #topimg {
        	width: 100%;
            height: 100%;
            text-align: center;
            
        }
        
        #topimg img {
        	width: 100%;
        	height: 100%;
        	position: relative;
        }
        #topimg span {
        	color: white;
        	font-size: 50px;
        	position: absolute;
        	top: 150px;
        	left: 50%;
        	transform: translate(-50%);
        }
        
        #content {
        	width: 80%;
        	display: grid;
        	grid-template-rows: auto auto auto;
        	grid-row-gap: 50px;
        	margin-top: 50px;
        }
        
        
        #content > div:last-child {
        	margin-bottom: 50px;
        }
        
        #content hr {
        	height: 2px;
        	background-image: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));
        }
        
        #slides {
        	width: 100%;
        }
        
        .slide {
        	width:60%;
        	height: 500px;
        	overflow: hidden;
        	position: relative;
        }
        .slide img {
        	margin: 0;
        	padding: 0;
        	display: inline-block;
        	width: 100%;
        	height: 100%;
        	position: absolute;
        	
        }
        
        .slide div {
        	width: 10%;
        	height: 100%; 
        	text-align: center;
        	line-height: 500px;
        	font-size: 50px;
        	font-weight: 150px;
        	visibility: hidden;
        }
        
        .slide div:hover {
        	background: rgba(255, 255, 255, 0.3);
        	
        }
        
        .slide .prev {
        	position: absolute;
        	visibility: visible;
        	
        }
        .slide .next {
        	position: absolute;
        	right: 0;
        	visibility: visible;
        }
        
        #infomation #info  {
        	display: grid;
        	grid-template-columns: 1fr 1fr;
        }
        
        #info .overview {
        	display:inline-block;
        	padding-right: 50px;
        }
        
        #recommend {
        	width: 100%;
        }
        
        #recommend .reco{
        	margin-top: 20px;
        	display: flex;
        	justify-content : space-around;
        }
        
        #recommend .reco div{
        	text-align: center;
        }
        
        #recommend .reco div:hover {
        	cursor: pointer;
        }
        
        #recommend .reco img {
        	width: 300px;
        	height: 300px;
        }
        
        
         #recommend1 {
        	width: 100%;
        }
        
        #recommend1 .acco{
        	margin-top: 20px;
        	display: flex;
        	justify-content : space-around;
        }
        
        #recommend1 .acco div{
        	text-align: center;
        }
        
        #recommend1 .acco div:hover {
        	cursor: pointer;
        }
        
        #recommend1 .acco img {
        	width: 300px;
        	height: 300px;
        }
        
        /* 지도 */
        .map_wrap {position:relative;width:100%;height:350px;}
    	.title {font-weight:bold;display:block;}
    	.hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    	#centerAddr {display:block;margin-top:2px;font-weight: normal;}
    	.bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
        
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6a51e6a6e7ad4cf6f14915b4089ca92d&libraries=services"></script>
<script>
	
	
	// 슬라이드 이미지 가져오기
	function getSlideImg(){
		// 슬라이드 인덱스
		var totalIndex = 0;
		
		$.ajax({
			url:'http://localhost:9090/TripTrip/imglist',
			data: {contentId: <%=contentid%>},
			async: false,
			type: 'GET',
			success: function(xml) {
				var html = '';
				
				$(xml).find('item').each(function(index, item) {
					
					var originimgurl = $(this).find('originimgurl').html();
					
					if(originimgurl != undefined){
						html += '<img src=\"' + originimgurl + '\" />';
						totalIndex++;
					}
				});
				console.log('it:' + totalIndex);
				
				html += '<div class="prev">&lt;</div>';
				html += '<div class="next">&gt;</div>';
				
				$('.slide').html(html);
				
				// 이미지 슬라이딩
				$('.slide img').hide();
				$('.slide img').eq(0).show();
				
				
			},
			error: function(xhr) {
				alert(xhr.status + '' + xhr.statusText);
			}
		});
		return totalIndex;
	}
	
	
	// 설명
	function getInfo() {
		$.ajax({
			url : 'http://localhost:9090/TripTrip/detailinfolist',
			data : {
				contentId :<%=contentid%>
			},
			type : 'GET',
			success : function(xml) {
				var html = '';

				$(xml).find('item').each(function() {
					var overview = $(this).find('overview').html();

					console.log(overview);
					html = '<span>';

					html += overview.replaceAll('&lt;br&gt;', '<br>');

					html += '</span>';
				});

				$('.overview').html(html);

			},
			error : function(xhr) {
				alert(xhr.status + '' + xhr.statusText);
			}
		});
	}

	// 휴무일, 문의처
	function getInfo2() {
		$.ajax({
			url: 'http://localhost:9090/TripTrip/introlist',
			data: { contentId: <%=contentid%> },
			type: 'GET',
			success: function(xml) {
				
				var html = '';
				$(xml).find('item').each(function() {
					var infocenter = $(this).find('infocenter').html();
		            var restdate = $(this).find('restdate').html();
		            
		            html += '<br>';
		            html += '<p>(휴무일) ' + restdate + '</p>';
		            html += '<p>(tel) '+ infocenter + '</p>';
				});
				$('.detail').html(html);
			}
		});
	}

	// 추천목록
	function recommList() {
		$.ajax({
			url : 'http://localhost:9090/TripTrip/recomList',
			data : {
				areaCode: <%=areaCode%> },
			type: 'GET',
			success: function(xml) {
				 
				var titleArr = new Array();
				var imageArr = new Array();
				var contidArr = new Array();
				var mapxArr = new Array();
				var mapyArr = new Array();
				var addr1Arr = new Array();
				var sigunguArr = new Array();
					
				var ix = -1;
				var currentTitle = '<%=title%>';
				var items = $(xml).find('item').each(function() {
					var title = $(this).find('title').html();
					var firstimage = $(this).find('firstimage').html();
					var contentid = $(this).find('contentid').html();
					var mapx = $(this).find('mapx').html();
					var mapy = $(this).find('mapy').html();
					var addr1 = $(this).find('addr1').html();
					var sigungucode = $(this).find('sigungucode').html();
					
					// 가끔 title이 undefined 가 뜬다
					// Failed to load resource: the server responded with a status of 404 ()
					
					// 아래의 console.log로 테스트한 결과는 undefine가 떴을때
					// test: 타이틀은 정상적으로 가져왔다
					console.log('title'+title);
					
					// 현재 페이지와 같은 곳이면 피한다
					if(title != currentTitle){
						ix++;
						titleArr.push(title);
						imageArr.push(firstimage);
						contidArr.push(contentid);
						mapxArr.push(mapx);
						mapyArr.push(mapy);
						addr1Arr.push(addr1);
						sigunguArr.push(sigungucode);
					}
				});
				
				// test: ix+1이 10일때도 undefined가 뜬다
				console.log(ix);
					
				// 0~9
				var i1 = Math.floor(Math.random() * ix); 
				var i2 = Math.floor(Math.random() * ix);
				var i3 = Math.floor(Math.random() * ix);
				while( i1 == i2 || i1 == i3 || i2 == i3){
					i1 = Math.floor(Math.random() * ix);
					i2 = Math.floor(Math.random() * ix);
					i3 = Math.floor(Math.random() * ix);
				}
				
				// test : 값 이상 없음 (2, 7, 9)
				console.log('i1: '+i1);
				console.log('i2: '+i2);
				console.log('i3: '+i3);
				
				var indexArr = new Array(i1, i2, i3);
				
				var recohtml = '';
				for(var i=0; i<3; i++){
					
					recohtml += '<div onclick=\"javascript:viewPage(';
					recohtml += contidArr[indexArr[i]] + ',' + mapxArr[indexArr[i]] + ',' + mapyArr[indexArr[i]] + ',' + '\'' + titleArr[indexArr[i]] + '\'';
					recohtml += ',' + '\'' + addr1Arr[indexArr[i]] + '\'' + ',' + <%=areaCode%> +','+ '\'' + imageArr[indexArr[i]] + '\' ,' + sigunguArr[indexArr[i]] + ');\">';
					recohtml += '<img src=\"'+ imageArr[indexArr[i]] +'\" />';
					recohtml += '<div>' + titleArr[indexArr[i]] + '</div>';
					recohtml += '</div>';
				}
				
				$('.reco').html(recohtml);
			},
			error: function(xhr) {
				alert(xhr.status + '' + xhr.statusText);
			}
		});
	}
	// 추천목록
	function accoList() {
		$.ajax({
			url : 'http://localhost:9090/TripTrip/accolist2',
			data : {
				areaCode: <%=areaCode%> },
			type: 'GET',
			success: function(xml) {
				 
				var titleArr = new Array();
				var imageArr = new Array();
				var contidArr = new Array();
				var mapxArr = new Array();
				var mapyArr = new Array();
				var addr1Arr = new Array();
				var sigunguArr = new Array();
					
				var ix = -1;
				var currentTitle = '<%=title%>';
				var items = $(xml).find('item').each(function() {
					var title = $(this).find('title').html();
					var firstimage = $(this).find('firstimage').html();
					var contentid = $(this).find('contentid').html();
					var mapx = $(this).find('mapx').html();
					var mapy = $(this).find('mapy').html();
					var addr1 = $(this).find('addr1').html();
					var sigungucode = $(this).find('sigungucode').html();
					
					// 가끔 title이 undefined 가 뜬다
					// Failed to load resource: the server responded with a status of 404 ()
					
					// 아래의 console.log로 테스트한 결과는 undefine가 떴을때
					// test: 타이틀은 정상적으로 가져왔다
					console.log('title'+title);
					
					// 현재 페이지와 같은 곳이면 피한다
					if(title != currentTitle){
						ix++;
						titleArr.push(title);
						imageArr.push(firstimage);
						contidArr.push(contentid);
						mapxArr.push(mapx);
						mapyArr.push(mapy);
						addr1Arr.push(addr1);
						sigunguArr.push(sigungucode);
					}
				});
				
				// test: ix+1이 10일때도 undefined가 뜬다
				console.log(ix);
					
				// 0~9
				if(ix == 10){
					ix--;
				}
				var i1 = Math.floor(Math.random() * ix); 
				var i2 = Math.floor(Math.random() * ix);
				var i3 = Math.floor(Math.random() * ix);
				while( i1 == i2 || i1 == i3 || i2 == i3){
					i1 = Math.floor(Math.random() * ix);
					i2 = Math.floor(Math.random() * ix);
					i3 = Math.floor(Math.random() * ix);
				}
				
				// test : 값 이상 없음 (2, 7, 9)
				console.log('i1: '+i1);
				console.log('i2: '+i2);
				console.log('i3: '+i3);
				
				var indexArr = new Array(i1, i2, i3);
				
				var recohtml = '';
				for(var i=0; i<3; i++){
					
					recohtml += '<div onclick=\"javascript:viewPage(';
					recohtml += contidArr[indexArr[i]] + ',' + mapxArr[indexArr[i]] + ',' + mapyArr[indexArr[i]] + ',' + '\'' + titleArr[indexArr[i]] + '\'';
					recohtml += ',' + '\'' + addr1Arr[indexArr[i]] + '\'' + ',' + <%=areaCode%> +','+ '\'' + imageArr[indexArr[i]] + '\' ,' + sigunguArr[indexArr[i]] + ');\">';
					recohtml += '<img src=\"'+ imageArr[indexArr[i]] +'\" />';
					recohtml += '<div>' + titleArr[indexArr[i]] + '</div>';
					recohtml += '</div>';
				}
				
				$('.acco').html(recohtml);
			},
			error: function(xhr) {
				alert(xhr.status + '' + xhr.statusText);
			}
		});
	}
	
	
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
	
	
	$(function() {
		var total = 0;
		total = getSlideImg()-1;
		
		console.log('total: '+total);
		
		getInfo();
		getInfo2();
		recommList();
		accoList()
		var index = 0;
		
		
		$('.next').on('click', function() {
			if(index < total){
				index++;
			}else{
				index = 0;
			}
			console.log('index: ' + index);
			console.log('total: ' + total);
			$('.slide img').fadeOut(300);
			$('.slide img').eq(index).fadeIn(300);	
		});
		
		$('.prev').on('click', function() {
			if(index > 0){
				index--;
			}else {
				index = 0;
			}
			console.log('index: ' + index);
			console.log('total: ' + total);
			$('.slide img').fadeOut(300);
			$('.slide img').eq(index).fadeIn(300);	
		});
		
		
		
		///////////////////////////////////////////////
		////////지도///////////////////////////////////
		///////////////////////////////////////////////
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(<%=mapy%>, <%=mapx%>), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 지도를 클릭한 위치에 표출할 마커입니다
		var marker = new kakao.maps.Marker({ 
		    // 지도 중심좌표에 마커를 생성합니다 
		    position: map.getCenter() 
		}); 
		// 지도에 마커를 표시합니다
		marker.setMap(map);
		
		// 마커에 클릭이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'click', function() {
		      window.open('https://map.kakao.com/link/to/<%=title%>,<%=mapy%>,<%=mapx%>,카카오맵');
		});
    });
</script>

</head>

<body>

	<%@ include file="nav.jsp"%>
	
	<div id="wrap">
		<section id="topimg">
			<img src="<%=firstimage %>">
			<span><%=title %></span>
		</section>
		
		<section id="content">
			<div id="slides">
				<div class="slide clearfix">
					<img src="img/sejong.jpg" class="one"></img>
					<img src="img/busan.jpg" class="two"></img>
					<img src="img/daegu.jpg" class="three"></img>
					<div class="prev">&lt;</div>
					<div class="next">&gt;</div>
				</div>
			</div>
			<div id="infomation">
				<span>정보</span>
				<hr><br>
				<div id="info">
				
					<div id="map" style="width:500px;height:400px;"></div>
    				
					<div class="explain">
						<div class="overview"></div>
						<div class="detail"></div>
					</div>
				</div>
			</div>
			
			<div id="recommend">
				<span>추천관광지</span>
				<hr>
				<div class="reco"></div>
			</div>
			
				<div id="recommend1">
				<span>인근 숙소</span>
				<hr>
				<div class="acco"></div>
			</div>

		</section>
		
	</div> <!--wrap  -->
	
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