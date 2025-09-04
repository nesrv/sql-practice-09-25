CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id),
    product_id INTEGER REFERENCES products(id),
    quantity INTEGER NOT NULL,
    order_date DATE DEFAULT CURRENT_DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO orders (customer_id, product_id, quantity, total_amount, order_date) VALUES
(1, 3, 2, 3000.00, '2023-01-20'),
(2, 2, 1, 79990.00, '2023-02-10'),
(2, 4, 3, 7500.00, '2023-02-15'),
(1, 4, 1, 2500.00, '2023-03-10'),
(2, 3, 1, 1500.00, '2023-03-15');
