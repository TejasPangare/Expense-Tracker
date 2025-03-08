package edu.jsp.servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.jsp.dao.ExpenseDao;
import edu.jsp.entity.Expense;
import edu.jsp.entity.User;

@WebServlet("/addexpense")
public class AddExpenseServlet  extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ExpenseDao dao = new ExpenseDao();
		Expense expense = new Expense();
		HttpSession session = req.getSession();
		User user =(User)session.getAttribute("currentUser");
		expense.setAmount(Double.parseDouble(req.getParameter("amount")));
		expense.setDescription(req.getParameter("category"));	
		expense.setDateTime(LocalDate.parse(req.getParameter("date")));
		expense.setUser_id(user);
		dao.addExpense(expense);
		resp.sendRedirect("showexpenses");
	}
}
