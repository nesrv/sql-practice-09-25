
SELECT format('%I', 'foo'),
          format('%I', 'foo bar'),
          format('%I', 'foo"bar');


SELECT quote_ident('foo'), 
          quote_ident('foo bar'), 
          quote_ident('foo"bar');

SELECT format('%L', 'foo bar'), 
          format('%L', 'foo''bar'), 
          format('%L', NULL

SELECT quote_nullable('foo bar'), 
          quote_nullable('foo''bar'), 
          quote_nullable(NULL);

DO $$
DECLARE
    cmd CONSTANT text := 'CREATE TABLE %I(
        name text, architect text, founded integer
    )';
BEGIN
    EXECUTE format(cmd, 'city_spb'); -- таблица для Санкт-Петербурга
    EXECUTE format(cmd, 'city_nov'); -- таблица для Новгорода
END
$$;

table city_spb;