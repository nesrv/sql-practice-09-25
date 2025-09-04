
UPDATE products 
SET is_active = FALSE
WHERE category_id = (SELECT id FROM categories WHERE name = 'Книги');



-- Увеличьте цены всех товаров в категории "Спорт" на 15%
UPDATE products 
SET price = price*1.15
WHERE category_id = (SELECT id FROM categories WHERE name = 'Спорт');

UPDATE customers 
SET email = 'ivan.petrov@newmail.com' 
WHERE first_name = 'Иван' AND last_name = 'Петров';

-- Удалить по условию
DELETE FROM products WHERE stock_quantity <  30;


DELETE FROM products 
WHERE category_id = (SELECT id FROM categories WHERE name = 'Устаревшие');


DELETE FROM customers WHERE email IS NULL;


-- \copy products TO 'products_export.csv' CSV HEADER;