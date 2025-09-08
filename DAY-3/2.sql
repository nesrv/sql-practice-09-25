SELECT seller, amount, LAG(amount) OVER (PARTITION by seller ORDER BY sale_date)
from sales;

SELECT seller, sale_date,amount, LAG(amount, 1, 0) OVER (PARTITION by seller ORDER BY sale_date)
from sales;

SELECT 
    seller,
    sale_date,
    amount, 
    LAG(amount, 1, 0) OVER w AS previous_amount,
    amount - LAG(amount) OVER w AS difference,
    ROUND((amount - LAG(amount) OVER w) /  LAG(amount) OVER (PARTITION BY seller ORDER BY sale_date) * 100, 2) AS growth_percent
from sales
window w as (PARTITION by seller ORDER BY sale_date);