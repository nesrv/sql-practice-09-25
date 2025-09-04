CREATE TABLE sales_log (
    id SERIAL PRIMARY KEY,
    sale_date DATE,
    product_id INTEGER,
    quantity INTEGER,
    amount DECIMAL(10,2),
    customer_region VARCHAR(50)
);

INSERT INTO sales_log (sale_date, product_id, quantity, amount, customer_region)
SELECT 
    CURRENT_DATE - (random() * 365)::integer,
    (random() * 8 + 1)::integer,
    (random() * 10 + 1)::integer,
    (random() * 50000 + 1000)::decimal(10,2),
    CASE (random() * 4)::integer
        WHEN 0 THEN 'Москва'
        WHEN 1 THEN 'СПб'
        WHEN 2 THEN 'Екатеринбург'
        ELSE 'Новосибирск'
    END
FROM generate_series(1, 10000);



begin;

DECLARE sales_cursor CURSOR FOR
SELECT sale_date, product_id, amount, customer_region
FROM sales_log 
WHERE amount > 25000
ORDER BY sale_date DESC;


FETCH sales_cursor;


commit;

FETCH 5 FROM sales_cursor;



begin;

DECLARE scroll_cursor SCROLL CURSOR FOR
SELECT sale_date, product_id, amount, customer_region
FROM sales_log 
WHERE amount > 25000
ORDER BY sale_date DESC;


FETCH scroll_cursor;


commit;

FETCH FIRST FROM scroll_cursor;     -- Первая строка
FETCH LAST FROM scroll_cursor;      -- Последняя строка
FETCH PRIOR FROM scroll_cursor;     -- Предыдущая строка
FETCH NEXT FROM scroll_cursor;      -- Следующая строка
FETCH ABSOLUTE 3 FROM scroll_cursor; -- 3-я строка от начала
FETCH RELATIVE -2 FROM scroll_cursor; -- На 2 строки назад

CLOSE scroll_cursor;