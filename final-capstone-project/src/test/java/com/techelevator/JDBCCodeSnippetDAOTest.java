package com.techelevator;

import static org.junit.Assert.*;

import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import com.techelevator.model.JDBCCodeSnippetDAO;

public class JDBCCodeSnippetDAOTest extends DAOIntegrationTest {

	private JDBCCodeSnippetDAO jdbcCodeSnippetDao;
	private JdbcTemplate jdbcTemplate;

	@Before
	public void setUpBeforeClass() throws Exception {
		DAOIntegrationTest.setupDataSource();
		jdbcTemplate = new JdbcTemplate(getDataSource());
		jdbcCodeSnippetDao = new JDBCCodeSnippetDAO(getDataSource());
	}

	@Test
	public void testDataBaseConnection() {
		DAOIntegrationTest.setupDataSource();
		jdbcTemplate = new JdbcTemplate(getDataSource());

		jdbcTemplate.execute(
				"INSERT INTO example(name, description, code, language, publicView, approved) VALUES ('TEST Name','This is a test description','for(i=0; i<20; i++)', 'java', 'true', 'false')");
		SqlRowSet result = jdbcTemplate.queryForRowSet("SELECT * FROM example WHERE id=100");
		result.next();
		assertEquals(result.getString("name"), "TEST Name");
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void test() {
		fail("Not yet implemented");
	}

}
