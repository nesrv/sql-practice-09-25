CREATE or REPLACE FUNCTION seat_no(seat seats) RETURNS text
IMMUTABLE
RETURN seat.line || seat.number;

CREATE or REPLACE FUNCTION seat(line text, number integer) RETURNS seats
IMMUTABLE
RETURN ROW(line,number);


CREATE or REPLACE FUNCTION seat(line INOUT  text, number INOUT integer)
IMMUTABLE
RETURN (line,number);



SELECT (seat('A', 42)).*;

SELECT * from seat('A', 42);

--SELECT * FROM abs(-1.5);

SELECT seat_no(ROW('A',42));

SELECT 
	s.line, 
	s.number,
	number(s),
	seat_no(s),
	s.seat_no
FROM seats s;

CREATE VIEW seats_v AS
    SELECT s.line, s.number, seat_no(s) FROM seats s;


SELECT line, number, seat_no FROM seats_v;