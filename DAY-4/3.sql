CREATE TABLE t(a float);

CREATE PROCEDURE fill() AS
$$
	TRUNCATE t;
	INSERT INTO t SELECT random() FROM generate_series(1,3);
$$ LANGUAGE sql;


CREATE or REPLACE PROCEDURE fill(nrows integer)
BEGIN ATOMIC
	DELETE FROM t;
	INSERT INTO t SELECT random() FROM generate_series(1,nrows);
END;

CREATE FUNCTION fill_avg() RETURNS float
BEGIN ATOMIC
	DELETE FROM t;
	INSERT INTO t SELECT random() FROM generate_series(1,3);
	SELECT avg(a) FROM t; 
END;


call fill(nrows => 15);

SELECT fill_avg();

TABLE t;