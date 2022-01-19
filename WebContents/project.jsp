<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	* {
		margin: 0px auto; 
		font-family: "Malgun Gothic", Georgia, serif; 
	}
	main {
	position:relative;
		margin-top: 100px;
		width: 1200px;
	}
	header {background-color:orange;}
	ul {margin-left: 100px;}
	ul li {
		display:inline-block;
		padding: 10px;
	}
	#inputs {text-align:right; margin-bottom: 20px;}
	#inputs #keyword {
		width: 300px;
		height: 30px;
	}
	button {
		background-color: skyblue;
		border-radius: 10px;
		width: 70px;
		height: 30px;
		border: none;
		background-color: #FFC997;
		color: #E83D3C;
		font-weight: bold;
	}
	#wraper {height:600px;}
	table {
		border-collapse: collapse;
	}
	th:first-child {
		width: 232px;
	}
	th:nth-of-type(2) {
		width: 634px;
	}
	th:nth-of-type(3) {
		width: 334px;
	}
	td:nth-of-type(3) {
		text-align: left;
	}
	th, td {
		padding: 10px;
	}
	tr:first-child {
		background-color:rgb(245,245,245); 
		border-top: 1px solid rgb(190,190,190); 
		border-bottom: 1px solid rgb(190,190,190);
	}
	/* tr:not(:first-child):nth-child(even){background-color: #CCF9F9;} */
	tr:not(:first-child){border-bottom: 1px solid rgb(190,190,190);}
	/* th {width: 800px;}
	td {width: 800px;} */
	div {text-align:center; }
	#paging {margin-bottom: 30px;}
	#paging a {padding: 5px; color: black;}
	.off-screen {
		display: none;
	}
	footer div {
		background-color: skyblue;
		border: 1px solid blue;
		text-align: left;
		width: 900px;
		height:100px;
	}
	#write{
	position:absolute;
	right:10px;
	bottom:-15px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

//게시물 열람
function view(num,tag,title,writer,content){
	
	$.ajax({
	type:'get',  
	url:'view.jsp',   
	data: {
	        num:num,
	        tag:tag,
	        title:title,
	        writer:writer,
	        content:content
	},// 전송할 데이터
	dataType:'text',   //html 파일 형식으로 값을 담아온다.
	success : function(data){   //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
		$('#inputs').clear;
		$('#inputs').html(data);  //현재 화면 위 id="message" 영역 안에 data안에 담긴 html 코드를 넣어준다. 
	},
    error: function(xhr,error){
		console.log(xhr.status);
		console.log(error);
	}
	});	
}



// 글 목록
function getCommuList(keyword) {
	
	$.ajax({
		url: 'http://localhost:9090/TripTrip/Commulist',
		data: {keyword: keyword},
		type: 'GET',
		dataType: "json",
		async : false,
		success: function(json) {
			
			console.log(json);
			 var  html = '';
			 html += '<tr>';
			 html += "<th>카테고리</th>";
			 html += "<th>제목</th>";
			 html += "<th>글쓴이</th>";
			 html += '</tr>';
	
			 
			 json.forEach(function( item, index ) {
				 
				 if(item.num == 0){
					
					 html += '<tr>';
					 html += '<td colspan=\"3\">결과가 없습니다</td>';
					 html += '</tr>';
				
					 
					 alert('결과가없습니다');
					 
				 }else{
			
					 html += '<tr>';
					
					 html += '<td class="hi">'; 
					 html +=  item.num;
					 html += '</td>'; 
					 
					 
					 html += '<td>'; 
					 html +=  item.tag;
					 html += '</td>'; 
					 
					 html += '<td>';
					 html +=  item.title;
					 html += '</td>'; 
					 
					 html += '<td>'; 
					 html +=  item.writer;
					 html += '</td>'; 
					 
					 html += '<td class="hi">'; 
					 html +=  item.content.replaceAll("rn","\n");
					 html += '</td>'; 
					 
					 html += '</tr>';
			
				 }
				 
				 $('#tb').html( html );
			 });
			console.log(html);
			
			// 게시물 클릭시
		 	$('tr:not(:first-child)').click(function(){
		 		
		 		var tr = $(this);
		 		var td = tr.children();
		 		
		 		
		 		var num = td.eq(0).text();
		 		
		 		console.log('num: '+num);
				var tag = td.eq(1).text();
				var title = td.eq(2).text();
				var writer = td.eq(3).text();
				var content = td.eq(4).text();
				
				
				view(num,tag,title,writer,content);
		 	});
		 				
		},
		error: function(xhr,error){
			console.log('에러'+xhr.status);
			console.log('에러'+error);
			
		}
	});
	$(".hi").attr('style', "display:none;");   
}
	

//////////window.onload
$("document").ready(function(){    
	
	getCommuList();
		
	//page 생성 
	var rowPerPage = 13;
		
	var $tb = $('#tb');

	var $tr = $($tb).find('tr:not(:first-child)');
	var rowTotals = $tr.length;

	var pageTotal = Math.ceil(rowTotals/ rowPerPage);
	var i = 0;

	for (; i < pageTotal; i++) {
		$('<a href="#"></a>')
				.attr('rel', i)
				.html(i + 1)
				.appendTo('#paging');
	}

	$tr.addClass('off-screen')
			.slice(0, rowPerPage)
			.removeClass('off-screen');

	var $pagingLink = $('#paging a');
	$pagingLink.on('click', function (evt) {
		evt.preventDefault();
		var $this = $(this);
		if ($this.hasClass('active')) {
			return;
		}
		$pagingLink.removeClass('active');
		$this.addClass('active');


		var currPage = $this.attr('rel');
		var startItem = currPage * rowPerPage;
		var endItem = startItem + rowPerPage;

		$tr.css('opacity', '0.0')
				.addClass('off-screen')
				.slice(startItem, endItem)
				.removeClass('off-screen')
				.animate({opacity: 1}, 300);

	});

	$pagingLink.filter(':first').addClass('active');
 	// 페이지 생성 끝
	
	 	
 	
 	
 	// 검색 버튼
	$('#search').click(function() {
		var keyword = $('#keyword').val();
		getCommuList(keyword);
	});
 	
 	
});




	
	
</script>
</head>
<body>
	<%@include file="nav.jsp" %>
	<main>
		<h2>커뮤니티</h2>
		<div id="inputs">
			 <input type="text" id="keyword" />
			 <button id="search">검색</button>
	
		</div>
		<div id="wraper">
			<table id="tb">	</table>		
		</div>
			 <button id="write" onclick = "<%=insertCont%>">글쓰기</button>
		<hr>
		<div id="paging"></div>
	</main>
</body>
</html>