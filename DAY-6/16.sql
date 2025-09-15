
DO $$
DECLARE
	cur refcursor;
	rec record; 	
BEGIN
	open cur FOR SELECT * FROM t order by id;	
	OVE cur;
	-- FETCH cur INTO rec;
	FETCH cur INTO rec;
 	RAISE NOTICE '%', rec;
	CLOSE cur; 
END
$$;



DO $$
DECLARE
	cur refcursor;
	rec record; 	
BEGIN
	open cur FOR SELECT * FROM t order by id;	
	LOOP	
		FETCH cur INTO rec;	
		EXIT WHEN NOT FOUND;
 		RAISE NOTICE '%', rec;
 	END LOOP;
	CLOSE cur; 
END
$$;


DO $$
DECLARE
	cur CURSOR FOR SELECT * FROM t order by id;
BEGIN
	 FOR rec IN cur LOOP	
		RAISE NOTICE '%', rec;
 	 END LOOP;
END
$$;



DO $$
DECLARE
	rec record; 
BEGIN
	 FOR rec IN  (SELECT * FROM t order by id) LOOP	
		RAISE NOTICE '%', rec;
 	 END LOOP;
END
$$;





















