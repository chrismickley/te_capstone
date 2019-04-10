package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCTagDAO implements TagDAO{
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCTagDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	// Adds a tag to the database.
	@Override
	public void addTag(Tag tag) {
	}
	
	// Returns "true" if tag already exists in database.
	@Override
	public boolean tagExists(String tag) {
		List<String> allTags = getAllTags();
		if (allTags.contains(tag)) {
			return true;
		}
		return false;
	}
	
	// Returns a list of tags which exist in database.
	@Override
	public List<String> getAllTags() {
		List<String> allTags =  new ArrayList<>();
		String sqlGetAllTags = "SELECT code_snippet_tag FROM tag";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllTags);		
		while (results.next()) {
			allTags.add(results.getString("code_snippet_tag"));
		}
		return allTags;
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
	
	@Override
	public Tag getTagById() {
		return null;
	}

}
