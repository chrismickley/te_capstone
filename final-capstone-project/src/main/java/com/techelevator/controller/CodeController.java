package com.techelevator.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.model.CodeSnippet;
import com.techelevator.model.CodeSnippetDAO;

@Controller
public class CodeController {
	
@Autowired
CodeSnippetDAO codeSnippetDao;

	@RequestMapping(path="/addSnippet", method=RequestMethod.GET)
	public String displayCodeSubmissionForm(HttpServletRequest request) {
		return "addSnippet";
	}
	
	// Add/implement the "addTag" method below.
	@RequestMapping(path="/addSnippet", method=RequestMethod.POST)
	public String submitAddSnippetForm(HttpServletRequest request) {
		String name = request.getParameter("codeName");
		String description = request.getParameter("codeDescription");
		String code = request.getParameter("codeSnippet");	
		String language = request.getParameter("codeLanguage");
		Boolean publicView = Boolean.parseBoolean(request.getParameter("publicView"));
		Boolean approved = false;
		
		CodeSnippet codeSnippet = new CodeSnippet();
		codeSnippet.setName(name);
		codeSnippet.setDescription(description);
		codeSnippet.setCode(code);
		codeSnippet.setLanguage(language);
		codeSnippet.setPublicView(publicView);
		codeSnippet.setApproved(approved);
		codeSnippetDao.addCodeSnippet(codeSnippet);
		
		return "redirect:landing";
		
	}
}
