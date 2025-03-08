package edu.jsp.dao;

import java.time.LocalDate;
import java.util.List;

import edu.jsp.entity.Expense;
import edu.jsp.entity.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;

public class ExpenseDao {


	private static EntityManagerFactory factory = Persistence.createEntityManagerFactory("Expenses_Tracker");
	private static EntityManager manager = factory.createEntityManager();
	private static EntityTransaction transaction = manager.getTransaction();

	public void addExpense(Expense expense)
	{
		transaction.begin();
		manager.persist(expense);
		transaction.commit();
	}
	public List<Expense> getExpenses(User user)
	{
		String query="Select e from Expense e where e.user_id= :user_id";
		Query jpql = manager.createQuery(query);
		jpql.setParameter("user_id", user);
		List<Expense> expenses =  jpql.getResultList();
		return expenses;
	}
	public int removeExpense(int expenseId)
	{
		transaction.begin();
		String query="Delete from Expense where expenseId=?1";
		Query jpql = manager.createQuery(query);
		jpql.setParameter(1, expenseId);
		int rec = jpql.executeUpdate();
		transaction.commit();
		return rec;
	}
	public Expense findExpense(int expenseId)
	{
		transaction.begin();
		Expense expense = manager.find(Expense.class, expenseId);
		transaction.commit();
		return expense;
	}
	
	public void updateExpense(Expense e) {
		transaction.begin();
		manager.merge(e);
		transaction.commit();
	}
	public List<Expense> getExpensesSortedByDate(User user)
	{
		String query="Select e from Expense e where e.user_id= :user_id order by dateTime";
		Query jpql = manager.createQuery(query);
		jpql.setParameter("user_id", user);
		List<Expense> expenses =  jpql.getResultList();
		return expenses;
	}
	public List<Expense> getExpensesSortedByAmount(User user)
	{
		String query="Select e from Expense e where e.user_id= :user_id order by amount";
		Query jpql = manager.createQuery(query);
		jpql.setParameter("user_id", user);
		List<Expense> expenses =  jpql.getResultList();
		return expenses;
	}
	public List<Expense> getExpensesForThisMonth(User user)
	{
		String query="Select e from Expense e where e.user_id= :user_id and date_format(e.dateTime,'%m') = date_format(sysdate(),'%m')";
		Query jpql = manager.createQuery(query);
		jpql.setParameter("user_id", user);
		List<Expense> expenses =  jpql.getResultList();
		return expenses;
	}
	public List<Expense> getExpensesForThisWeek(User user)
	{
		String query="Select e from Expense e where e.user_id= :user_id and e.dateTime > :dateOfWeek";
		Query jpql = manager.createQuery(query);
		LocalDate date= LocalDate.now().minusDays(7);
		jpql.setParameter("dateOfWeek",date);
		jpql.setParameter("user_id", user);
		List<Expense> expenses =  jpql.getResultList();
		return expenses;
	}
}
