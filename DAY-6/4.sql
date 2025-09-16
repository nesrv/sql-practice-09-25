CREATE or replace FUNCTION sel_msk(architect text, founded integer DEFAULT NULL)
RETURNS SETOF text
AS $$
DECLARE
    -- параметры пронумерованы: $1, $2...
    cmd text := '
        SELECT name FROM city_msk
        WHERE architect = $1 AND ($2 IS NULL OR founded < $2)';
BEGIN
	RETURN QUERY
	EXECUTE cmd USING architect, founded;
	
END
$$ LANGUAGE plpgsql;

SELECT * FROM sel_msk('Роман Клейн', 1905);