
UPDATE products 
SET is_active = FALSE
WHERE category_id = (SELECT id FROM categories WHERE name = 'Книги');