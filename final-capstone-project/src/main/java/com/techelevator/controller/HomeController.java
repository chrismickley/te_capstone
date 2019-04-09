package com.techelevator.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.model.CodeSnippetDAO;
import com.techelevator.model.JDBCCodeSnippetDAO;

@Controller 
public class HomeController {
	
	@Autowired
	private CodeSnippetDAO codeSnippetDAO;
	
	@RequestMapping(path={"/","/home"}, method=RequestMethod.GET)
	public String goToHomePage(HttpServletRequest request) {
		return "home";
	}

	@RequestMapping(path={"/register"}, method=RequestMethod.GET)
	public String goToRegisterPage(HttpServletRequest request) {
	return "register";
	}
	
	@RequestMapping(path={"/landing"}, method=RequestMethod.GET)
	public String goToLandingPage(HttpServletRequest request) {
		// Go to landing page, landing page will provide a button to search, button to add snippet, button to (admin) edit snippets, and a language dropdown.
		request.setAttribute("snippets", codeSnippetDAO.getAllCodeSnippets());
	return "landing";
	}
}
