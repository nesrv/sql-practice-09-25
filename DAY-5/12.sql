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
    UPDATE t SET code = code || '!' RETURNING * INTO r;
    RAISE NOTICE '%', r;
END
$$;

DO $$
DECLARE
    r record;
BEGIN
	r := (-1,'!!!');
    SELECT id, code INTO r FROM t WHERE false;
    RAISE NOTICE '%', r;
END
$$;


DO $$
DECLARE
    r record;
BEGIN
	UPDATE t SET code = code || '!' WHERE id = -1 RETURNING * INTO r;
    RAISE NOTICE '%', r;
END
$$;

DO $$
DECLARE
    r record;
BEGIN
    SELECT id, code INTO STRICT r FROM t WHERE id = 1;
    RAISE NOTICE '%', r;
END
$$;

DO $$
DECLARE
    r record;
BEGIN
    UPDATE t SET code = code || '!' WHERE id = 1 RETURNING * INTO STRICT r;
    RAISE NOTICE '%', r;
END
$$;













