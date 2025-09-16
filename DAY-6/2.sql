DO $$
DECLARE
    rec record;
    cnt bigint;
BEGIN
	 EXECUTE 'INSERT INTO city_msk (name, architect, founded) VALUES
                 (''Пашков дом'', ''Василий Баженов'', 1784),
                 (''Ансамбль Царицыно'', ''Василий Баженов'', 1776),
                 (''Усадьба Тутолмина'', ''Василий Баженов'', 1788),
                 (''Музей Пушкина'', ''Роман Клейн'', 1898),
                 (''ЦУМ'', ''Роман Клейн'', 1908)
             RETURNING name, architect, founded' 
	INTO rec;
	RAISE NOTICE '%', rec;
	GET DIAGNOSTICS cnt := ROW_COUNT;
	RAISE NOTICE 'Добавлено строк: %', cnt;
	END
$$;