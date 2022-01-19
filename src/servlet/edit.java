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

@WebServlet("/edit")
public class edit extends HttpServlet {
    private static final long serialVersionUID = 1L;
   
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
    		TripDao dao = new TripDao();
    		HttpSession session = request.getSession();

    		int num =  Integer.parseInt(request.getParameter("num"));      
    		String tag = request.getParameter("tag");
            String title = request.getParameter("title");
            String writer = request.getParameter("writer");
            String content = request.getParameter("content");
 
            TripVo vo = new TripVo();
            vo.setNum(num);
            vo.setTag(tag);
            vo.setTitle(title);
            vo.setWriter(writer);
            vo.setContent(content);
            dao.update(vo);
      
       
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
 
}
