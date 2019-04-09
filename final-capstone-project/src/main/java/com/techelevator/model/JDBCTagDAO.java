package com.techelevator.model;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

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
	public int getIdByTag(String tag) {
		String sqlGetTag = "SELECT code_snippet_tag_id FROM tag WHERE tag = 'Devo'";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetTag);
		int resultz = results.getInt("code_snippet_tag_id");
		System.out.println (resultz);
		// TODO Auto-generated method stub
		return 0;
	}

}
