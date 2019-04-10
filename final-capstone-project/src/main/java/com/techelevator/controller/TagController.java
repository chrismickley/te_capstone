package com.techelevator.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.techelevator.model.CodeSnippetDAO;
import com.techelevator.model.TagDAO;

@Controller
public class TagController {

	@Autowired
	private TagDAO tagDAO;
	
	@RequestMapping("/getTheTagId")
	public String getTheTagId(HttpServletRequest request) {
		request.setAttribute("tagIdFromController", tagDAO.getIdByTag("Devo"));
		tagDAO.addTag("Orange");
		return "tagIdPage";
	}
}
