<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>title here</title>
    <style>
         * {
            margin: 0 auto;
            padding: 0;
         }
         #wrap {
            margin-top: 100px;
            width: 60%;
         }
         #wrap > *{
             margin: 10px;
         }
         #gul {
             font-size: 28px;
             font-weight: bold;
             margin: 14px;
         }

         select {
             font-size: 16px;
             width: 200px;
             height: 40px;
         }

         #title {
             font-size: 16px;
             width: 600px;
             height: 40px;
             margin-bottom: 20px;
         }

         textarea {
             font-size: 16px;
             width: 100%;
             height: 500px;
             resize: none;
         }

         #commuForm div {
             text-align: center;
         }
         #commuForm #subm {
             width: 100px;
             height: 30px;
             font-size: 16px;
             background-color: #FFC997;
             border-radius: 10px;
             border: none;
             color: #E83D3C;
         }

         #commuForm #subm:hover {
             cursor: pointer;
         }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(function(){
        	  $(".list").click(function(){
              	location.href="project.jsp";
              })
              
              $(".sub").click(function(){
        	  var cont = $('.content').val();
        	  console.log(cont);
          	  
              })
         
        })
        
      
    </script>
</head>
<body>
	<%@include file="nav.jsp" %>
    <div id="wrap">
        <div id="gul">글쓰기</div>
        <hr>
        <span>태그를 선택해주세요</span>
        <select name="tag" form="commuForm">
            <option value="자유">자유</option>
            <option value="여행정보">여행정보</option>
            <option value="여행후기">여행후기</option>
            <option value="질문">질문</option>
        </select>
        <br>
        
        <form id="commuForm" action="insert" method="POST">
            <input type="hidden" name="writer" value="<%=uid%>" />
            <input type="text" id="title" name="title" placeholder="제목을 입력해주세요" /><br>
            <textarea rows="2" cols="20" wrap="hard" class="content" name="content" placeholder="내용을 입력해주세요"></textarea>
            <div>
            <input id="subm" type="submit" value="등록" class="sub"/>
            <input id="subm" type="button" value="목록" class ="list"  />
            
            </div>
        </form>
    </div>
</body>
</html>