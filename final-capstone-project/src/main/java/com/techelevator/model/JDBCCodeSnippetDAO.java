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