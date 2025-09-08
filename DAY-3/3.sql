SELECT 
    seller,
    sale_date,
    amount, 
    LAG(amount, 1, 0) OVER w AS previous_amount,
    amount - LAG(amount) OVER w AS difference,
    ROUND((amount - LAG(amount) OVER w) /  LAG(amount) OVER (PARTITION BY seller ORDER BY sale_date) * 100, 2) AS growth_percent
from sales
window w as (PARTITION by seller ORDER BY sale_date);


SELECT 
    seller,
    sale_date,
    amount, 
    LEAD(amount) OVER w AS next_sale,
    CASE 
        WHEN LEAD(amount) OVER w > amount 
        THEN 'Рост ожидается'
        WHEN LEAD(amount) OVER w < amount 
        THEN 'Снижение ожидается'
        WHEN LEAD(amount) OVER w = amount 
        THEN 'Стабильность'
        ELSE 'Последняя продажа'
    END AS trend_forecast    
from sales
window w as (PARTITION by seller ORDER BY sale_date)
ORDER BY seller, sale_date;


SELECT 
    seller,
    sale_date,
    amount, 
    FIRST_VALUE(amount) OVER w AS base    
from sales
window w as (PARTITION by seller ORDER BY sale_date);




SELECT 
    seller,
    sale_date,
    amount, 
    FIRST_VALUE(amount) OVER w AS base,
    amount - FIRST_VALUE(amount) OVER (PARTITION BY seller ORDER BY sale_date) AS growth,
    (amount / FIRST_VALUE(amount) OVER (PARTITION BY seller ORDER BY sale_date) - 1) * 100 AS growth_percent, 
    ROUND(
        (amount::NUMERIC / FIRST_VALUE(amount) OVER (PARTITION BY seller ORDER BY sale_date) - 1) * 100, 
        2
    ) AS growth_percent    
from sales
window w as (PARTITION by seller ORDER BY sale_date);