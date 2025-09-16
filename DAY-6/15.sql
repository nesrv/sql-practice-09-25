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


CREATE TABLE t(id integer);
INSERT INTO t(id) VALUES (1);

INSERT INTO t(id) VALUES (2);


DO $$
DECLARE
    n integer;
BEGIN
	n := 1/0;
SELECT id INTO STRICT n FROM t;
	RAISE NOTICE 'Оператор SELECT INTO выполнился, n = %', n;
EXCEPTION
 	 WHEN TOO_MANY_ROWS THEN
	 	RAISE NOTICE 'Слишком много данных';
		RAISE NOTICE 'Строк в таблице: %, n = %', (SELECT count(*) FROM t), n; 
	 WHEN no_data_found THEN
        RAISE NOTICE 'Нет данных';
	WHEN division_by_zero THEN
        RAISE NOTICE 'Деление на ноль';
END
$$;