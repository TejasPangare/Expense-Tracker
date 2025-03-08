package edu.jsp.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.jsp.dao.UserDao;

@WebServlet("/forgotPassword")
public class ForgotPasssword extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDao dao = new UserDao();
		String email = req.getParameter("email");
		if(email != null){ 
			String pwd = dao.getPassword(email);
			req.setAttribute("password",pwd);
			RequestDispatcher dispatcher = req.getRequestDispatcher("Login.jsp");
			dispatcher.forward(req, resp);
		}
	}
}
