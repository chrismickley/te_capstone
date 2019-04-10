package com.techelevator.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.model.TagDAO;

@Controller
public class TagController {

	@Autowired
	private TagDAO tagDAO;

	@RequestMapping("/getTheTagId")
	public String getTheTagId(HttpServletRequest request) {
		System.out.println("Change to the tag id");
		// Need to create method to put actual tag ids in place of "Tag ID for provided tag"
		request.setAttribute("tagIdFromController", "resultant tag id"); // tagDAO.getIdByTag()
		return "tagIdPage";
	}

}
