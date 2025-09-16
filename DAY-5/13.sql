DO $$
DECLARE
    r record;
	rowcount integer;
BEGIN
    SELECT id, code INTO r FROM t;
	GET DIAGNOSTICS rowcount := ROW_COUNT;	
    RAISE NOTICE 'rowcount = %', rowcount;
	RAISE NOTICE 'found = %', FOUND;
END
$$;














