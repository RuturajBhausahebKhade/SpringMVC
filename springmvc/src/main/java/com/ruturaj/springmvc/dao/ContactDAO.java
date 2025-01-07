package com.ruturaj.springmvc.dao;

import java.util.List;


import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Component;

import com.ruturaj.springmvc.dto.ContactDTO;
import com.ruturaj.springmvc.dto.UserDTO;

@Component
public class ContactDAO {

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

	public void addContact(ContactDTO contactDTO) {
		openConnection();
		entityTransaction.begin();
		entityManager.persist(contactDTO);
		entityTransaction.commit();
		closeConnection();
	}

	private void openConnection() {
		entityManagerFactory = Persistence.createEntityManagerFactory("contact_manager");
		entityManager = entityManagerFactory.createEntityManager();
		entityTransaction = entityManager.getTransaction();
	}

	private void closeConnection() {
		if (entityManagerFactory != null)
			entityManagerFactory.close();
		if (entityManager != null)
			entityManager.close();
		if (entityTransaction != null) {
			if (entityTransaction.isActive())
				entityTransaction.rollback();
		}
	}

	@SuppressWarnings("unchecked")
	public List<ContactDTO> findAllContacts() {
		openConnection();
		Query query = entityManager.createQuery("SELECT contacts FROM ContactDTO contacts");
		List<ContactDTO> contacts = query.getResultList();
		closeConnection();
		return contacts;
	}

	public void deleteContactById(int id) {
		openConnection();
		entityTransaction.begin();
		ContactDTO contact = entityManager.find(ContactDTO.class, id);
		entityManager.remove(contact);
		entityTransaction.commit();
		closeConnection();
	}

	public ContactDTO findContactById(int id) {
		openConnection();
		ContactDTO contactDTO = entityManager.find(ContactDTO.class, id);
		closeConnection();
		return contactDTO;
	}

	public void updateContact(int id, String firstName, String lastName, String email, long mobile, long work,
			String gender, String dob, String address, String website) {
		openConnection();
		ContactDTO contactDTO = entityManager.find(ContactDTO.class, id);
		contactDTO.setFirstName(firstName);
		contactDTO.setLastName(lastName);
		contactDTO.setEmail(email);
		contactDTO.setMobile(mobile);
		contactDTO.setWork(work);
		contactDTO.setGender(gender);
		contactDTO.setDob(dob);
		contactDTO.setAddress(address);
		contactDTO.setWebsite(website);
		entityTransaction.begin();
		entityManager.persist(contactDTO);
		entityTransaction.commit();
		closeConnection();
	}

	public List<ContactDTO> findContactByFirstName(String firstName) {
		openConnection();
		Query query = entityManager.createQuery("SELECT contacts FROM ContactDTO contacts WHERE contacts.firstName LIKE ?1");
		query.setParameter(1, firstName);
		@SuppressWarnings("unchecked")
		List<ContactDTO> contacts = query.getResultList();
		closeConnection();
		return contacts;
	}

	public List<UserDTO> searchContact(String data, int id) {
		openConnection();
		String queryStr = "SELECT contact FROM ContactDTO contact WHERE contact.user.id = :userId " +
                "AND (contact.firstName LIKE :data " +
                "OR contact.lastName LIKE :data " +
                "OR contact.email LIKE :data " +
                "OR contact.mobile LIKE :data " +
                "OR contact.work LIKE :data " +
                "OR contact.gender LIKE :data)";
		Query query = entityManager.createQuery(queryStr);
		query.setParameter("userId", id);
		query.setParameter("data", "%" + data + "%");
		@SuppressWarnings("unchecked")
		List<UserDTO> contacts = query.getResultList();
		closeConnection();
		return contacts;

	}

}