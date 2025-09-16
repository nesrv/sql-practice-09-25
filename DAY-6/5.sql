CREATE or replace FUNCTION sel_city(
    city_code text, 
    architect text, 
    founded integer DEFAULT NULL
)
RETURNS SETOF text
AS $$
DECLARE
    -- параметры пронумерованы: $1, $2...
 
	  cmd text := '
        SELECT name FROM city_' || city_code || '
        WHERE architect = $1 AND ($2 IS NULL OR founded < $2)';
BEGIN
	RAISE NOTICE '%', cmd;
	RETURN QUERY
		EXECUTE cmd
		USING architect, founded;
	
END
$$ LANGUAGE plpgsql;

SELECT * FROM sel_city('msk', 'Василий Баженов');