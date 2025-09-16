-- # Правила RULES


CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2)
);


INSERT INTO products (name, price) VALUES 
('Ноутбук', 75000),
('Монитор', 18000),
('Клавиатура', 3500),
('Мышь', 2500),
('Принтер', 12000);

CREATE TABLE products_log (
    id SERIAL PRIMARY KEY,
    product_id INT,
    action VARCHAR(10),
    action_time TIMESTAMP DEFAULT NOW()
);

CREATE RULE log_insert AS ON INSERT TO products DO ALSO
INSERT INTO products_log (product_id, action) VALUES (NEW.id, 'INSERT')

INSERT INTO products (name, price) VALUES ('Laptop', 999.99);













