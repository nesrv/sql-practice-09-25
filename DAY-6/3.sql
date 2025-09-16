DO $$
DECLARE
    rec record;   
BEGIN
	FOR rec IN EXECUTE 'SELECT * FROM city_msk WHERE architect = ''Роман Клейн'' '
	LOOP
		RAISE NOTICE '%', rec;
	END LOOP;
END
$$;

DO $$
DECLARE
    rec record; 
	cur refcursor;
BEGIN
	OPEN cur FOR EXECUTE 'SELECT * FROM city_msk WHERE architect = ''Роман Клейн'' ';
	LOOP
		FETCH cur INTO rec;
		EXIT WHEN NOT FOUND;
		RAISE NOTICE '%', rec;
	END LOOP;
END
$$;