package edu.jsp.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.jsp.dao.UserDao;
import edu.jsp.entity.User;

@WebServlet("/register")
public class RegiterServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDao dao=new UserDao();
		if(dao.findByEmail(req.getParameter("email"))==null)
		{
			User user=new User();
			HttpSession session = req.getSession();
			user.setName(req.getParameter("name"));
			user.setMobile(Long.parseLong(req.getParameter("mobile")));
			user.setEmail(req.getParameter("email"));
			user.setPassword(req.getParameter("password"));
			dao.registerUser(user);
			session.setAttribute("message", "USER REGISTERED SUCCESSFULLY !!!");
			resp.sendRedirect("home.jsp");
		}
		else {
			req.setAttribute("message", "INVALID CREDENTIALS!!");
			RequestDispatcher dispatcher = req.getRequestDispatcher("Register.jsp");
			dispatcher.forward(req, resp);
		}
		
		
	}
}
