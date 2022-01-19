package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TripDao;
import vo.TripVo;




@WebServlet("/Commulist")
public class CommuListJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String keyword = request.getParameter("keyword");
		System.out.println(keyword);
		
		TripDao       TripDao   =  new TripDao();
		List<TripVo> CommuList = null;
		
		if(keyword != null) {
			System.out.println("검색 실행됨");
			CommuList = TripDao.getCommuList(keyword);
		}else {
			
			System.out.println("첫화면");
			CommuList  =  TripDao.getCommuList();
		}
		

		String         list      =  "";

		list += "[";
	
		
		for (int i = 0; i < CommuList.size(); i++) {
			list     +=   CommuList.get(i).toJSON() ;
			if( i < CommuList.size()-1 )
			list     +=  "," ;
		}		
		list     +=  "]";
		

		// bookList -> JSON 변경
		// simple json library
		// 자바라이브러리 : JSONObject, JSONArray, JSONParser
		// JSONObject : 자바클래스한개에 대응하는 json {} 한개 만듬
		// JSONArray  : 자바클래스배열에 대응하는 
		// json 배열 [ {}, {}, {} ] 한개 만듬
		
		// JSONObject  jsObj  = new JSONObject();
		// jsObj.put("page",    "1");
		// jsObj.put("total",   "3");
		// jsObj.put("records", "23");
		
		// JSONArray   jsArr = new JSONArray();
		// for (TripVo TripVo : CommuList) {
		// 	JSONObject   obj = new JSONObject();						
		// 	obj.put("num",    TripVo.getNum() );
		// 	obj.put("tag",  TripVo.getTag() );
		// 	obj.put("title", TripVo.getTitle());
		// 	obj.put("writer",   TripVo.getWriter() );
			
		// 	jsArr.add(obj);
		// }
		// jsObj.put("user", jsArr);
		
		// String json = jsObj.toJSONString() ;
				

		System.out.println(list);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out  = response.getWriter();
//		out.write(list);
		out.print( list );
		out.close();	
		
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	
	

	

}
