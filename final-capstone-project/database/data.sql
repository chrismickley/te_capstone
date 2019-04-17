-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;

INSERT INTO code (code_id, code_name, code_snippet, code_description, code_language, public_view, approved, attribution) VALUES ('1', 'For Loop', 'for(initializer; condition; incrementer) {code to execute}', 'This is the standard for loop', 'Java', 'true', 'true','Billy Hill, esq.' ); 
INSERT INTO code (code_id, code_name, code_snippet, code_description, code_language, public_view, approved, attribution) VALUES ('2', 'While Loop', 'while(conditionTrue) {code to execute}', 'This is the standard while loop', 'Java', 'true', 'true', 'A. Nonimous'); 
INSERT INTO code (code_id, code_name, code_snippet, code_description, code_language, public_view, approved, attribution) VALUES ('3', 'Controller Class', '@Controller @SessionAttributes("currentId") public class CodeController {}', 'Standard class signature for Spring MVC controller', 'Java', 'true', 'true', 'anonymous'); 
INSERT INTO code (code_id, code_name, code_snippet, code_description, code_language, public_view, approved, attribution) VALUES ('4', 'For Each', 'for (item : array) {code to execute}', 'This is the standard for each loop', 'Java', 'true', 'true', 'https://docs.oracle.com/javase/1.5.0/docs/guide/language/foreach.html'); 
INSERT INTO code (code_id, code_name, code_snippet, code_description, code_language, public_view, approved, attribution) VALUES ('5', 'JDBC DAO', '@Component public class JDBCClassNameDAO implements DAOToImplement { private JdbcTemplate jdbcTemplate; public ClassDAO classDAO;}', 'Standard JDBC DAO class', 'Java', 'true', 'true', 'M. Bourne'); 
INSERT INTO code (code_id, code_name, code_snippet, code_description, code_language, public_view, approved, attribution) VALUES ('6', 'Request Mapping', '<c:url var="URLVariable" value="/controllerRequestMappingAddress" /> <form method="GET" action="${URLVariable}">textBoxTitle<input type="text" name="boxContentsVariableName" placeholder="placeholder" /> <input type="submit" value="textOnSubmitButton" /> </form>', '@RequestMapping example', 'JSP', 'true', 'true', 'J. Bournoulli'); 
INSERT INTO code (code_id, code_name, code_snippet, code_description, code_language, public_view, approved, attribution) VALUES ('7', 'JdbcTemplate', '@Override public ReturnType methodName(int variable) { ClassName variableName = new ClassName(); String sqlGetDatabaseInfo = "SELECT * FROM table WHERE column_name = ?"; SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetDatabaseInfo, id); while (results.next()) { variableName.setName(results.getString("column_name")); } return variableName; }', 'Java SQL return method', 'SQL', 'true', 'true', 'B Katcha'); 
INSERT INTO code (code_id, code_name, code_snippet, code_description, code_language, public_view, approved, attribution) VALUES ('8', 'jsp header import', '<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><c:import url="pathTo/header.jsp" />', 'Import a header.jsp into a body .jsp', 'JSP', 'true', 'true', 'D Hamilton'); 
INSERT INTO code (code_id, code_name, code_snippet, code_description, code_language, public_view, approved, attribution) VALUES ('9', 'DAO class', 'public interface TagDAO { public returnType method(inputType argument);}', 'Example of a DAO class', 'Java', 'true', 'true', 'J Guy'); 

SELECT setval(pg_get_serial_sequence('code', 'code_id'), 25);

INSERT INTO tag (code_snippet_tag_id, code_snippet_tag) VALUES ('1', 'STANDARD');
INSERT INTO tag (code_snippet_tag_id, code_snippet_tag) VALUES ('2', 'WHILE');
INSERT INTO tag (code_snippet_tag_id, code_snippet_tag) VALUES ('3', 'CONTROLLER');
INSERT INTO tag (code_snippet_tag_id, code_snippet_tag) VALUES ('4', 'EACH');
INSERT INTO tag (code_snippet_tag_id, code_snippet_tag) VALUES ('5', 'COMPONENT');
INSERT INTO tag (code_snippet_tag_id, code_snippet_tag) VALUES ('6', 'REQUEST');
INSERT INTO tag (code_snippet_tag_id, code_snippet_tag) VALUES ('7', 'JDBCTEMPLATE');
INSERT INTO tag (code_snippet_tag_id, code_snippet_tag) VALUES ('8', 'JSTL');
INSERT INTO tag (code_snippet_tag_id, code_snippet_tag) VALUES ('9', 'INTERFACE');

SELECT setval(pg_get_serial_sequence('tag', 'code_snippet_tag_id'), 25);

INSERT INTO code_tag (code_id, code_snippet_tag_id) VALUES ('1', '1');
INSERT INTO code_tag (code_id, code_snippet_tag_id) VALUES ('2', '2');
INSERT INTO code_tag (code_id, code_snippet_tag_id) VALUES ('3', '3');
INSERT INTO code_tag (code_id, code_snippet_tag_id) VALUES ('4', '4');
INSERT INTO code_tag (code_id, code_snippet_tag_id) VALUES ('5', '5');
INSERT INTO code_tag (code_id, code_snippet_tag_id) VALUES ('6', '6');
INSERT INTO code_tag (code_id, code_snippet_tag_id) VALUES ('7', '7');
INSERT INTO code_tag (code_id, code_snippet_tag_id) VALUES ('8', '8');
INSERT INTO code_tag (code_id, code_snippet_tag_id) VALUES ('9', '9');

INSERT INTO language (code_language) VALUES ('Java');
INSERT INTO language (code_language) VALUES ('C#');
INSERT INTO language (code_language) VALUES ('JavaScript');
INSERT INTO language (code_language) VALUES ('Python');
INSERT INTO language (code_language) VALUES ('SQL');
INSERT INTO language (code_language) VALUES ('HTML');
INSERT INTO language (code_language) VALUES ('JSP');
INSERT INTO language (code_language) VALUES ('Ruby');
INSERT INTO language (code_language) VALUES ('BASIC');
INSERT INTO language (code_language) VALUES ('Fortran');
INSERT INTO language (code_language) VALUES ('Visual Basic');
INSERT INTO language (code_language) VALUES ('C');
INSERT INTO language (code_language) VALUES ('C--');
INSERT INTO language (code_language) VALUES ('C++');
INSERT INTO language (code_language) VALUES ('COBOL');
INSERT INTO language (code_language) VALUES ('Groovy');
INSERT INTO language (code_language) VALUES ('RPG');

SELECT setval(pg_get_serial_sequence('language', 'language_id'), 50);

COMMIT;