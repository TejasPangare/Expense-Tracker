package edu.jsp.servlets;

import java.io.IOException;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.jsp.dao.UserDao;
import edu.jsp.entity.User;

@WebServlet("/updateUserInfo")
public class UpdateUserInfo extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User cuser = (User) session.getAttribute("currentUser");
		UserDao dao = new UserDao();
		User user = new User();
		user.setName(req.getParameter("name"));
		user.setEmail(req.getParameter("email"));
		user.setPassword(req.getParameter("password"));
		user.setMobile(Long.parseLong(req.getParameter("mobile")));
		try {
			dao.updateUserInfo(user, cuser.getId());
			req.setAttribute("message", "UPDATED SUCCESSFULLY!!");
			RequestDispatcher dispatcher = req.getRequestDispatcher("Login.jsp");
			dispatcher.forward(req, resp);
		} catch (Exception e) {
			System.out.println("Email id or phone number already exist");
			req.setAttribute("message", "EMAILID OR PHONE NO. ALREADY EXIST!!");
			RequestDispatcher dispatcher = req.getRequestDispatcher("Login.jsp");
			dispatcher.forward(req, resp);
		}
	}

}
