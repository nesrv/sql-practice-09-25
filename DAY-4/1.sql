-- 0, 1, 1, 2, 3, 5, 8

WITH RECURSIVE fibonacci AS (
    SELECT
        0 AS a,
        1 AS b
    UNION ALL
    SELECT
         b,
         a + b
    FROM fibonacci WHERE b < 50
)
SELECT a FROM fibonacci;