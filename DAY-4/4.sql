CREATE FUNCTION maximum(a integer, b integer) RETURNS integer
RETURN CASE WHEN a > b THEN a ELSE b END;

CREATE FUNCTION maximum(a integer, b integer, c integer) RETURNS integer
RETURN CASE WHEN a > b THEN maximum(a, c) ELSE maximum(b, c) END;


CREATE FUNCTION maximum(a real, b real) RETURNS real
RETURN CASE WHEN a > b THEN a ELSE b END;


CREATE FUNCTION maximum(a anycompatible, b anycompatible, c anycompatible DEFAULT NULL)
RETURNS anycompatible
AS $$
 select CASE 
 	WHEN c IS NULL THEN
 		x
 	else CASE WHEN x > c THEN x ELSE c END
	END
from (
	SELECT CASE WHEN a > b THEN a ELSE b END
) max2(x);
 $$ LANGUAGE sql;

SELECT maximum(10, 20.5, 5e3);

SELECT maximum(10.5, 20.5);

--SELECT maximum(10, '20.5');

SELECT maximum('A'::text, 'B'::text);

SELECT maximum('A', 'B');
SELECT maximum(1, 'B');

SELECT maximum(10, 5.1);
