DROP TABLE IF EXISTS example;

create table example
(
        example_id serial,
        example_snippet varchar(2000),
        example_description varchar(1000),
        example_language varchar (50)
);

INSERT INTO example (example_snippet, example_description, example_language) VALUES ('for(int i=0; i<10; i++;)', 'This is the standard for loop', 'java');  
