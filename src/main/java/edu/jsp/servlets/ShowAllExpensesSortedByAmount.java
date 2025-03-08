package edu.jsp.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.jsp.dao.ExpenseDao;
import edu.jsp.entity.Expense;
import edu.jsp.entity.User;

@WebServlet("/sortByAmount")
public class ShowAllExpensesSortedByAmount extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("currentUser");
		ExpenseDao dao=new ExpenseDao();
		List<Expense> expenses = dao.getExpensesSortedByAmount(user);
		req.setAttribute("expenses", expenses);
		RequestDispatcher dispatcher = req.getRequestDispatcher("expenses.jsp");
		dispatcher.forward(req, resp);
	}
}
