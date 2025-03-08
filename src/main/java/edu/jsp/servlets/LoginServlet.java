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

@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		UserDao dao= new UserDao();
		User user=new User();
		user.setEmail(req.getParameter("email"));
		user.setPassword(req.getParameter("password"));
		User currUser = dao.loginUser(user);
		session.setAttribute("currentUser", currUser);
		if(currUser != null)
		{
			session.setAttribute("message","USER REGISTERED SUCCESSFULLY!!");
			resp.sendRedirect("home.jsp");
		}
		else {
			req.setAttribute("message", "INVALID CREDENTIALS!!");
			RequestDispatcher dispatcher = req.getRequestDispatcher("Login.jsp");
			dispatcher.forward(req, resp);
		}
	}
}
