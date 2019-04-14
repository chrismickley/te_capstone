-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

-- CREATE statements go here
DROP TABLE IF EXISTS app_user;
DROP TABLE IF EXISTS code;
DROP TABLE IF EXISTS tag;
DROP TABLE IF EXISTS language;

CREATE TABLE app_user
(
  id SERIAL PRIMARY KEY,
  user_name varchar(32) NOT NULL UNIQUE,
  password varchar(32) NOT NULL,
  role varchar(32),
  salt varchar(255) NOT NULL
);

CREATE TABLE language
(
language_id SERIAL PRIMARY KEY,
code_language varchar(50) NOT NULL
);

create table code
(
        code_id serial PRIMARY KEY,
        code_name varchar(200),
        code_snippet varchar(5000),
        code_description varchar(1000),
        code_language varchar (50),
        public_view boolean,
        approved boolean,
        attribution varchar(250)
);

CREATE TABLE tag
(
        code_snippet_tag_id SERIAL PRIMARY KEY, 
        code_snippet_tag  VARCHAR(20)
);

CREATE TABLE code_tag
(
        code_tag_id SERIAL PRIMARY KEY,
        code_id INT,
        code_snippet_tag_id INT,
        
        CONSTRAINT fk_code_id FOREIGN KEY (code_id) REFERENCES code(code_id),
        CONSTRAINT fk_tag_id FOREIGN KEY (code_snippet_tag_id) REFERENCES tag(code_snippet_tag_id)
);

COMMIT;