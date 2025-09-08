 CREATE or REPLACE FUNCTION hello_world()
 RETURNS text 
 AS $$ SELECT 'Hello, world!'; $$
 LANGUAGE sql;                    


 CREATE or REPLACE FUNCTION hello_world()  RETURNS text 
 LANGUAGE sql
 RETURN text 'Hello, world!';

 
 CREATE or REPLACE FUNCTION hello_world()  RETURNS text 
 BEGIN ATOMIC 	 
	 SELECT 'First Line';
	 SELECT 'Second Line';	 
 END;


 select hello_world(name => 'Стас', greet => 'уважаемый ');

 -- BEGIN, COMMIT, ROLLBACK
 -- VACUUM или CREATE INDEX

 CREATE or REPLACE FUNCTION hello_world(name text)  RETURNS text 
 LANGUAGE sql
 RETURN 'Hello, ' || $1 || '!';

DROP FUNCTION hello_world(text);


 CREATE or REPLACE FUNCTION hello_world(
 	in name text, 
	IN greet text DEFAULT 'Dear'
	 )  RETURNS text 
 LANGUAGE sql
 RETURN 'Hello, ' || $2 || ' ' || $1 ||'!';



 CREATE or REPLACE FUNCTION hello_world(
 	in name text, 
	out text)
 RETURN 'Hello, ' || name || '!';

CREATE or REPLACE FUNCTION hello_world(
 	inout name text)
 RETURN 'Hello, ' || name || '!';


 select hello_world('Стас');
























 


 