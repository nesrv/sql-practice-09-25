CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_name TEXT,
    amount NUMERIC,
    order_date DATE
);

INSERT INTO orders (customer_name, amount, order_date)
VALUES
('Иванов', 1000, '2024-01-10'),
('Петров', 2000, '2024-01-15'),
('Сидоров', 1500, '2024-02-05');