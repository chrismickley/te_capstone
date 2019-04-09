package com.techelevator.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
public class HomeController {
	
	@RequestMapping({"/","/home"})
	public String goToHomePage(HttpServletRequest request) {
		return "home";
	}

	@RequestMapping("/register")
	public String goToRegisterPage(HttpServletRequest request) {
	return "register";
	}
	
	@RequestMapping("/landing")
	public String goToLandingPage(HttpServletRequest request) {
		// Go to landing page, landing page will provide a button to search, button to add snippet, button to (admin) edit snippets, and a language dropdown.
	return "landing";
	}
}
