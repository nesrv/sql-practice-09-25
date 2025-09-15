CREATE or REPLACE FUNCTION fmt (IN phone text, OUT code text, OUT num text)
AS $$
BEGIN
	IF phone ~ '^[0-9]*$' AND length(phone) = 10 THEN
		code := substr(phone,1,3);
		num  := substr(phone,4);
	ELSE
		code := NULL;
        num  := NULL;
	END IF;
END
$$ LANGUAGE plpgsql IMMUTABLE;


SELECT fmt('8122128506');


DO $$
DECLARE
    code text := (fmt('37547852128506')).code;
BEGIN
    CASE
		WHEN code IN ('495','499') THEN
			RAISE NOTICE '% — Москва', code;
		WHEN code = '812' THEN
            RAISE NOTICE '% — Санкт-Петербург', code;
		WHEN code = '384' THEN
            RAISE NOTICE '% — Кемеровская область', code;
		ELSE
            RAISE NOTICE '% — Прочие', code;
	END CASE;
END
$$;

















