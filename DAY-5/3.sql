CREATE FUNCTION sqr_in(IN a numeric) RETURNS numeric
AS $$
	BEGIN
		RETURN a * a;
	END
$$ LANGUAGE plpgsql;


CREATE or REPLACE FUNCTION sqr_out(IN a numeric, OUT retval numeric) 
AS $$
	BEGIN
		retval := a * a;
	END
$$ LANGUAGE plpgsql;


CREATE or REPLACE FUNCTION sqr_inout(INOUT a numeric) 
AS $$
	BEGIN
		a := a * a;
	END
$$ LANGUAGE plpgsql;


SELECT sqr_in(5), sqr_out(6), sqr_inout(7);