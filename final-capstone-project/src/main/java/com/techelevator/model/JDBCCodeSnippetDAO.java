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
	
	
	
	
	
	
	
	
	

	@Override
	public void addCodeSnippet(CodeSnippet codeSnippet, Tag tag) {
		String sqlInsertCode = "INSERT INTO code(code_name, code_snippet, code_description, code_language, public_view, approved) VALUES (?,?,?,?,?,?)";
		String sqlInsertTag = "INSERT INTO tag(code_snippet_tag) VALUES (?)";
		jdbcTemplate.update(sqlInsertCode, codeSnippet.getName(), codeSnippet.getCode(), codeSnippet.getDescription(), codeSnippet.getLanguage(), codeSnippet.isPublicView(), codeSnippet.isApproved());
		jdbcTemplate.update(sqlInsertTag, tag.getTag());
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



}