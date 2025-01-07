package com.ruturaj.springmvc.service;

import javax.persistence.NoResultException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ruturaj.springmvc.dao.UserDAO;
import com.ruturaj.springmvc.dto.UserDTO;

@Component
public class UserService {
	
	@Autowired
	private UserDAO userDAO;
	
	public boolean addUser(String name, String email, long mobile, String password) {
		UserDTO userDTO = new UserDTO();
		userDTO.setName(name);
		userDTO.setEmail(email);
		userDTO.setMobile(mobile);
		userDTO.setPassword(password);
		try {
			userDAO.addUser(userDTO);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	public UserDTO authUser(String email, String password) {
		try {
			UserDTO user = userDAO.authUser(email, password);
			if(user.getEmail().equals(email) && user.getPassword().equals(password))
				return user;
		} catch (NoResultException e) {
			e.printStackTrace();;
		}
		return null;
	}
	
	public boolean deleteUser(int id) {
	    try {
	        userDAO.deleteUser(id);
	        return true;
	    } catch (Exception e) {
	        return false;
	    }
	}
	
	public boolean updateUser(int id, String name, String email, long mobile, String password) {
	    try {
	        // Find the user by ID
	        UserDTO userDTO = userDAO.findUserById(id);
	        if (userDTO != null) {
	            // Update user details
	            userDTO.setName(name);
	            userDTO.setEmail(email);
	            userDTO.setMobile(mobile);
	            userDTO.setPassword(password);

	            // Save the updated user
	            userDAO.updateUser(userDTO);
	            return true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
	}




}
