SELECT seller, amount, LAG(amount) OVER (PARTITION by seller ORDER BY sale_date)
from sales;

SELECT seller, sale_date,amount, LAG(amount, 1, 0) OVER (PARTITION by seller ORDER BY sale_date)
from sales;