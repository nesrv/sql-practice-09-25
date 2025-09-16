 DO $$
 DECLARE
 	cmd CONSTANT text := 'CREATE TABLE city_msk(name text, architect text, founded integer)';
BEGIN
    EXECUTE cmd; -- таблица для исторических зданий Москвы
END
$$;