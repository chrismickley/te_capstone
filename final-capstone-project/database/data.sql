-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;

INSERT INTO code (code_id, code_name, code_snippet, code_description, code_language, public_view, approved, attribution) VALUES ('1', 'Standard For Loop', 'for(int i=0; i<10; i++)', 'This is the standard for loop', 'Java', 'true', 'true','Billy Hill, esq.' ); 
INSERT INTO code (code_id, code_name, code_snippet, code_description, code_language, public_view, approved, attribution) VALUES ('2', 'While Loop', 'while(<condition true>)', 'This is the standard while loop', 'Java', 'true', 'true', 'https://stackoverflow.com/'); 

SELECT setval(pg_get_serial_sequence('code', 'code_id'), 3);

INSERT INTO tag (code_snippet_tag_id, code_snippet_tag) VALUES ('1', 'STANDARD');
INSERT INTO tag (code_snippet_tag_id, code_snippet_tag) VALUES ('2', 'WHILE');

SELECT setval(pg_get_serial_sequence('tag', 'code_snippet_tag_id'), 6);

INSERT INTO code_tag (code_id, code_snippet_tag_id) VALUES ('1', '1');
INSERT INTO code_tag (code_id, code_snippet_tag_id) VALUES ('2', '2');


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