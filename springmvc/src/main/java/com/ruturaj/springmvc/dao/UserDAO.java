package com.ruturaj.springmvc.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Component;

import com.ruturaj.springmvc.dto.UserDTO;

@Component
public class UserDAO {
	
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	private EntityManagerFactory entityManagerFactory;
	private EntityManager entityManager;
	private EntityTransaction entityTransaction;
	
	private void openConnection() {
		entityManagerFactory = Persistence.createEntityManagerFactory("contact_manager");
		entityManager = entityManagerFactory.createEntityManager();
		entityTransaction = entityManager.getTransaction();
	}
	
	private void closeConnection() {
		if(entityManagerFactory != null)
			entityManagerFactory.close();
		if(entityManager != null)
			entityManager.close();
		if(entityTransaction != null) {
			if(entityTransaction.isActive())
				entityTransaction.rollback();
		}
	}
	
	public void addUser(UserDTO userDTO) {
		openConnection();
		entityTransaction.begin();
		entityManager.persist(userDTO);
		entityTransaction.commit();
		closeConnection();
	}

	public UserDTO authUser(String email, String password) {
		openConnection();
		UserDTO user = null;
		try {
			Query query = entityManager.createQuery("SELECT user FROM UserDTO user WHERE user.email = :email AND user.password = :password");
			query.setParameter("email", email);
			query.setParameter("password", password);
			user = (UserDTO) query.getSingleResult();
		} catch (NoResultException e) {
			System.out.println("No user found for provided credentials.");
		} finally {
			closeConnection();
		}
		return user;
	}
	
	public void deleteUser(int id) {
	    openConnection();
	    entityTransaction.begin();
	    UserDTO userDTO = entityManager.find(UserDTO.class, id);
	    if (userDTO != null) {
	        entityManager.remove(userDTO);
	    }
	    entityTransaction.commit();
	    closeConnection();
	}
	
	public UserDTO findUserById(int id) {
	    openConnection();
	    UserDTO userDTO = entityManager.find(UserDTO.class, id);
	    closeConnection();
	    return userDTO;
	}

	public void updateUser(UserDTO userDTO) {
	    openConnection();
	    entityTransaction.begin();
	    entityManager.merge(userDTO);  // This will update the user in the database
	    entityTransaction.commit();
	    closeConnection();
	}




}
