package com.techelevator.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
public class CodeController {
	
	@RequestMapping()
	public String displayCodeByName(HttpServletRequest request) {
		// Call JDBC method to retrieve snippet from database
		// Display the snippet on the jsp
		return "landing";
		
	}
	
//	@RequestMapping()
//	public String searchCodeByKeyword(HttpServletRequest request) {
//		// Get and display the code on the "landing" page.
//		return "landing";
//	}
//	
//	@RequestMapping()
//	public String goToCodeByName(HttpServletRequest request) {
//		// Get and display the code on the "landing" page.
//		return "landing";
//	}

}
