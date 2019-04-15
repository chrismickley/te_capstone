package com.techelevator.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.model.CodeSnippet;
import com.techelevator.model.CodeSnippetDAO;
import com.techelevator.model.LanguageDAO;
import com.techelevator.model.Tag;
import com.techelevator.model.TagDAO;

@Controller
@SessionAttributes("currentId") // Create session to keep track of which snippet is being view
public class CodeController {

	@Autowired
	CodeSnippetDAO codeSnippetDao;
	@Autowired
	LanguageDAO languageDao;
	@Autowired
	TagDAO tagDao;

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

	// Searches database and returns a List of CodeSnippet to display on landing.jsp
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

	// Only needed for troubleshooting. Navigates to a blank detail.jsp
	@RequestMapping("/detail")
	public String goToDetailPage(HttpServletRequest request) {
		return "detail";
	}

	// Navigates to the editSnippet.jsp
	@RequestMapping("/editSnippet")
	public String goToEditSnippetPage(HttpServletRequest request) {
		request.setAttribute("languageList", languageDao.getAllLanguages());
		return "editSnippet";
	}

	// *******************************************************
	// * Search for Ids and go to either detail or edit page
	// *******************************************************

	// Will go to detail page.
	// Take user input of code snippet id and return the associated code snippet to
	// the detail page.
	@RequestMapping("/searchOneById")
	public String searchSnippetByIdAndDisplayDetail(HttpServletRequest request, ModelMap model, HttpSession session) {
		String theCurrentIdString = request.getParameter("searchId");

		int theCurrentIdInt = Integer.parseInt(theCurrentIdString);
		model.put("snippet", codeSnippetDao.getCodeSnippetById(theCurrentIdInt));
		model.put("currentId", theCurrentIdInt);
		return "detail";
	}

	// Will go to edit page.
	// Gets the searchId provided by user and navigates back to editSnippet.jsp
	// TODO throws error if nothing input into search box.
	@RequestMapping("/searchByIdGoToEditPage")
	public String searchSnippetByIdAndGoToEditPage(HttpServletRequest request, @ModelAttribute("tag") Tag tag,
			ModelMap model) {

		String searchIdString = request.getParameter("searchId");
		int searchIdInt = 0;

		if (isNumeric(searchIdString)) {
			searchIdInt = Integer.parseInt(request.getParameter("searchId"));
		}

		model.put("currentId", searchIdInt);

		request.setAttribute("snippet", codeSnippetDao.getCodeSnippetById(searchIdInt));

		String codeSnippetTagByCodeSnippetId = codeSnippetDao.getCodeSnippetTagByCodeSnippetId(searchIdInt);
		request.setAttribute("tag", codeSnippetTagByCodeSnippetId);

		model.addAttribute("tag", tag);
		tag.setTag(codeSnippetTagByCodeSnippetId);

		request.setAttribute("languageList", languageDao.getAllLanguages());
		return "editSnippet";
	}

	public static boolean isNumeric(String strNum) {
		try {
			Integer.parseInt(strNum);
		} catch (NumberFormatException | NullPointerException nfe) {
			return false;
		}
		return true;
	}

	// *******************************************************
	// * Submit the changes made to the snippet
	// *******************************************************

	// Accepts the fields from the edited form and updates the database.
	@RequestMapping(path = "/submitEditedSnippet", method = RequestMethod.POST)
	public String submitEditedSnippetForm(@ModelAttribute("snippet") CodeSnippet codeSnippet,
			@ModelAttribute("tag") Tag tag, ModelMap model) {

		// ***** TODO Need to implement tag update and preservation. *****
		// ***** Adding tag to db but causing collision when trying to add to code_tag
		// table. *****
		model.addAttribute("tag", tag);
		model.addAttribute("snippet", codeSnippet);
		
		codeSnippetDao.updateSnippet(codeSnippet, tag);

		return "detail";
	}

	// *******************************************************
	// *******************************************************
}
