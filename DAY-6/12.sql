CREATE or REPLACE FUNCTION maximum_3(
	VARIADIC a anycompatiblearray,
	maxsofar OUT anycompatible
) 
AS $$
DECLARE
    x maxsofar%type;  
BEGIN	
	 FOREACH x IN ARRAY a LOOP
        IF x IS NOT NULL and (maxsofar IS NULL OR x > maxsofar) THEN
            maxsofar := x;
        END IF;
    END LOOP;	
END
$$ IMMUTABLE LANGUAGE plpgsql;


SELECT maximum_2(12, 65, 47);

SELECT maximum_3(12, 65, 47, null, 87, 24);

SELECT maximum(null, null);

SELECT maximum_3(12.1, 65.3, 47.6, 100);