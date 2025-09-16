CREATE or replace FUNCTION sel_city(
    city_code text, 
    architect text, 
    founded integer DEFAULT NULL
)
RETURNS SETOF text
AS $$
DECLARE 
	  cmd text := '
        SELECT name FROM %I
        WHERE architect = %L AND (%L IS NULL OR founded < %L::integer)';
BEGIN	
	RETURN QUERY
		EXECUTE format(
        cmd, 'city_'||city_code, architect, founded, founded
    );
	
END
$$ LANGUAGE plpgsql;


SELECT * FROM sel_city('msk', 'Василий Баженов', 1785);

SELECT * FROM sel_city('msk WHERE false
        UNION ALL
        SELECT usename FROM pg_user
        UNION ALL
        SELECT name FROM city_msk', '');

