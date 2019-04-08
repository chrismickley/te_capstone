-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;

INSERT INTO example (example_name, example_snippet, example_description, example_language, public_view, approved) VALUES ('Standard For Loop', 'for(int i=0; i<10; i++)', 'This is the standard for loop', 'java', 'true', 'true'); 

COMMIT;