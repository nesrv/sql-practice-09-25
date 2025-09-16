CREATE TABLE t(id integer);
INSERT INTO t(id) VALUES (1);

INSERT INTO t(id) VALUES (2);


DO $$
DECLARE
    n integer;
BEGIN
		SELECT id INTO STRICT n FROM t;
		RAISE NOTICE 'Оператор SELECT INTO выполнился, n = %', n;
END
$$;