package com.techelevator.model;

import java.util.List;

public interface CodeSnippetDAO {
	
	public List<CodeSnippet> getAllCodeSnippets();
	public void addCodeSnippet(CodeSnippet codeSnippet, Tag tag);
	public int getSnippetIdBySnippetName(String name);
	public List<CodeSnippet> getAllCodeSnippetsByTag(String tag);
	public List<CodeSnippet> getAllCodeSnippetsByName(String name);
	public List<CodeSnippet> getAllCodeSnippetsByLanguage(String language);
	public CodeSnippet getCodeSnippetById(int id);
	public List<CodeSnippet> fuzzySearchAllParameters(String searchTerm);
	public List<CodeSnippet> getCodeSnippetListById(int id);
	public int updateSnippet(CodeSnippet codeSnippet);
	public String getCodeSnippetTagByCodeSnippetId(int id);
}
