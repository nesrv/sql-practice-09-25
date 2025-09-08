CREATE VIEW customer_summary AS
SELECT 
    customer_name,
    COUNT(*) as order_count,
    SUM(amount) as total_amount,
    AVG(amount) as avg_amount
FROM orders
GROUP BY customer_name;

SELECT * FROM customer_summary;


SELECT * FROM information_schema.views WHERE table_schema = 'public';

-- MATERIALIZED VIEV


