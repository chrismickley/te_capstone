package com.techelevator.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.model.CodeSnippet;
import com.techelevator.model.CodeSnippetDAO;
import com.techelevator.model.Tag;

@Controller
public class CodeController {

	@Autowired
	CodeSnippetDAO codeSnippetDao;

	@RequestMapping(path = "/addSnippet", method = RequestMethod.GET)
	public String displayCodeSubmissionForm(HttpServletRequest request) {
		return "addSnippet";
	}

	// Add/implement the "addTag" method below.
	@RequestMapping(path = "/addSnippet", method = RequestMethod.POST)
	public String submitAddSnippetForm(HttpServletRequest request) {

		String tag = request.getParameter("tag");
		String name = request.getParameter("codeName");
		String description = request.getParameter("codeDescription");
		String code = request.getParameter("codeSnippet");
		String language = request.getParameter("codeLanguage");
		Boolean publicView = Boolean.parseBoolean(request.getParameter("publicView"));
		Boolean approved = false;
		Tag tags = new Tag();

		CodeSnippet codeSnippet = new CodeSnippet();
		codeSnippet.setName(name);
		codeSnippet.setDescription(description);
		codeSnippet.setCode(code);
		codeSnippet.setLanguage(language);
		codeSnippet.setPublicView(publicView);
		codeSnippet.setApproved(approved);
		tags.setTag(tag);
		codeSnippetDao.addCodeSnippet(codeSnippet, tags);

		return "redirect:landing";

	}
	
	@RequestMapping("/searchForTag")
	public String searchForTagAndGoToLandingPage(HttpServletRequest request) {
		String searchTag = request.getParameter("searchTag");
		String searchName = request.getParameter("searchName");
		String searchLanguage = request.getParameter("searchLanguage");
		
		if (!searchTag.isEmpty()) {
			request.setAttribute("snippets", codeSnippetDao.getAllCodeSnippetsByTag(searchTag));
		}
		
		if (!searchName.isEmpty()) {
			request.setAttribute("snippets", codeSnippetDao.getAllCodeSnippetsByTag(searchName));
		}
		
		if (!searchLanguage.isEmpty()) {
			request.setAttribute("snippets", codeSnippetDao.getAllCodeSnippetsByTag(searchLanguage));
		}
		
		
	return "landing";
	}	
	
	
}
