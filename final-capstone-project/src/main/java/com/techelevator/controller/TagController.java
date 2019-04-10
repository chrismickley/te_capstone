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
		System.out.println("method getTheTagId, called in controller, is started");
		System.out.println("Tag ID is: " + tagDAO.getIdByTag());

		request.setAttribute("tagIdFromController", "Pseudo return of getIdByTag"); // tagDAO.getIdByTag()
		
		System.out.println("method getTheTagId, called in controller, is ending");
		return "tagIdPage";
	}

}
