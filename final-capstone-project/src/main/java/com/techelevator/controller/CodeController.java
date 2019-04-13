package com.techelevator.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.model.CodeSnippet;
import com.techelevator.model.CodeSnippetDAO;
import com.techelevator.model.LanguageDAO;
import com.techelevator.model.Tag;

@Controller
public class CodeController {

	@Autowired
	CodeSnippetDAO codeSnippetDao;
	@Autowired
	LanguageDAO languageDao;

	@RequestMapping(path = "/addSnippet", method = RequestMethod.GET)
	public String displayCodeSubmissionForm(HttpServletRequest request) {
		request.setAttribute("languageList", languageDao.getAllLanguages());
	
	return "addSnippet";
	}

	@RequestMapping(path = "/addSnippet", method = RequestMethod.POST)
	public String submitAddSnippetForm(HttpServletRequest request) {

		String tag = request.getParameter("tag");
		String name = request.getParameter("codeName");
		String description = request.getParameter("codeDescription");
		String code = request.getParameter("codeSnippet");
		String language = request.getParameter("codeLanguage");
		Boolean publicView = Boolean.parseBoolean(request.getParameter("publicView"));
		Boolean approved = false;
		String attribution = request.getParameter("attribution");
		Tag tags = new Tag();

		// Setting values of the bean
		CodeSnippet codeSnippet = new CodeSnippet();
		codeSnippet.setName(name);
		codeSnippet.setDescription(description);
		codeSnippet.setCode(code);
		codeSnippet.setLanguage(language);
		codeSnippet.setPublicView(publicView);
		codeSnippet.setApproved(approved);
		codeSnippet.setAttribution(attribution);
		tags.setTag(tag);
		codeSnippetDao.addCodeSnippet(codeSnippet, tags);

		return "redirect:landing";
	}

	// Accepts the fields from the edited form and updates the database.
	@RequestMapping(path = "/submitEditedSnippet", method = RequestMethod.POST)
	public String submitEditedSnippetForm(HttpServletRequest request) {

		String tag = request.getParameter("tag");
		String name = request.getParameter("codeName");
		String description = request.getParameter("codeDescription");
		String code = request.getParameter("codeSnippet");
		String language = request.getParameter("codeLanguage");
		Boolean publicView = Boolean.parseBoolean(request.getParameter("publicView"));
		Boolean approved = false;
		String attribution = request.getParameter("attribution");
		Tag tags = new Tag();

		// Setting values of the bean
		CodeSnippet codeSnippet = new CodeSnippet();
		codeSnippet.setName(name);
		codeSnippet.setDescription(description);
		codeSnippet.setCode(code);
		codeSnippet.setLanguage(language);
		codeSnippet.setPublicView(publicView);
		codeSnippet.setApproved(approved);
		codeSnippet.setAttribution(attribution);
		tags.setTag(tag);
		codeSnippetDao.addCodeSnippet(codeSnippet, tags);

		return "redirect:detail";
	}
	
	// Searches database and returns a List of CodeSnippet to display on landing (code samples) page.
	@RequestMapping("/searchFilter")
	public String searchForTagAndGoToLandingPage(HttpServletRequest request) {
		String searchOption = request.getParameter("searchOption");
		String searchParameter = request.getParameter("searchParameter");
		
		if (searchOption.equals("searchTag")) {
			request.setAttribute("snippets", codeSnippetDao.getAllCodeSnippetsByTag(searchParameter));
		}
		
		else if (searchOption.equals("searchName")) {
			request.setAttribute("snippets", codeSnippetDao.getAllCodeSnippetsByName(searchParameter));
		}
		
		else if (searchOption.equals("searchLanguage")) {
			request.setAttribute("snippets", codeSnippetDao.getAllCodeSnippetsByLanguage(searchParameter));
		}
		
		
	return "landing";
	}	

	// Gets a single CodeSnippet and returns it to the detail page.
	// Currently gets a List of CodeSnippet. Needs getCodeSnippetById to be changed to provide on snippet.
	// Only needed for troubleshooting.
	@RequestMapping("/detail")
	public String goToDetailPage(HttpServletRequest request) {
		request.setAttribute("snippet", codeSnippetDao.getCodeSnippetById(1));
		return "detail";
	}

	// Sends user to editSnippet page and pre-populates the text fields with existing data from database.
	// Currently hard-coded. Needs to be changed to use the actual provided id. getCodeSnippetById needs to be changed to return only one snippet.
	@RequestMapping("/editSnippet")
	public String goToEditSnippetPage(HttpServletRequest request) {
		request.setAttribute("snippet", codeSnippetDao.getCodeSnippetById(2));
		return "editSnippet";
	}

	// 
	@RequestMapping("/searchOneById")
	public String searchSnippetByIdAndDisplayDetail(HttpServletRequest request) {
		String searchId = request.getParameter("searchId");
		request.setAttribute("snippet", codeSnippetDao.getCodeSnippetById(Integer.parseInt(searchId)));
		return "detail";
	}

	// 
	@RequestMapping("/searchByIdGoToEditPage")
	public String searchSnippetByIdAndGoToEditPage(HttpServletRequest request) {
		String searchId = request.getParameter("searchId");
		request.setAttribute("snippet", codeSnippetDao.getCodeSnippetById(Integer.parseInt(searchId)));
		return "editSnippet";
	}
	
}
