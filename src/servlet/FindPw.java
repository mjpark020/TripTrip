package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemDao;


@WebServlet("/findpw")
public class FindPw extends HttpServlet {private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String	id		=	request.getParameter("id");
		String	email	=	request.getParameter("email");
		
		 MemDao memDao = new MemDao();
         String mem_pw = memDao.findPw(id, email);
         
         if(mem_pw != null) {
             response.sendRedirect("find_pw_result.jsp?mem_pw="+mem_pw);
             
             request.getSession().setAttribute("mem_pw", mem_pw);
             response.sendRedirect("find_pw_result.jsp");
          }
          else {
             response.sendRedirect("findpw.jsp?error1");
          }
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
