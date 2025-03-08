package edu.jsp.servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.jsp.dao.ExpenseDao;
import edu.jsp.entity.Expense;
@WebServlet("/updateexpense")
public class UpdateExpenseServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ExpenseDao dao = new ExpenseDao();
		Expense expense = dao.findExpense(Integer.parseInt(req.getParameter("id")));
		expense.setAmount(Double.parseDouble(req.getParameter("amount")));
		expense.setDescription(req.getParameter("category"));
		expense.setDateTime(LocalDate.parse(req.getParameter("date")));
		dao.updateExpense(expense);
		resp.sendRedirect("showexpenses");
	}
}
