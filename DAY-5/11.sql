
-- неоднозначностей именования
DO $$
DECLARE
     l_id    integer := 1;
    l_code text;
BEGIN
    SELECT id, code INTO l_id, l_code
	FROM t WHERE id = l_id;
	RAISE NOTICE '%, %', l_id, l_code;
END
$$;


DO $$
<<local>>
DECLARE
    id   integer := 1;
    code text;
BEGIN
    SELECT t.id, t.code INTO local.id, local.code
    FROM t WHERE t.id = local.id;
    RAISE NOTICE '%, %', id, code;
END
$$;

SET plpgsql.variable_conflict = use_variable;


DO $$
DECLARE
    id   integer := 1;
    code text;
BEGIN
    SELECT t.id, t.code INTO id, code
    FROM t WHERE t.id = id;
    RAISE NOTICE '%, %', id, code;
END
$$;


RESET plpgsql.variable_conflict;








