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
		String sqlGetCodeSnippet = "SELECT * FROM example";
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
		theCodeSnippet.setName(results.getString("example_name"));
		theCodeSnippet.setDescription(results.getString("example_description"));
		theCodeSnippet.setCode(results.getString("example_snippet"));
		theCodeSnippet.setLanguage(results.getString("example_language"));
		theCodeSnippet.setPublicView(results.getBoolean("public_view"));
		theCodeSnippet.setApproved(results.getBoolean("approved"));
		theCodeSnippet.setId(results.getInt("example_id"));
		return theCodeSnippet;
	}

}