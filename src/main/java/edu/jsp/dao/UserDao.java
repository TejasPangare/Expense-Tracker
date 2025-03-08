package edu.jsp.dao;

import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.time.LocalDate;
import java.util.List;

import edu.jsp.entity.Expense;
import edu.jsp.entity.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;

public class UserDao {

	private static EntityManagerFactory factory = Persistence.createEntityManagerFactory("Expenses_Tracker");
	private static EntityManager manager = factory.createEntityManager();
	private static EntityTransaction transaction = manager.getTransaction();

	public void registerUser(User user) {
		transaction.begin();
		manager.persist(user);
		transaction.commit();
	}

	public User findByEmail(String email) {
		try {
			String query = "SELECT u FROM User u WHERE u.email =?1";
			Query jpql = manager.createQuery(query);
			jpql.setParameter(1, email);
			User userFromDb = (User) jpql.getSingleResult();
			return userFromDb;
		} catch (Exception e) {
//			System.out.println(e.getMessage());
		}
		return null;
	}

	public User loginUser(User user) {
		try {
			String query = "SELECT u FROM User u WHERE u.email = ?1 AND u.password = ?2";
			Query jpql = manager.createQuery(query);
			jpql.setParameter(1, user.getEmail());
			jpql.setParameter(2, user.getPassword());
			User userFromDb = (User) jpql.getSingleResult();
			return userFromDb;
		} catch (Exception e) {
			// Handle case when no user is found
			return null;
		}
	}
	
	public void updateUserInfo(User user, int currentId) throws Exception
	{
		User userFromDb= (User)manager.find(User.class,currentId);
		userFromDb.setName(user.getName());
		userFromDb.setEmail(user.getEmail());
		userFromDb.setMobile(user.getMobile());
		userFromDb.setPassword(user.getPassword());
		transaction.begin();
		manager.merge(userFromDb);
		transaction.commit();
	}
	
	public double lastWeekExpenses(User user) {
		String query = "Select sum(e.amount) from Expense e where e.user_id= :user_id and e.dateTime > :dateOfWeek";
		Query jpql = manager.createQuery(query);
		LocalDate date= LocalDate.now().minusDays(7);
		jpql.setParameter("dateOfWeek",date);
		jpql.setParameter("user_id", user);
		try {
			double total = (Double) jpql.getSingleResult();
			return total;
			}catch(Exception e)
			{
				return 0.0;
			}
	}

	public double lastMonthExpenses(User user) {
		String query="Select sum(e.amount) from Expense e where e.user_id= :user_id and date_format(e.dateTime,'%m') = date_format(sysdate(),'%m')";
		Query jpql = manager.createQuery(query);
		jpql.setParameter("user_id", user);
		try {
			double total = (Double) jpql.getSingleResult();
			return total;
			}catch(Exception e)
			{
				return 0.0;
			}
	}
	
	public double totalExpenses(User user) {
		String query="Select sum(e.amount) from Expense e where e.user_id= :user_id";
		Query jpql = manager.createQuery(query);
		jpql.setParameter("user_id", user);
		try {
		double total = (Double) jpql.getSingleResult();
		return total;
		}catch(Exception e)
		{
			return 0.0;
		}
	}
	
	public String getPassword(String email)
	{
		User userFromDb = findByEmail(email);
		if(userFromDb != null)
			{
				return "YOUR PASSWORD IS " + userFromDb.getPassword();
			}
		return "CHECK IF THE EMAIL ID IS VALID";
	}
}
