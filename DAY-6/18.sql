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


ALTER TABLE products ADD COLUMN is_deleted BOOLEAN DEFAULT FALSE;


CREATE RULE soft_delete AS ON DELETE TO products DO INSTEAD
UPDATE products SET is_deleted = TRUE WHERE id = OLD.id;

DELETE FROM products WHERE id = 1;














