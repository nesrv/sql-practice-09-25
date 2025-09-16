DO $$
DECLARE
    n integer;
BEGIN
	SELECT id INTO STRICT n FROM t ;	
EXCEPTION
 	 WHEN SQLSTATE 'P0003' or no_data_found THEN
	 	RAISE NOTICE '% : %', SQLSTATE, SQLERRM;
END
$$;

DO $$
DECLARE
    n integer;
BEGIN
	SELECT id INTO STRICT n FROM t ;	
EXCEPTION
 	WHEN  no_data_found THEN
	 	RAISE NOTICE 'Нет данных. %: %', SQLSTATE, SQLERRM;
	WHEN too_many_rows THEN
        RAISE NOTICE 'Слишком много данных. %: %', SQLSTATE, SQLERRM;		 
	WHEN plpgsql_error THEN
        RAISE NOTICE 'Другая ошибка. %: %', SQLSTATE, SQLERRM;

END
$$;