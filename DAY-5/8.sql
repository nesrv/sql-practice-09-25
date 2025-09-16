CREATE FUNCTION do_something() RETURNS void
AS $$
BEGIN
    RAISE NOTICE 'Что-то сделалось.';
END
$$ LANGUAGE plpgsql;


DO $$
BEGIN
	PERFORM  do_something();
END
$$;

DO $$
BEGIN	 
	 INSERT INTO test VALUES (1),(2),(3);
	 UPDATE test SET n = n + 1 WHERE n > 1;
	 DELETE FROM test WHERE n = 1; 
	 --DROP TABLE test;
END
$$;