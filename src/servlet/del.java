package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.TripDao;
import vo.TripVo;

@WebServlet("/del")
public class del extends HttpServlet {
    private static final long serialVersionUID = 1L;
   
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//      
//    		TripDao dao = new TripDao();
//    		HttpSession session = request.getSession();
//
//    		int num =  Integer.parseInt(request.getParameter("num"));      
//    		
//            String writer = (String)session.getAttribute("writer");
//           
//        
//            dao.delet(num,writer);
//            System.out.println("get:get 방식 ");

       
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
        
  		TripDao dao = new TripDao();
		HttpSession session = request.getSession();

		int num =  Integer.parseInt(request.getParameter("num"));      
		
        String writer = request.getParameter("writer");
       
        System.out.println("del num :" + num);
        System.out.println("del writer :" + writer);
    
        dao.delet(num,writer);
       
    }
 
}
