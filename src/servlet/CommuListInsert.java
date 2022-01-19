package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TripDao;
import vo.TripVo;


@WebServlet("/insert")
public class CommuListInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String tag = request.getParameter("tag");
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		System.out.println("변경전: " + content);
		content = content.replaceAll("\r\n", "&#10;");
		//content = content.replaceAll("\\n", "\\r\\n");
		
		System.out.println("변경후: " + content);
		
		TripDao tDao = new TripDao();
		
		TripVo tVo = new TripVo(0, tag, title, writer, content);
		tDao.insert(tVo);
		
		response.sendRedirect("project.jsp");

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
