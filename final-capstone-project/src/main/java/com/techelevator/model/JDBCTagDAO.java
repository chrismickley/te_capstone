package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCTagDAO implements TagDAO{
	
	private JdbcTemplate jdbcTemplate;

	@Override
	public void addTag(Tag tag) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getIdByTag() {
		
		// Need a handle here in case user puts in non-existent tag
		int id;
		// The below SQL statement is working as expected
		String sqlGetTagId = "SELECT code_snippet_tag_id FROM tag WHERE code_snippet_tag = 'Devo'";
		// The below query result is causing null pointer exception.
//		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetTagId);
//		while (results.next()) {
//			Tag theTagId = mapRowToTagId(results);
//			tagIds.add(theTagId);
//		}
		id = 5;
		System.out.println ("getIdByTag method in JDBC is completing");
		return id;
	}
	
	private Tag mapRowToTagId(SqlRowSet results) {
		Tag theTag;
		theTag = new Tag();
		theTag.setTagId(results.getInt("code_snippet_tag_id"));
		return theTag;
	}

	@Override
	public Tag getTagById() {
		// TODO Auto-generated method stub
		return null;
	}

}
