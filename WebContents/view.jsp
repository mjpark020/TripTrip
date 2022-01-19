<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String uid = (String)session.getAttribute("uid");
	String num	= request.getParameter("num");
	String tag	= request.getParameter("tag");
	String title	= request.getParameter("title");
	String writer	= request.getParameter("writer");
	String contents	= request.getParameter("content");
	
	
	
	String contentsBr = contents.replaceAll("\n", "\\n");
			contentsBr = contentsBr.replaceAll("\\r\\n", "\\n");
	System.out.println("view con :" + contents);
	System.out.println("view :" + writer);
	System.out.println("view :" + uid);
	
	if(uid == null){
		uid = "";
	}
	
	Boolean isUid = false;
	if(uid.equals(writer)){
		isUid = true;
	}

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
         }
         #wrap {
            width: 100%;
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
         #commuForm {
         	
         }

         #title {
             font-size: 20px;
             width: 100%;
             height: 80px;
             background-image: url("img/dark-orange-wave.jpg");
             background-repeat: no-repeat;
             background-size: cover;
             border: none;
             color: white;
             font-weight: bold;
         }

		#commuForm span {
			display: inline-block;
			width: 100%;
			height: 50px;
			line-height: 50px;
			text-align: left;
			background-color: orange;
		}
         textarea {
         	margin-top: 20px;
             font-size: 16px;
             width: 100%;
             height: 300px;
             resize: none;
             border: none;
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
             font-weight: bold;
         }

         #commuForm #subm:hover {
             cursor: pointer;
         }
         
          #commuForm #subm1 {
             width: 100px;
             height: 30px;
             font-size: 16px;
             background-color: #FFC997;
             border-radius: 10px;
             border: none;
             color: #E83D3C;
         }
                #commuForm #subm1:hover {
             cursor: pointer;
         }
         
                   #commuForm #subm2 {
             width: 100px;
             height: 30px;
             font-size: 16px;
             background-color: #FFC997;
             border-radius: 10px;
             border: none;
             color: #E83D3C;
         }
                #commuForm #subm2:hover {
             cursor: pointer;
         }
         #input {
         	margin-bottom: 50px;
         }
         
    </style>
  
  
  
  
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javaScript">
  
        
  	  $("document").ready(function(){    
  	  	var isUid = '<%=isUid%>';
  	  	console.log(isUid);
  	  	
  	  	var html = '';
  	  	if(isUid == 'true'){ // 같을때 
  	  		 
	  	  	
  	  		console.log(html);
  	  	}else {
  	  		
  	  		$('#subm1').remove();
  	  		$('#subm2').remove();
  	  		
  	  		console.log(html);
  	  	}
  	  	
      });

        function edit(num,tag,title,writer,contents){
    	      console.log("edit :" + num);
  	       	  console.log("edit :" + tag);
  	       	  console.log("edit :" + title);
  	       	  console.log("edit :" + writer);
  	       	  console.log("edit :" + contents);
        	
        	$.ajax({
    			type:'POST',  
    			url:'http://localhost:9090/TripTrip/edit',
    			 data: {
    			        num:num,
    			        tag:tag,
    			        title:title,
    			        writer:writer,
    			        content:contents
    			    },// 전송할 데이터
    			success : function(data){   //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
    				   location.reload();   
    			},
    			    error: function(xhr){
    					console.log(xhr.status);
    				}
    		});
		};
        
   
        
        
        
        function del(num,writer){
        	$.ajax({
        		type:'POST',  
        		url:'http://localhost:9090/TripTrip/del',   
        		 data: {
        			 writer:writer,
        		        num:num
        		    },// 전송할 데이터 
        		success : function(){  
        			 location.reload(); 
        		},
        		error: function(xhr){
        		    console.log(xhr.status);
        		}
        });
        };
		
        
        function editmode(num,tag,title,writer,contents){
        	console.log('editmode execute');
        	
        	
        	$("#title").removeAttr("readonly");
        	 $("#content").removeAttr("readonly");
      		
      		 $("#subm2").remove();
	       	document.getElementById("subm1").value="수정";   
	       	document.getElementById("subm").value="취소";  
	        
	        
	       	  console.log(num);
	       	  console.log(tag);
	       	  console.log(title);
	       	  console.log(writer);
	       	  console.log(contents);
	       	  
	       	$('#subm1').click(function() {
	    		
	    	   	var title =	 $('#title').val();
	    	   	var content =	 $('#content').val();
	    	   	var title =	 $('#title').val();
	      	  console.log("click contents" + content);
	       		edit('<%=num%>','<%=tag%>',title,'<%=writer%>',content);
	    	});
        	
        };
         
         
        
         
        
    </script>
</head>
<body>
    <div id="wrap">
        <br>
        
        <form id="commuForm">
           	<input type="text" id="title" name="title" value="<%=title%>" readonly/><br>
           	<span>&nbsp;&nbsp;&nbsp;✠태그: <%=tag %> &nbsp;&nbsp;&nbsp; ✐작성자: <%=writer %></span>
            <textarea	id="content" name="content" readonly> <%=contents%>  </textarea>
            <div id="input">
            	<input id="subm1" type="button" value="수정하기" onclick="editmode('<%=num%>','<%=tag%>','<%=title%>','<%=writer%>','<%=contentsBr%>');" />
            	<input id="subm" type="submit" value="목록" />
            	<input id="subm2" type="button" value="삭제" onclick="del('<%=num%>','<%=writer%>')" />
            </div>
        </form>
    </div>
</body>
</html>