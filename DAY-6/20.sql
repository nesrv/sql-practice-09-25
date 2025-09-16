CREATE OR REPLACE FUNCTION describe() RETURNS trigger
AS $$
DECLARE
    rec record;
    str text := '';
BEGIN
	 IF TG_LEVEL = 'ROW' THEN
	 	CASE TG_OP
			 WHEN 'DELETE' THEN rec := OLD; str := OLD::text; 
			 WHEN 'UPDATE' THEN rec := NEW; str := OLD || ' -> ' || NEW;
			 WHEN 'INSERT' THEN rec := NEW; str := NEW::text;
		END CASE;
    END IF;	 
	RAISE NOTICE '% % % %: %',
		 TG_TABLE_NAME, TG_WHEN, TG_OP, TG_LEVEL, str;
	RETURN rec;
END
$$ LANGUAGE plpgsql;

CREATE TABLE t(
    id integer PRIMARY KEY,
    s text
);

CREATE TRIGGER t_before_stmt
BEFORE INSERT OR UPDATE OR DELETE
ON t   
FOR EACH STATEMENT
EXECUTE FUNCTION describe(); 

