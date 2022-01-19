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
		margin-top: 100px;
		width: 1200px;
	}
	header {background-color:orange;}
	ul {margin-left: 100px;}
	ul li {
		display:inline-block;
		padding: 10px;
	}
	#inputs {text-align:right;}
	button {
		background-color: skyblue;
		border-radius: 10px;
	}
	#wraper {height:600px;}
	table {
		width: 1200px;
		border-collapse: collapse;
	}
	tr:first-child {background-color:skyblue;}
	tr:not(:first-child):nth-child(even){background-color: #CCF9F9;}
	th {width: 11%;}
	td {width: 11%;}
	div {text-align:center; }
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
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	
function getCommuList(keyword) {
	$.ajax({
		url: 'http://localhost:8080/TripTrip/Commulist',
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
					 
					 html += '<td>'; 
					 html +=  item.tag;
					 html += '</td>'; 
					 
					 html += '<td onclick=\"location.href =\'contentView.jsp?num='+ item.num + '\'\">';
					 html +=  item.title;
					 html += '</td>'; 
					 
					 html += '<td>'; 
					 html +=  item.writer;
					 html += '</td>'; 
					 
					 html += '</tr>';
				 }
				 
				 $('#tb').html( html );
			 });
			console.log(html);
			
		},
		error: function(xhr){
			console.log(xhr.status);
		}
	});
}
	

$("document").ready(function(){    
	
	getCommuList();
		
	//page 생성 
	var rowPerPage = 15;
		
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
			 <button id="write" onclick = "<%=insertCont%>">글쓰기</button>
			 <button id="edit" onclick = "location.href ='edit.jsp'">수정</button>
		</div>
		<div id="wraper">
			<table id="tb">	</table>
		</div>
		<hr>
		<div id="paging"></div>
	</main>
</body>
</html>