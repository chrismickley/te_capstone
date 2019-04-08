-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

-- CREATE statements go here
DROP TABLE IF EXISTS app_user;
DROP TABLE IF EXISTS example;

CREATE TABLE app_user (
  id SERIAL PRIMARY KEY,
  user_name varchar(32) NOT NULL UNIQUE,
  password varchar(32) NOT NULL,
  role varchar(32),
  salt varchar(255) NOT NULL
);

create table example
(
        example_id serial,
        example_name varchar(200),
        example_snippet varchar(2000),
        example_description varchar(1000),
        example_language varchar (50),
        public_view boolean,
        approved boolean
);

COMMIT;