package com.techelevator.model;

import java.util.List;

public interface CodeSnippetDAO {
	
	public List<CodeSnippet> getAllCodeSnippets();
	public void addCodeSnippet(CodeSnippet codeSnippet, Tag tag);
	public int getSnippetIdBySnippetName(String name);
	public List<CodeSnippet> getAllCodeSnippetsByTag(String tag);
	
}
