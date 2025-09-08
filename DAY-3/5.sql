SELECT
    seller,
    product_category,
    sale_date,
    amount,
  FIRST_VALUE(amount) OVER (
        PARTITION BY seller, product_category 
        ORDER BY sale_date
    ) AS first_in_category

FROM sales_2
ORDER BY seller DESC, product_category, sale_date;


SELECT
    seller,   
    sale_date,
    amount,
   LAST_VALUE(amount) OVER (
        PARTITION BY seller
        ORDER BY sale_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        --ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS last_value
FROM sales_2;


-- - **`UNBOUNDED PRECEDING`** — от самой первой строки группы
-- - **`UNBOUNDED FOLLOWING`** — до самой последней строки группы
-- - **`CURRENT ROW`** — текущая строка (по умолчанию)



SELECT
    seller,   
    sale_date,
    amount,
   LAST_VALUE(amount) OVER w AS final_amount,
   CASE
        WHEN amount = LAST_VALUE(amount) OVER w 
        THEN 'Финальная сделка'
        ELSE 'Промежуточная'
    END AS deal_status
FROM sales_2
WINDOW w AS (PARTITION BY seller
        ORDER BY sale_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING);