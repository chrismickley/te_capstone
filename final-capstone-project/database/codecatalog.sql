DROP TABLE IF EXISTS example;

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

INSERT INTO example (example_name, example_snippet, example_description, example_language, public_view, approved) VALUES ('Standard For Loop', 'for(int i=0; i<10; i++;)', 'This is the standard for loop', 'java', 'true', 'true');  
