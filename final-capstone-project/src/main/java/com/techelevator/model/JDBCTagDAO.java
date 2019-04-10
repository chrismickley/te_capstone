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
	public Tag getTagById(int tagId) {
				
		return null;
	}

	@Override
	public int getIdByTag() {
//		// Need a handle here in case user puts in non-existent tag
//		String sqlGetTag = "SELECT code_snippet_tag_id FROM tag WHERE code_snippet_tag = 'Devo'";
//		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetTag);
//		while (results.next()) {
//			Tag theTag = mapRowToTag(results);
//			tags.add(theTag);
//		}
//		System.out.println ("method in JDBC");
		return 5;
	}
	
	private Tag mapRowToTag(SqlRowSet results) {
		Tag theTag;
		theTag = new Tag();
		theTag.setTagId(results.getInt("code_snippet_tag_id"));
		return theTag;
	}

}
