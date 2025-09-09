CREATE or REPLACE FUNCTION rect_hall_record(max_line integer, max_number integer)
RETURNS SETOF record
BEGIN ATOMIC
	SELECT chr(line+64), number
    FROM generate_series(1,max_line) AS line,
         generate_series(1,max_number) AS number;
END;


CREATE FUNCTION rect_hall_2(
    max_line integer, max_number integer,
    OUT p_line text, OUT p_number integer
)
RETURNS SETOF record
BEGIN ATOMIC
	SELECT chr(line+64), number
    FROM generate_series(1,max_line) AS line,
         generate_series(1,max_number) AS number;
END;

CREATE FUNCTION rect_hall_3(max_line integer, max_number integer)
RETURNS TABLE (a_line text, a_number integer)
BEGIN ATOMIC
	SELECT chr(line+64), number
    FROM generate_series(1,max_line) AS line,
         generate_series(1,max_number) AS number;
END;

CREATE FUNCTION amphitheatre(max_line integer)
RETURNS TABLE (a_line text, a_number integer)
BEGIN ATOMIC
	SELECT chr(line+64), number
    FROM generate_series(1,max_line) AS line,
         generate_series(1,line) AS number;
END;


SELECT * FROM rect_hall(2,3);
SELECT * FROM rect_hall_2(2,3);
SELECT * FROM rect_hall_3(2,3);
SELECT * FROM rect_hall_3(2,3) WITH ORDINALITY;
SELECT * FROM amphitheatre(5);

SELECT * FROM rect_hall_record(2,3) as (a_line text, a_number integer);




