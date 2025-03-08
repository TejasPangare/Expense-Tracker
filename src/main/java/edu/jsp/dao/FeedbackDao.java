package edu.jsp.dao;

import edu.jsp.entity.Feedback;
import edu.jsp.entity.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;

public class FeedbackDao {
	private static EntityManagerFactory factory = Persistence.createEntityManagerFactory("Expenses_Tracker");
	private static EntityManager manager = factory.createEntityManager();
	private static EntityTransaction transaction = manager.getTransaction();

	public void addFeedback(User user,Feedback feedback)
	{
		transaction.begin();
		User userFromDb =manager.find(User.class, user.getId());
		if( userFromDb.getFeedback() != null)
		{
			manager.remove(userFromDb.getFeedback());
			manager.persist(feedback);
			userFromDb.setFeedback(feedback);
			manager.merge(userFromDb);;
		}
		else {
			manager.persist(feedback);
			userFromDb.setFeedback(feedback);
			manager.merge(userFromDb);
		}
		
		transaction.commit();
		
		
		
		
		
		
		
		
		
		
		
		
		
//		transaction.begin();
////		manager.persist(feedback);	
//		User userFromDb = manager.find(User.class, user.getId());)
//		Feedback fbfromdb = manager.find(Feedback.class, userFromDb.getFeedback().getId());
//		if(fbfromdb!=null)
//		{
//			
//		}
//		userFromDb.setFeedback(feedback);
//		manager.merge(feedback);
//		manager.merge(userFromDb);
//		transaction.commit();
	}
}
