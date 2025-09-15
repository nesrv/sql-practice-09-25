
CREATE or REPLACE FUNCTION reverse_for (line text) RETURNS text
AS $$
DECLARE
	line_length CONSTANT int := length(line);
	retval text := '';
BEGIN
	FOR i IN 1 .. line_length
	LOOP
		retval := substr(line, i, 1) || retval;
	END LOOP;
	RETURN retval;
	
END
$$ LANGUAGE plpgsql IMMUTABLE STRICT;


CREATE or REPLACE FUNCTION reverse_while  (line text) RETURNS text
AS $$
DECLARE
	line_length CONSTANT int := length(line);
	i int := 1; 
	retval text := '';
BEGIN
	WHILE i <= line_length
	LOOP
		retval := substr(line, i, 1) || retval;
		i := i + 1;
	END LOOP;
	RETURN retval;
	
END
$$ LANGUAGE plpgsql IMMUTABLE STRICT;



CREATE or REPLACE FUNCTION reverse_loop  (line text) RETURNS text
AS $$
DECLARE
	line_length CONSTANT int := length(reverse_loop.line);
	i int := 1; 
	retval text := '';
BEGIN	
	<<main_loop>>
	LOOP
		EXIT main_loop WHEN i > line_length;
		retval := substr(line, i, 1) || retval;
		i := i + 1;
	END LOOP;
	RETURN retval;
	
END
$$ LANGUAGE plpgsql IMMUTABLE STRICT;



select reverse_loop('главрыба');



select reverse_for(NULL);