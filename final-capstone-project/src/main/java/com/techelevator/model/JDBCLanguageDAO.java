package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

public class JDBCLanguageDAO implements LanguageDAO{
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<String> getAllLanguages() {
		List<String> allLanguages = new ArrayList<>();
		String sqlGetAllLanguages = "SELECT code_language FROM language ORDER BY code_language ASC";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllLanguages);
		while (results.next()) {
			allLanguages.add(results.getString("code_language"));
		}
		return allLanguages;
	}

}
