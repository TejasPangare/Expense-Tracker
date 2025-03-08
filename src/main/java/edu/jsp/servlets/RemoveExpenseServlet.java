package edu.jsp.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.jsp.dao.ExpenseDao;

@WebServlet("/removeexpense")
public class RemoveExpenseServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ExpenseDao dao=new ExpenseDao();
		int expenseId = Integer.parseInt(req.getParameter("expenseId"));
		int record=dao.removeExpense(expenseId);
		if(record !=0)
		{
			resp.sendRedirect("showexpenses");
		}
		else {
			System.out.println("not removed");
		}
	}
}
