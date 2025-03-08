package edu.jsp.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.jsp.dao.FeedbackDao;
import edu.jsp.entity.Feedback;
import edu.jsp.entity.User;

@WebServlet("/addFeedback")
public class AddFeedback extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User currentUser =(User) req.getSession().getAttribute("currentUser");
		Feedback feedback = new Feedback();
		FeedbackDao dao = new FeedbackDao();
		feedback.setMessage(req.getParameter("message"));
		feedback.setRating(Integer.valueOf(req.getParameter("rating")));
		System.out.println(req.getParameter("message"));
		
		dao.addFeedback(currentUser, feedback);
		
		resp.sendRedirect("home.jsp");
	}
}
