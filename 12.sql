SELECT first_name, SUM(cnt) as total_count
FROM (
    SELECT first_name, count(*) as cnt FROM it_employees GROUP BY first_name
    UNION ALL
    SELECT first_name, count(*) as cnt FROM marketing_employees GROUP BY first_name
) combined
GROUP BY first_name;


