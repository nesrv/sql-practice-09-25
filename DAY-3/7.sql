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


SELECT
    seller,
    sale_date,
    amount,
    RANK() OVER (ORDER BY amount DESC) AS global_rank,
    ROUND(
        (RANK() OVER (ORDER BY amount DESC) - 1) * 100.0 / 
        (COUNT(*) OVER () - 1), 
        1
    ) AS percentile      
FROM sales_2;

-- ## DENSE_RANK() — Справедливое ранжирование
-- Как RANK(), но без пропусков в нумерации.

SELECT
    seller,
    sale_date,
    amount,
    RANK() OVER (PARTITION BY seller ORDER BY amount DESC) AS sales_rank,
    DENSE_RANK() OVER (ORDER BY amount DESC) AS sales_rank,
    ROW_NUMBER() OVER (ORDER BY amount DESC) AS row_num,
     CASE 
        WHEN RANK() OVER (PARTITION BY seller ORDER BY amount DESC) = 
             DENSE_RANK() OVER (PARTITION BY seller ORDER BY amount DESC)
        THEN 'Ранги совпадают'
        ELSE 'RANK пропустил номер'
    END AS rank_comparison
FROM sales_2
ORDER BY  amount DESC;


SELECT
    seller,
    sale_date,
    amount,
    -- Предыдущая, текущая, следующая
    LAG(amount) OVER w AS prev_amount,
    amount AS current_amount,
    LEAD(amount) OVER w AS next_amount,
    -- Тренд из трех точек
    CASE 
        WHEN LAG(amount) OVER w < amount AND amount < LEAD(amount) OVER w 
        THEN 'Устойчивый рост'
        WHEN LAG(amount) OVER w > amount AND amount > LEAD(amount) OVER w 
        THEN 'Устойчивое снижение'
        ELSE 'Нестабильный тренд'
    END AS trend_analysis
FROM sales
WINDOW w AS (PARTITION BY seller ORDER BY sale_date);


SELECT
    seller,
    sale_date,
    amount,
    -- Скользящая сумма (текущая + предыдущая)
    amount + COALESCE(LAG(amount) OVER w, 0) AS rolling_sum_2,
    -- Средняя из трех последних
    ROUND(
        (amount + 
         COALESCE(LAG(amount, 1) OVER w, amount) +
         COALESCE(LAG(amount, 2) OVER w, amount)
        ) / 3.0, 
        2
    ) AS moving_avg_3
FROM sales_2
WINDOW w AS (PARTITION BY seller ORDER BY sale_date)
ORDER BY seller, sale_date;


SELECT
    seller,
    sale_date,
    amount,
    CASE 
        WHEN amount = MAX(amount) OVER w THEN 'Максимум'
        WHEN amount = MIN(amount) OVER w THEN 'Минимум'
        ELSE 'Обычная'
    END AS extremum_type,
    -- Отклонение от среднего
    ROUND(amount - AVG(amount) OVER w, 2) AS deviation_from_avg
FROM sales
WINDOW w AS (PARTITION BY seller)
ORDER BY seller, sale_date;

