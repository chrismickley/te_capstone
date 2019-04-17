-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;

INSERT INTO code (code_id, code_name, code_snippet, code_description, code_language, public_view, approved, attribution) VALUES ('1', 'For Loop', 'for(<initializer>; <condition>; <incrementer>) {<cod to execute>}', 'This is the standard for loop', 'Java', 'true', 'true','Billy Hill, esq.' ); 
INSERT INTO code (code_id, code_name, code_snippet, code_description, code_language, public_view, approved, attribution) VALUES ('2', 'While Loop', 'while(<condition true>) {<code to execute>}', 'This is the standard while loop', 'Java', 'true', 'true', 'A. Nonimous'); 
INSERT INTO code (code_id, code_name, code_snippet, code_description, code_language, public_view, approved, attribution) VALUES ('3', 'Controller Class', '@Controller @SessionAttributes("currentId") public class CodeController {}', 'Standard class signature for Spring MVC controller', 'Java', 'true', 'true', 'anonymous'); 
INSERT INTO code (code_id, code_name, code_snippet, code_description, code_language, public_view, approved, attribution) VALUES ('4', 'For Each', 'for (<item> : <items>) {<code to execute>}', 'This is the standard for each loop', 'Java', 'true', 'true', 'H. Ovalexandria'); 

SELECT setval(pg_get_serial_sequence('code', 'code_id'), 25);

INSERT INTO tag (code_snippet_tag_id, code_snippet_tag) VALUES ('1', 'STANDARD');
INSERT INTO tag (code_snippet_tag_id, code_snippet_tag) VALUES ('2', 'WHILE');
INSERT INTO tag (code_snippet_tag_id, code_snippet_tag) VALUES ('3', 'CONTROLLER');
INSERT INTO tag (code_snippet_tag_id, code_snippet_tag) VALUES ('4', 'EACH');

SELECT setval(pg_get_serial_sequence('tag', 'code_snippet_tag_id'), 25);

INSERT INTO code_tag (code_id, code_snippet_tag_id) VALUES ('1', '1');
INSERT INTO code_tag (code_id, code_snippet_tag_id) VALUES ('2', '2');
INSERT INTO code_tag (code_id, code_snippet_tag_id) VALUES ('3', '3');
INSERT INTO code_tag (code_id, code_snippet_tag_id) VALUES ('4', '4');

INSERT INTO language (code_language) VALUES ('Java');
INSERT INTO language (code_language) VALUES ('C#');
INSERT INTO language (code_language) VALUES ('JavaScript');
INSERT INTO language (code_language) VALUES ('Python');
INSERT INTO language (code_language) VALUES ('SQL');
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

SELECT setval(pg_get_serial_sequence('language', 'language_id'), 17);

COMMIT;