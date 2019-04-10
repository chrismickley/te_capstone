-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;

INSERT INTO code (code_name, code_snippet, code_description, code_language, public_view, approved) VALUES ('Standard For Loop', 'for(int i=0; i<10; i++)', 'This is the standard for loop', 'java', 'true', 'true'); 
INSERT INTO code (code_name, code_snippet, code_description, code_language, public_view, approved) VALUES ('While Loop', 'while(<condition true>)', 'This is the standard while loop', 'java', 'true', 'true'); 

INSERT INTO tag (code_snippet_tag) VALUES ('fibonacci');
INSERT INTO tag (code_snippet_tag) VALUES ('for');
INSERT INTO tag (code_snippet_tag) VALUES ('loop');

INSERT INTO code_tag (code_id, code_snippet_tag_id) VALUES ('1', '1');
INSERT INTO code_tag (code_id, code_snippet_tag_id) VALUES ('1', '2');
INSERT INTO code_tag (code_id, code_snippet_tag_id) VALUES ('2', '2');

INSERT INTO tag (code_snippet_tag) VALUES ('Devo');

COMMIT;