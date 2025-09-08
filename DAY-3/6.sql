-- ## ROW_NUMBER() — Уникальная нумерация
-- Присваивает уникальный номер каждой строке, даже при одинаковых значениях.

SELECT
    seller,
    sale_date,
    amount,
    ROW_NUMBER() OVER (PARTITION BY seller ORDER BY sale_date) AS deal_sequence,
    ROW_NUMBER() OVER (ORDER BY sale_date) AS global_sequence
FROM sales
ORDER BY sale_date;


SELECT
    seller,
    sale_date,
    amount
    FROM (
    SELECT *,  ROW_NUMBER() OVER (PARTITION BY seller ORDER BY sale_date) as rn from sales ) 
 subq
 where rn <=2;



-- RANK() — Олимпийская система
-- При одинаковых значениях присваивает одинаковый ранг, но следующий ранг пропускается

SELECT
    seller,
    sale_date,
    amount,
    RANK() OVER (PARTITION BY seller ORDER BY amount DESC) AS sales_rank,
    CASE RANK() OVER (PARTITION BY seller ORDER BY amount DESC)
        WHEN 1 THEN '🥇 Лучшая'
        WHEN 2 THEN '🥈 Вторая'
        WHEN 3 THEN '🥉 Третья'
        ELSE '📊 Остальные'
    END AS medal
FROM sales_2;


INSERT INTO sales_2 (seller, sale_date, amount, product_category) VALUES
('Олег', '2024-01-12', 200, 'Одежда');
