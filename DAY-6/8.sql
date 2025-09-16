DO $$
DECLARE
    a integer[]; -- размер игнорируется
BEGIN
    a[2] := 10;
    a[3] := 20;
    a[6] := 30;
    
    a := ARRAY[10,20,30];
	 RAISE NOTICE '%', a;
	RAISE NOTICE 'a[1] = %, a[2] = %, a[3] = %', a[1], a[2], a[3]; 
	RAISE NOTICE 'Срез [2:3] = %', a[2:3];

	 a[2:3] := ARRAY[222,333];

	 RAISE NOTICE '%', a;
	 
END;
$$ LANGUAGE plpgsql;