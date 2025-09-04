--Выведите имена клиентов и их города, только уникальные города

SELECT first_name, last_name, city from customers;

SELECT  
    name AS product_name,
    price AS cost,
    price * 0.9 AS discounted_price,
    stock_quantity * price AS total_value
FROM products;

-- Выбрать уникальные значения
SELECT DISTINCT city FROM customers;

-- Выбрать с сортировкой
SELECT name, price FROM products ORDER BY price DESC LIMIT 3;


-- Выведите имена клиентов и их города, только уникальные города

SELECT first_name, last_name, city from customers;


SELECT * FROM products WHERE price > 5000 AND stock_quantity > 20;

SELECT * FROM customers WHERE city IN ('Москва', 'СПб', 'Екатеринбург');

SELECT * FROM products WHERE price BETWEEN 1000 AND 10000;

SELECT * FROM products WHERE name LIKE '%iPhone%';

SELECT * FROM customers WHERE first_name LIKE 'И%';

SELECT * FROM customers WHERE phone IS NOT NULL;

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Елена', 'Морозова', 'elena@email.com');


SELECT * FROM customers 
WHERE birth_date > '1980-01-01' AND city = 'Москва';


UPDATE products 
SET price = 85000.00, stock_quantity = 35 
WHERE name = 'Samsung Galaxy';

UPDATE products SET price = price * 1.1 WHERE category_id = 1;


UPDATE customers 
SET city = 'Москва' 
WHERE city IS NULL AND phone LIKE '+7-495%';

UPDATE products 
SET is_active = FALSE
WHERE category_id = (SELECT id FROM categories WHERE name = 'Книги');