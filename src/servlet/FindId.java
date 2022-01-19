package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemDao;


@WebServlet("/findid")
public class FindId extends HttpServlet {private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String	name	=	request.getParameter("name");
		String	email	=	request.getParameter("email");

		 MemDao memDao = new MemDao();
         String mem_id = memDao.findId(name, email);
         
         //출력
         if(mem_id != null) {
            response.sendRedirect("find_id_result.jsp?mem_id="+mem_id);
            
            request.getSession().setAttribute("mem_id", mem_id);
            response.sendRedirect("find_id_result.jsp");
         }
         else {
            response.sendRedirect("findid.jsp?error");
         }
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
