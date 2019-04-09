package com.techelevator.model;

import java.util.List;

public interface CodeSnippetDAO {
	
	public List<CodeSnippet> getAllCodeSnippets();
	// getSnippetById();
	public void addCodeSnippet(CodeSnippet codeSnippet);
}
