package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

@Component
public class JDBCCodeSnippetDAO implements CodeSnippetDAO {

	private JdbcTemplate jdbcTemplate;
	
	public JDBCTagDAO jdbcTagDAO;
	
	public TagDAO tagDAO;
	
	@Autowired
	public JDBCCodeSnippetDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<CodeSnippet> getAllCodeSnippets() {
		List<CodeSnippet> snippets = new ArrayList<>();
		String sqlGetCodeSnippet = "SELECT * FROM code";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetCodeSnippet);
		while (results.next()) {
			CodeSnippet theSnippet = mapRowToSnippet(results);
			snippets.add(theSnippet);
		}
		return snippets;
	}
	
	// Adds a code snippet and the associated tag to the database.
	// Snippet is not added if the snippet name already exists.
	@Override
	public void addCodeSnippet(CodeSnippet codeSnippet, Tag tag) {
//		String sqlInsertTag = "INSERT INTO tag(code_snippet_tag) VALUES (?)";
//		jdbcTemplate.update(sqlInsertTag, tag.getTag());
		
		addTag(tag.getTag());		// Add the tag--provided by the user--to the database.
		getIdByTag(tag.getTag());	// Get the ID of the tag we just added. Need to add this ID to code_tag table.
		
//		String sqlInsertCode = "INSERT INTO code(code_name, code_snippet, code_description, code_language, public_view, approved) VALUES (?,?,?,?,?,?)";
//		jdbcTemplate.update(sqlInsertCode, codeSnippet.getName(), codeSnippet.getCode(), codeSnippet.getDescription(), codeSnippet.getLanguage(), codeSnippet.isPublicView(), codeSnippet.isApproved());
		
		addSnippet(codeSnippet);
		getIdBySnippetName(codeSnippet.getName());	// Get the ID of the Snippet just added.
	}
	
	private CodeSnippet mapRowToSnippet(SqlRowSet results) {
		CodeSnippet theCodeSnippet;
		theCodeSnippet = new CodeSnippet();
		theCodeSnippet.setName(results.getString("code_name"));
		theCodeSnippet.setDescription(results.getString("code_description"));
		theCodeSnippet.setCode(results.getString("code_snippet"));
		theCodeSnippet.setLanguage(results.getString("code_language"));
		theCodeSnippet.setPublicView(results.getBoolean("public_view"));
		theCodeSnippet.setApproved(results.getBoolean("approved"));
		theCodeSnippet.setId(results.getInt("code_id"));
		return theCodeSnippet;
	}

	public List<String> getAllTags() {
		List<String> allTags = new ArrayList<>();
		String sqlGetAllTags = "SELECT code_snippet_tag FROM tag";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllTags);
		while (results.next()) {
			allTags.add(results.getString("code_snippet_tag"));
		}
		return allTags;
	}

	public List<String> getAllSnippetNames() {
		List<String> allNames = new ArrayList<>();
		String sqlGetAllNames = "SELECT code_name FROM code";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllNames);
		while (results.next()) {
			allNames.add(results.getString("code_name"));
		}
		return allNames;
	}

	public boolean tagExists(String tag) {
		List<String> allTags = getAllTags();
		if (allTags.contains(tag)) {
			return true;
		}
		return false;
	}

	public boolean snippetExists(String snippet) {
		List<String> allSnippets = getAllSnippetNames();
		if (allSnippets.contains(snippet)) {
			return true;
		}
		return false;
	}
	
	public int getIdByTag(String tag) {
		int id = 0;
		String sqlGetTagId = "SELECT code_snippet_tag_id FROM tag WHERE code_snippet_tag = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetTagId, tag);
		while (results.next()) {
			id = results.getInt("code_snippet_tag_id");
		}
		return id;
	}

	@Override
	public int getIdBySnippetName(String name) {
		int id = 0;
		String sqlIdBySnippetName = "SELECT code_id FROM code WHERE code_name = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlIdBySnippetName, name);
		while(results.next()) {
			id = results.getInt("code_id");
		}
		return id;
	}

	public int addTag(String tag) {
		int returnId = 0;
		if (!tagExists(tag)) {
			String sqlInsertTag = "INSERT INTO tag(code_snippet_tag) VALUES (?)";
			jdbcTemplate.update(sqlInsertTag, tag);
			returnId = getIdByTag(tag);
//			System.out.println("Tag has been added");
		} else {
//			System.out.println("Tag already exists");
		}
		return returnId;
	}

	public int addSnippet(CodeSnippet codeSnippet) {
		int returnId = 0;
		if (!snippetExists(codeSnippet.getName())) {
			String sqlInsertCode = "INSERT INTO code(code_name, code_snippet, code_description, code_language, public_view, approved) VALUES (?,?,?,?,?,?)";
			jdbcTemplate.update(sqlInsertCode, codeSnippet.getName(), codeSnippet.getCode(), codeSnippet.getDescription(), codeSnippet.getLanguage(), codeSnippet.isPublicView(), codeSnippet.isApproved());
			returnId = getIdBySnippetName(codeSnippet.getName());
//			System.out.println("Snippet added to database");
		} else {
			System.out.println("Snippet already exists");
		}
		return returnId;
	}

}