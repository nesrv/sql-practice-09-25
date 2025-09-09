CREATE TABLE pilot_hobbies
    (
    pilot_name text,
    hobbies jsonb
    );

TABLE pilot_hobbies;

SELECT * FROM pilot_hobbies
WHERE hobbies @> '{"sports": ["футбол"] }'::jsonb;


SELECT * FROM pilot_hobbies
WHERE hobbies -> 'sports' @> '["футбол"]'::jsonb;


SELECT count(*) FROM pilot_hobbies
WHERE hobbies ? 'sports';

UPDATE pilot_hobbies
SET hobbies = hobbies || '{ "sports": [ "хоккей" ] }'
WHERE pilot_name = 'Boris';


UPDATE pilot_hobbies
SET hobbies = jsonb_set( hobbies, '{ sports,2 }', '"теннис-3"' )
WHERE pilot_name = 'Boris';










