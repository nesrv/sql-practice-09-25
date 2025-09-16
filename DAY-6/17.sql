DO $$
BEGIN
	SELECT 1/0;
    BEGIN
        SELECT 1/0;
        RAISE NOTICE 'Вложенный блок выполнен';
	EXCEPTION
        WHEN division_by_zero THEN
            RAISE NOTICE 'Ошибка во вложенном блоке';
    END;
	RAISE NOTICE 'Внешний блок выполнен';
EXCEPTION
    WHEN division_by_zero THEN
        RAISE NOTICE 'Ошибка во внешнем блоке';
END
$$;