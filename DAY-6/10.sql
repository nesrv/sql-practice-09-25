DO $$
DECLARE
     a integer[] := ARRAY[10,20,30];
	 x integer;
BEGIN 
	 FOR i IN array_lower(a,1)..array_upper(a,1) LOOP 
        RAISE NOTICE 'a[%] = %', i, a[i];
    END LOOP;

	 FOREACH x IN ARRAY a LOOP 
        RAISE NOTICE '%', x;
    END LOOP;
	
END;
$$ LANGUAGE plpgsql;


DO $$
DECLARE
     a integer[] := ARRAY[
	        ARRAY[ 10, 20, 30],
	        ARRAY[100,200,300]
	    ];
	 x integer;
	 y integer[];
BEGIN 
	 FOR i IN array_lower(a,1)..array_upper(a,1) LOOP 
	 	FOR j IN array_lower(a,2)..array_upper(a,2) LOOP
        	RAISE NOTICE 'a[%][%] = %', i,j, a[i][j];
    	END LOOP;
    END LOOP;
	 FOREACH x IN ARRAY a LOOP 
        RAISE NOTICE '%', x;
    END LOOP;	
	 FOREACH y SLICE 1 IN ARRAY a LOOP
        RAISE NOTICE 'res = %', x;
    END LOOP;
	
END;
$$ LANGUAGE plpgsql;


 











