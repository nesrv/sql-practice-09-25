CREATE TABLE pilot_hobbies
    (
    pilot_name text,
    hobbies jsonb
    );

CREATE TABLE

INSERT INTO pilot_hobbies
VALUES ( 'Ivan',
    '{ "sports": [ "футбол", "плавание" ],
        "home_lib": true, "trips": 3
    }'::jsonb
    ),
    ( 'Petr',
        '{ "sports": [ "теннис", "плавание" ],
    "home_lib": true, "trips": 2
    }'::jsonb
    ),
    ( 'Pavel',
        '{ "sports": [ "плавание" ],
    "home_lib": false, "trips": 4
    }'::jsonb
    ),
    ( 'Boris',
        '{ "sports": [ "футбол", "плавание", "теннис" ],
    "home_lib": true, "trips": 0
    }'::jsonb
    );