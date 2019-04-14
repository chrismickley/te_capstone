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

@Controller
@SessionAttributes("currentId") // Create session to keep track of which snippet is being view
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

	// Searches database and returns a List of CodeSnippet to display on landing
	// (code samples) page.
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
	// Currently gets a List of CodeSnippet. Needs getCodeSnippetById to be changed
	// to provide on snippet.
	// Only needed for troubleshooting.
	@RequestMapping("/detail")
	public String goToDetailPage(HttpServletRequest request) {
		return "detail";
	}

	// Sends user to editSnippet page and pre-populates the text fields with
	// existing data from database.
	// Currently hard-coded. Needs to be changed to use the actual provided id.
	// getCodeSnippetById needs to be changed to return only one snippet.
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
	public String searchSnippetByIdAndDisplayDetail(HttpServletRequest request,
//			@RequestParam String searchId,	// This is probably not needed when searchId is passed through "request" object.
			ModelMap model,
			HttpSession session) {
		String theCurrentIdString = request.getParameter("searchId"); // How to get searchId through the model?
		
		int theCurrentIdInt = Integer.parseInt(theCurrentIdString);
		model.put("snippet", codeSnippetDao.getCodeSnippetById(theCurrentIdInt));
		model.put("currentId", theCurrentIdInt); // Will need to invalidate the session when done. "currentId" is in the session attributes.
		return "detail";
	}

	// *******************************************************
//	// Take user input of code snippet id and return the associated code snippet to the detail page.
//	@RequestMapping("/searchOneById")
//	public String searchSnippetByIdAndDisplayDetail(HttpServletRequest request) {
//		String searchId = request.getParameter("searchId");
//		request.setAttribute("snippet", codeSnippetDao.getCodeSnippetById(Integer.parseInt(searchId)));
//		return "detail";
//	}
	// *******************************************************

	// ***** Need to implement ModelMap in this method? Probably not. *****
	// Gets the searchId provided by user. Gets the code snippet by ID. Gets code
	// snippet tag by ID. Returns the snippet and tag to jsp.
	@RequestMapping("/searchByIdGoToEditPage")
	public String searchSnippetByIdAndGoToEditPage(HttpServletRequest request, ModelMap model) {
		String searchId = request.getParameter("searchId");
		
		model.put("currentId", Integer.parseInt(request.getParameter("searchId")));
		
		request.setAttribute("snippet", codeSnippetDao.getCodeSnippetById(Integer.parseInt(searchId)));
		request.setAttribute("tag", codeSnippetDao.getCodeSnippetTagByCodeSnippetId(Integer.parseInt(searchId)));
		request.setAttribute("languageList", languageDao.getAllLanguages());
		return "editSnippet";
	}

	// *******************************************************
	// * Submit the changes made to the snippet   
	// *******************************************************

//	// Accepts the fields from the edited form and updates the database.
//	@RequestMapping(path = "/submitEditedSnippet", method = RequestMethod.POST)
//	public String submitEditedSnippetForm(
//			@RequestParam String snippetId,
//			HttpServletRequest request,
//			ModelMap model) {
//		
//		String tag = request.getParameter("tag");
//		model.put("tag", tag);
//		String name = request.getParameter("codeName");
//		model.put("name", name);
//		String description = request.getParameter("codeDescription");
//		model.put("description", description);
//		String code = request.getParameter("codeSnippet");
//		model.put("code", code);
//		String language = request.getParameter("codeLanguage");
//		model.put("language", language);
//		Boolean publicView = Boolean.parseBoolean(request.getParameter("publicView"));
//		model.put("publicView", publicView);
//		String attribution = request.getParameter("attribution");
//		model.put("attribution", attribution);
//		Boolean approved = false;
//		model.put("approved", approved);
////		String id = request.getParameter("snippetId");
//		model.addAttribute("snippetId", snippetId);	// The snippet id is being preserved here and being displayed on the detail page when it loads.
//
//		// Need a new tag object to store the tag provided by the user.
//		Tag tags = new Tag();
//
//		// Setting values of the bean
//		CodeSnippet codeSnippet = new CodeSnippet();
//		codeSnippet.setName(name);
//		codeSnippet.setDescription(description);
//		codeSnippet.setCode(code);
//		codeSnippet.setLanguage(language);
//		codeSnippet.setPublicView(publicView);
//		codeSnippet.setApproved(approved);
//		codeSnippet.setAttribution(attribution);
////		codeSnippet.setId(Integer.parseInt(id));
//
//		// Store the tag provided by user.
//		tags.setTag(tag);
//
//		codeSnippetDao.updateSnippet(codeSnippet);
//
//		return "detail";
//	}

	// Accepts the fields from the edited form and updates the database.
	@RequestMapping(path = "/submitEditedSnippet", method = RequestMethod.POST)
	public String submitEditedSnippetForm(
			@ModelAttribute("snippet") CodeSnippet codeSnippet,
			ModelMap model) {

//		// Need a new tag object to store the tag provided by the user.
//		Tag tags = new Tag();
//
//		// Store the tag provided by user.
//		tags.setTag(tag);

		codeSnippetDao.updateSnippet(codeSnippet);
		model.addAttribute("snippet", codeSnippet);
		return "detail";
	}

	// *******************************************************
	// *******************************************************
}
