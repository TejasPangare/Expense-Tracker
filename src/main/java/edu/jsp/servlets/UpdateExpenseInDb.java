package edu.jsp.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.jsp.dao.ExpenseDao;
import edu.jsp.entity.Expense;

@WebServlet("/updatee")
public class UpdateExpenseInDb extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id =Integer.parseInt(req.getParameter("expenseId"));
		ExpenseDao dao = new ExpenseDao();
		req.setAttribute("expense", dao.findExpense(id));
		RequestDispatcher dispatcher = req.getRequestDispatcher("updateexpense.jsp");
		dispatcher.forward(req, resp);
	}
}
