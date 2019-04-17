package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCLanguageDAO implements LanguageDAO{
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCLanguageDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<String> getAllLanguages() {
		List<String> allLanguages = new ArrayList<>();
		String sqlGetAllLanguages = "SELECT code_language FROM language ORDER BY language_id ASC";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllLanguages);
		while (results.next()) {
			allLanguages.add(results.getString("code_language"));
		}
		return allLanguages;
	}

}
