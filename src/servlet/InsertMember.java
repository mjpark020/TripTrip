package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemDao;
import vo.MemVo;


@WebServlet("/insertmember")
public class InsertMember extends HttpServlet {private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id		=	request.getParameter("id");
		String password	=	request.getParameter("password");
		String email	=	request.getParameter("email");
		String name		=	request.getParameter("name");
		String tel		=	request.getParameter("tel");
		
		MemDao	memDao	=	new	MemDao();
		MemVo	memVo	=	new	MemVo(id, password, email, name, tel);
		memDao.insertmember(memVo);
		
		String	path	=	"/Login.html";
		request.getRequestDispatcher(path).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
