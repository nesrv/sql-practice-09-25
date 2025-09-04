-- Простая вставка
INSERT INTO categories (name, description) 
VALUES ('Электроника', 'Электронные устройства');

-- Множественная вставка
INSERT INTO categories (name, description) VALUES
('Книги', 'Художественная и техническая литература'),
('Одежда', 'Мужская и женская одежда'),
('Спорт', 'Спортивные товары и инвентарь');

-- Вставка с автоинкрементом (пропускаем id)
INSERT INTO products (name, price, category_id, stock_quantity) VALUES
('iPhone 15', 89990.00, 1, 25),
('Samsung Galaxy', 79990.00, 1, 30),
('Учебник SQL', 1500.00, 2, 100),
('Футболка Nike', 2500.00, 3, 50);

-- Вставка клиентов
INSERT INTO customers (first_name, last_name, email, phone, birth_date, city) VALUES
('Иван', 'Петров', 'ivan@email.com', '+7-900-123-4567', '1985-03-15', 'Москва'),
('Мария', 'Сидорова', 'maria@email.com', '+7-900-234-5678', '1990-07-22', 'СПб'),
('Алексей', 'Козлов', 'alex@email.com', '+7-900-345-6789', '1988-11-08', 'Екатеринбург');