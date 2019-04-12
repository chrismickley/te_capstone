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

	@RequestMapping("/detail")
	public String goToDetailPage(HttpServletRequest request) {
		request.setAttribute("snippets", codeSnippetDao.getCodeSnippetById(2));
		return "detail";
	}

	@RequestMapping("/editSnippet")
	public String goToEditSnippetPage(HttpServletRequest request) {
		request.setAttribute("snippets", codeSnippetDao.getCodeSnippetById(2));
		return "editSnippet";
	}

	@RequestMapping("/searchOneById")
	public String SearchSnippetByIdAndDisplayDetail(HttpServletRequest request) {
		String searchId = request.getParameter("searchId");
		request.setAttribute("snippets", codeSnippetDao.getCodeSnippetById(Integer.parseInt(searchId)));
		return "detail";
	}
	
}
