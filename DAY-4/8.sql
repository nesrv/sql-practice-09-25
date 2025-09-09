CREATE TABLE pilots
    (
    pilot_name text,
    schedule integer[]
    );

INSERT INTO pilots
    VALUES ( 'Ivan', '{ 1, 3, 5, 6, 7 }'::integer[] ),
    ( 'Petr', '{ 1, 2, 5, 7 }'::integer[] ),
    ( 'Pavel', '{ 2, 5 }'::integer[] ),
    ( 'Boris', '{ 3, 5, 6 }'::integer[] );	


TABLE pilots;

UPDATE pilots
SET schedule = schedule || 7
WHERE pilot_name = 'Boris';

UPDATE pilots
SET schedule = array_append (schedule, 6)
WHERE pilot_name = 'Pavel';


UPDATE pilots
SET schedule = array_prepend (1, schedule)
WHERE pilot_name = 'Pavel';


UPDATE pilots
SET schedule = array_remove (schedule, 5 )
WHERE pilot_name = 'Ivan';

UPDATE pilots
SET schedule[1] = 2, schedule[2] = 3
WHERE pilot_name = 'Petr';

UPDATE pilots
SET schedule[1:2] = ARRAY[1,2]
WHERE pilot_name = 'Petr';


SELECT * FROM pilots
where array_position( schedule, 3 ) is not null;



SELECT * FROM pilots
where schedule @> '{1,7}';

SELECT * FROM pilots
where schedule @> '{1,7}'::integer[];

-- &&
SELECT * FROM pilots
where schedule && ARRAY [2,5];

SELECT * FROM pilots
where NOT (schedule && ARRAY [2,5]);


SELECT unnest( schedule ) AS days_of_week
FROM pilots
WHERE pilot_name = 'Ivan';





















