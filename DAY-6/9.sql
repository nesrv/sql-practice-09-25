DO $$
DECLARE
    a integer[]; -- размер игнорируется
BEGIN
    a[2] := 10;
    a[3] := 20;
    a[6] := 30;

	 RAISE NOTICE '%', a;
	 
END;
$$ LANGUAGE plpgsql;

CREATE TYPE currency AS (amount numeric, code text);

DO $$
DECLARE
    c currency[];  -- массив из элементов составного типа
BEGIN
	c[1].amount := 10;  c[1].code := 'RUB';
    c[2].amount := 50;  c[2].code := 'KZT';
    RAISE NOTICE '%', c;
END
$$ LANGUAGE plpgsql;


DO $$
DECLARE
    a integer[]; -- размер игнорируется
BEGIN
   a := ARRAY( SELECT n FROM generate_series(1,3) n );
	RAISE NOTICE '%', a;
	 
END;
$$ LANGUAGE plpgsql;

 SELECT unnest( ARRAY[1,2,3] );

EXPLAIN (costs off)
SELECT * FROM generate_series(1,10) g(id) WHERE id IN (1,2,3);

 











