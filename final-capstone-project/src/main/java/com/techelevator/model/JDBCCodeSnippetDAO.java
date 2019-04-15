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

//	public JDBCTagDAO jdbcTagDAO;

	public TagDAO tagDAO;

	// Database connection.
	@Autowired
	public JDBCCodeSnippetDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	// Returns list of CodeSnippet associated with a given tag.
	@Override
	public List<CodeSnippet> getAllCodeSnippetsByTag(String tag) {
		List<CodeSnippet> snippetsByTag = new ArrayList<>();
		String sqlGetAllCodeSnippetsByTag = "SELECT * " + "FROM code "
				+ "JOIN code_tag ON code.code_id = code_tag.code_id "
				+ "JOIN tag ON code_tag.code_snippet_tag_id = tag.code_snippet_tag_id "
				+ "WHERE tag.code_snippet_tag = ?";
		// @TODO Code breaks as soon as "%" are added to tag.toUpperCase(). So the exact
		// tag word (ignoring case) has to be provided.
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllCodeSnippetsByTag, tag.toUpperCase());
		while (results.next()) {
			CodeSnippet theSnippet = mapRowToSnippet(results);
			snippetsByTag.add(theSnippet);
		}
		return snippetsByTag;
	}

	// Returns a list of CodeSnippet where their name, code snippet, or tag matches
	// search word.
	public List<CodeSnippet> fuzzySearchAllParameters(String searchTerm) {
		List<CodeSnippet> snippetsBySearch = new ArrayList<>();

		return snippetsBySearch;
	}

	// Returns list of CodeSnippet associated with a given name.
	@Override
	public List<CodeSnippet> getAllCodeSnippetsByName(String name) {
		List<CodeSnippet> snippetsByName = new ArrayList<>();
		String sqlGetAllCodeSnippetsByName = "SELECT * FROM code WHERE UPPER(code_name) LIKE ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllCodeSnippetsByName, "%" + name.toUpperCase() + "%");
		while (results.next()) {
			CodeSnippet theSnippet = mapRowToSnippet(results);
			snippetsByName.add(theSnippet);
		}
		return snippetsByName;
	}

	// Returns list of CodeSnippet associated with a given language.
	@Override
	public List<CodeSnippet> getAllCodeSnippetsByLanguage(String language) {
		List<CodeSnippet> snippetsByLanguage = new ArrayList<>();
		String sqlGetAllCodeSnippetsByLanguage = "SELECT * FROM code WHERE code_language = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllCodeSnippetsByLanguage, language);
		while (results.next()) {
			CodeSnippet theSnippet = mapRowToSnippet(results);
			snippetsByLanguage.add(theSnippet);
		}
		return snippetsByLanguage;
	}

	@Override
	public String getCodeSnippetTagByCodeSnippetId(int id) {
		String codeSnippetTag = null;
		String sqlGetCodeSnippet = "SELECT code_snippet_tag FROM tag JOIN code_tag ON tag.code_snippet_tag_id = code_tag.code_snippet_tag_id JOIN code ON code_tag.code_id = code.code_id WHERE code.code_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetCodeSnippet, id);
		while (results.next()) {
			codeSnippetTag = results.getString("code_snippet_tag");
		}
		return codeSnippetTag;
	}

	// Returns list of CodeSnippet associated with a given language.
	// Needs to be changed so returns only one Snippet.
	@Override
	public CodeSnippet getCodeSnippetById(int id) {
		CodeSnippet snippetById = new CodeSnippet();
		String sqlGetCodeSnippetById = "SELECT * FROM code WHERE code_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetCodeSnippetById, id);
		while (results.next()) {
			snippetById = mapRowToSnippet(results);
		}
		return snippetById;
	}

	// Returns list of CodeSnippet associated with a given language.
	@Override
	public List<CodeSnippet> getCodeSnippetListById(int id) {
		List<CodeSnippet> snippetById = new ArrayList<>();
		String sqlGetCodeSnippetById = "SELECT * FROM code WHERE code_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetCodeSnippetById, id);
		while (results.next()) {
			CodeSnippet theSnippet = mapRowToSnippet(results);
			snippetById.add(theSnippet);
		}
		return snippetById;
	}

	// Returns a list of objects of all the code snippets.
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
	// Adds the code and tag ids to the code-tag connector table.
	@Override
	public int addCodeSnippet(CodeSnippet codeSnippet, Tag tag) {

		addTag(tag.getTag().toUpperCase()); // Add the tag--provided by the user--to the database.
		getTagIdByTag(tag.getTag().toUpperCase()); // Get the ID of the tag we just added. Need to add this ID to
													// code_tag table.

		addSnippetIfDoesntExist(codeSnippet); // Add the code snippet to the database.
		getSnippetIdBySnippetName(codeSnippet.getName()); // Get the ID of the code snippet just added.

		addIdsToSnippetTagConnector(getSnippetIdBySnippetName(codeSnippet.getName()),
				getTagIdByTag(tag.getTag().toUpperCase()));
		return getSnippetIdBySnippetName(codeSnippet.getName());
	}

	// Adds a tag--if it does not exist--to the database. And return the id of the saved tag.
	@Override
	public int addTag(String tag) {
		int returnId = 0;
		if (!tagExists(tag)) {
			String sqlInsertTag = "INSERT INTO tag(code_snippet_tag) VALUES (?)";
			jdbcTemplate.update(sqlInsertTag, tag);
			returnId = getIdByTag(tag);
//			System.out.println("Tag has been added");
		} else {
			returnId = getIdByTag(tag);
//			System.out.println("Tag already exists");
		}
		return returnId;
	}

	// Returns the id of a tag (assuming tag exists in database).
	@Override
	public int getIdByTag(String tag) {
		int id = 0;
		String sqlGetTagId = "SELECT code_snippet_tag_id FROM tag WHERE code_snippet_tag = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetTagId, tag);
		while (results.next()) {
			id = results.getInt("code_snippet_tag_id");
		}
		return id;
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
		theCodeSnippet.setAttribution(results.getString("attribution"));
		return theCodeSnippet;
	}

	// Return a list of all the tags in the database.
	public List<String> getAllTags() {
		List<String> allTags = new ArrayList<>();
		String sqlGetAllTags = "SELECT code_snippet_tag FROM tag";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllTags);
		while (results.next()) {
			allTags.add(results.getString("code_snippet_tag"));
		}
		return allTags;
	}

	// Return a list of all the snippet names in the database.
	public List<String> getAllSnippetNames() {
		List<String> allNames = new ArrayList<>();
		String sqlGetAllNames = "SELECT code_name FROM code";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllNames);
		while (results.next()) {
			allNames.add(results.getString("code_name"));
		}
		return allNames;
	}

	// Returns true if the tag already exists in the database.
	public boolean tagExists(String tag) {
		List<String> allTags = getAllTags();
		if (allTags.contains(tag)) {
			return true;
		}
		return false;
	}

	// Returns true if the snippet name already exists in database.
	public boolean snippetExists(String snippet) {
		List<String> allSnippets = getAllSnippetNames();
		if (allSnippets.contains(snippet)) {
			return true;
		}
		return false;
	}

	// Returns the integer id of provided tag.
	public int getTagIdByTag(String tag) {
		int id = 0;
		String sqlGetTagId = "SELECT code_snippet_tag_id FROM tag WHERE code_snippet_tag = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetTagId, tag);
		while (results.next()) {
			id = results.getInt("code_snippet_tag_id");
		}
		return id;
	}

	// Returns the integer id of provided snippet name.
	@Override
	public int getSnippetIdBySnippetName(String name) {
		int id = 0;
		String sqlIdBySnippetName = "SELECT code_id FROM code WHERE code_name = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlIdBySnippetName, name);
		while (results.next()) {
			id = results.getInt("code_id");
		}
		return id;
	}

	// Add snippet of code to database if the code snippet name does not already
	public int addSnippetIfDoesntExist(CodeSnippet codeSnippet) {
		int id = 0;
		if (!snippetExists(codeSnippet.getName())) {
			String sqlInsertCode = "INSERT INTO code(code_name, code_snippet, code_description, code_language, public_view, approved, attribution) VALUES (?,?,?,?,?,?,?)";
			jdbcTemplate.update(sqlInsertCode, codeSnippet.getName(), codeSnippet.getCode(),
					codeSnippet.getDescription(), codeSnippet.getLanguage(), codeSnippet.isPublicView(),
					codeSnippet.isApproved(), codeSnippet.getAttribution());
			id = getSnippetIdBySnippetName(codeSnippet.getName());
		} else {
		}
		return id;
	}
	
	public int updateSnippet(CodeSnippet codeSnippet, Tag tag) {
		// Get id for existing snippet
		int snippetId = codeSnippet.getId();
//		// Get id for existing tag
//		int tagId = getTagIdByTag(tag.getTag());
		
		// Remove entry from code_tag connector
		deleteCodeTagConnectorBySnippetId(snippetId);
//		// Remove tag
//		deleteTagByTagId(tagId);
		// Remove existing snippet
		deleteSnippetBySnippetId(snippetId);
		// Add modified snippet as a new one
		snippetId = addCodeSnippet(codeSnippet, tag);
		System.out.println(snippetId);
		return snippetId;
	}
	
	public void deleteCodeTagConnectorBySnippetId(int snippetId) {
		String sqlDdeleteCodeTagConnector = "DELETE FROM code_tag WHERE code_id = ?";
		jdbcTemplate.update(sqlDdeleteCodeTagConnector, snippetId);		
	}
	
	public void deleteTagByTagId(int tagId) {
		String sqlDeleteTag = "DELETE FROM tag WHERE code_snippet_tag_id = ?";
		// TODO Error occuring here.
		jdbcTemplate.update(sqlDeleteTag, tagId);		
	}
	
	public void deleteSnippetBySnippetId(int snippetId) {
		String sqlDeleteSnippet = "DELETE FROM code WHERE code_id = ?";
		jdbcTemplate.update(sqlDeleteSnippet, snippetId);		
	}
	
	public void updateCodeTagTableByCodeTagId(int codeId, int tagId, int codeTagId) {
		String sqlUpdateCodeTagTableByCodeTagId = "UPDATE code_tag SET code_id = ?, code_snippet_tag_id = ? WHERE code_tag_id = ?";
		jdbcTemplate.update(sqlUpdateCodeTagTableByCodeTagId, codeId, tagId, codeTagId);
	}

	// Adds the snippet id and the tag id to the connector database.
	public void addIdsToSnippetTagConnector(int snippetId, int tagId) {
		String sqlInsertSnippetTagId = "INSERT INTO code_tag (code_id, code_snippet_tag_id) VALUES (?, ?)";
		jdbcTemplate.update(sqlInsertSnippetTagId, snippetId, tagId);
	}
	
	public int getTagPrimaryKeyIdBySnippetIdAndTagId(int snippetId, int tagId) {
		String sqlGetTagPrimaryKeyIdByTag = "SELECT code_tag_id FROM code_tag WHERE code_id = ? AND code_snippet_tag_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetTagPrimaryKeyIdByTag, snippetId, tagId);
		
		int id = 0;
		while (results.next()) {
			id = results.getInt("code_tag_id");
		}
		return id;
	}

}