DO $$
DECLARE
	  cur refcursor;
BEGIN
	OPEN cur FOR SELECT * FROM t;
END
$$;


DO $$
DECLARE
	  cur CURSOR FOR SELECT * FROM t;
BEGIN
	OPEN cur;
END
$$;

DO $$
DECLARE
	  cur CURSOR(id integer) FOR SELECT * FROM t WHERE t.id = cur.id;
BEGIN
	OPEN cur(1);
END
$$;


DO $$
<<local>>
DECLARE
	id integer := 3;
	cur CURSOR FOR SELECT * FROM t WHERE t.id = local.id;
BEGIN
	id :=1; 
	OPEN cur;
	
END
$$;