DO $$
BEGIN
    RAISE NOTICE '%', CASE 2+2 WHEN 4 THEN 'Все в порядке' END;
END
$$;


DO $$
BEGIN
    RAISE NOTICE '%', (
	SELECT code
	FROM (VALUES (1, 'Раз'), (2, 'Два')) t(id, code)
	WHERE id = 2
	);
END
$$;


DO $$
DECLARE
  s integer;
BEGIN
	s := count(*) from pg_proc where proname LIKE 'reverse_%';
    RAISE NOTICE '%', s;
END
$$;





	