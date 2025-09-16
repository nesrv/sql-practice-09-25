DO $$
DECLARE
    a integer[2]; -- размер игнорируется
BEGIN
    a := ARRAY[10,20,30];
	 RAISE NOTICE '%', a;
	RAISE NOTICE 'a[1] = %, a[2] = %, a[3] = %', a[1], a[2], a[3]; 
	RAISE NOTICE 'Срез [2:3] = %', a[2:3];

	 a[2:3] := ARRAY[222,333];

	 RAISE NOTICE '%', a;
	 
END;
$$ LANGUAGE plpgsql;