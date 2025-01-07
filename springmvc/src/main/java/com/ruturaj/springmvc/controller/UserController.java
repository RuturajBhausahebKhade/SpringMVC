package com.ruturaj.springmvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ruturaj.springmvc.dto.UserDTO;
import com.ruturaj.springmvc.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(path = "/home")
	protected String getHomePage(HttpSession httpSession) {
		UserDTO authenticatedUser = (UserDTO) httpSession.getAttribute("authenticatedUser");
		if(authenticatedUser != null)
			return "home";
		else {
			System.out.println("User not authenticated");
			return "login";
		}
			
	}
	
	@RequestMapping(path = "/sign-up-page")
	protected String getSignUpPage() {
		return "sign_up";
	}
	
	@RequestMapping(path = "/add-user", method = RequestMethod.POST)
	protected String addUser(@RequestParam(name = "username") String name, @RequestParam(name = "email") String email, @RequestParam(name = "mobile") long mobile, @RequestParam(name = "password") String password, ModelMap modelMap) {
		boolean userAdded = userService.addUser(name, email, mobile, password);
		if(userAdded) {
			modelMap.addAttribute("message", "User Added");
			return "login";
		} else {
			modelMap.addAttribute("message", "Something went wrong");
			return "sign_up";
		}
	}
	
	@RequestMapping(path = "/login-page")
	protected String getLoginPage() {
		return "login";
	}
	
	@RequestMapping(path = "/auth-user", method = RequestMethod.POST)
	protected String authUser(@RequestParam(name = "email") String email, @RequestParam(name = "password") String password, ModelMap modelMap, HttpSession httpSession) {
		UserDTO authenticatedUser = userService.authUser(email, password);
		if(authenticatedUser != null) {
			httpSession.setAttribute("authenticatedUser", authenticatedUser);
			httpSession.setMaxInactiveInterval(10 * 60);
			return "home";
		}
		else {
			modelMap.addAttribute("message", "Invalid User or Password");
			return "login";
		}
	}
	
	@RequestMapping(path = "/logout")
	protected String logout(HttpSession httpSession) {
		httpSession.invalidate();
		return "login";
	}
	
	@RequestMapping(path = "/delete-user")
	protected String deleteUser(ModelMap modelMap, HttpSession httpSession) {
		UserDTO authenticatedUser = (UserDTO) httpSession.getAttribute("authenticatedUser");
		if(authenticatedUser == null) {
			modelMap.addAttribute("message", "User not authenticated.Please log in.");
			return "login";
		}
		int userId = authenticatedUser.getId();
	    boolean userDeleted = userService.deleteUser(userId);
	    if (userDeleted) {
	        modelMap.addAttribute("message", "User Deleted Successfully");
	        httpSession.invalidate();
	        return "login"; 
	    } else {
	        modelMap.addAttribute("message", "Something Went Wrong");
	        return "sign_up";
	    }
	}
	
	@RequestMapping(path = "/edit-user", method = RequestMethod.GET)
	protected String editUserPage(HttpSession httpSession, ModelMap modelMap) {
	    UserDTO authenticatedUser = (UserDTO) httpSession.getAttribute("authenticatedUser");
	    if (authenticatedUser != null) {
	        modelMap.addAttribute("user", authenticatedUser); 
	        return "edit_user"; 
	    } else {
	        modelMap.addAttribute("message", "Please log in.");
	        return "login";
	    }
	}

	@RequestMapping(path = "/update-user", method = RequestMethod.POST)
	protected String updateUser(@RequestParam(name = "name") String name, 
	                            @RequestParam(name = "email") String email, 
	                            @RequestParam(name = "mobile") long mobile, 
	                            @RequestParam(name = "password") String password, 
	                            HttpSession httpSession, 
	                            ModelMap modelMap) {

	    UserDTO authenticatedUser = (UserDTO) httpSession.getAttribute("authenticatedUser");
	    if (authenticatedUser == null) {
	        modelMap.addAttribute("message", "User not authenticated. Please log in.");
	        return "login";
	    }

	    boolean updateStatus = userService.updateUser(authenticatedUser.getId(), name, email, mobile, password);
	    
	    if (updateStatus) {
	        authenticatedUser.setName(name);
	        authenticatedUser.setEmail(email);
	        authenticatedUser.setMobile(mobile);
	        authenticatedUser.setPassword(password);
	        
	        modelMap.addAttribute("message", "User updated successfully!");
	        return "home";  
	    } else {
	        modelMap.addAttribute("message", "Failed to update user.");
	        return "edit_user"; 
	    }
	}
	

}
