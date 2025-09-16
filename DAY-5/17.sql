DO $$
DECLARE
	cur refcursor := 'cursor12345';
		
BEGIN
	open cur FOR SELECT * FROM t order by id;	
 	RAISE NOTICE '%', cur;
END
$$;


CREATE FUNCTION t_cur(cur refcursor) RETURNS void 
AS $$
BEGIN
    OPEN cur FOR SELECT * FROM t;
END
$$ LANGUAGE plpgsql;


SELECT t_cur('cursor12345');

FETCH cursor12345;















