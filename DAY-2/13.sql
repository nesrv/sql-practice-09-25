-- Создадим таблицу для демонстрации
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    category_id INTEGER,
    stock_quantity INTEGER
);

INSERT INTO products (name, price, category_id, stock_quantity) VALUES
('Ноутбук Dell', 75000.00, 1, 15),
('iPhone 15', 89000.00, 2, 25),
('Клавиатура Logitech', 3500.00, 1, 50),
('Наушники Sony', 12000.00, 2, 30),
('Монитор Samsung', 25000.00, 1, 20),
('Мышь Razer', 4500.00, 1, 40),
('Планшет iPad', 65000.00, 2, 18),
('Веб-камера', 8000.00, 1, 35);



PREPARE add_product(varchar, decimal, integer, integer) AS
INSERT INTO products (name, price, category_id, stock_quantity) 
VALUES ($1, $2, $3, $4);

EXECUTE add_product('Принтер HP-1', 15000.00, 2, 12);


PREPARE update_stock(integer, integer) AS
UPDATE products 
SET stock_quantity = stock_quantity + $2
WHERE id = $1
RETURNING name, stock_quantity;

-- Увеличить запас товара с id=1 на 5 единиц
EXECUTE update_stock(1, 5);