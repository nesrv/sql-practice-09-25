CREATE or REPLACE FUNCTION maximum_2(VARIADIC a integer[]) RETURNS integer
AS $$
DECLARE
    x integer;
    maxsofar integer;
BEGIN
	maxsofar := a[1];
	 FOREACH x IN ARRAY a LOOP
        IF x IS NOT NULL and x > maxsofar THEN
            maxsofar := x;
        END IF;
    END LOOP;	
    RETURN maxsofar;
END
$$ IMMUTABLE LANGUAGE plpgsql;


SELECT maximum_2(12, 65, 47);

SELECT maximum_2(12, 65, 47, null, 87, 24);

SELECT maximum(null, null);

SELECT maximum(12.1, 65.3, 47.6);