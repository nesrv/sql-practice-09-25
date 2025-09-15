rollback;

CREATE TABLE t(id integer, code text);
INSERT INTO t VALUES (1, 'Раз'), (2, 'Два');


DO $$
DECLARE
    r record;
BEGIN
    SELECT id, code INTO r FROM t;
	RAISE NOTICE '%', r;
END
$$;

DO $$
DECLARE
    r record;
BEGIN
	UPDATE t SET code = code  || '!' WHERE id = 1  RETURNING * INTO r;
	RAISE NOTICE '%', r;
END
$$;

SET plpgsql.extra_warnings = 'all';
