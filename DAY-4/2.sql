-- 11. Найти кратчайший путь между двумя городами через промежуточные остановки


WITH RECURSIVE paths AS (

    SELECT
         r.to_city_id,
         r.distance_km,
         c.name::TEXT AS route
    FROM routes r
    JOIN cities c ON r.from_city_id = c.id
    WHERE c.name = 'Москва'

UNION ALL

    SELECT
        r.to_city_id,
         p.distance_km + r.distance_km, 
         (p.route || ' -> ' || c.name)::TEXT
    FROM paths p 
    JOIN routes r ON p.to_city_id = r.from_city_id
    JOIN cities c ON r.from_city_id = c.id
    WHERE p.route NOT LIKE '%' || c.name || '%'
)

SELECT * from paths p
JOIN cities c ON p.to_city_id = c.id
WHERE c.name = 'Екатеринбург';