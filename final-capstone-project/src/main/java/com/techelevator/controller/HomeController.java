package com.techelevator.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.model.CodeSnippetDAO;
import com.techelevator.model.JDBCCodeSnippetDAO;
import com.techelevator.model.JDBCTagDAO;
import com.techelevator.model.TagDAO;
import com.techelevator.model.User;

@Controller 
public class HomeController {
	
	@Autowired
	private CodeSnippetDAO codeSnippetDao;
	
	@RequestMapping({"/","/home"})
	public String goToHomePage(HttpServletRequest request) {
		return "home";
	}

	@RequestMapping("/landing")
	public String goToLandingPage(HttpServletRequest request) {
		request.setAttribute("snippets", codeSnippetDao.getAllCodeSnippets());
	return "landing";
	}
}
