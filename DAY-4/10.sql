CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name TEXT,
    info JSON,           -- JSON тип
    metadata JSONB       -- JSONB тип (рекомендуется)
);

-- Вставляем тестовые данные
INSERT INTO products (name, info, metadata) VALUES
('YotaPhone 3', 
 '{"brand": "Yota", "price": 45000, "specs": {"storage": "128GB", "color": "black"}}',
 '{"category": "smartphone", "tags": ["premium", "dual-screen"], "available": true}'
),
('Эльбрус Планшет', 
 '{"brand": "МЦСТ", "price": 35000, "specs": {"storage": "64GB", "color": "silver"}}',
 '{"category": "tablet", "tags": ["отечественный", "безопасность"], "available": false}'
),
('Аквариус Ноутбук',
 '{"brand": "Аквариус", "price": 85000, "specs": {"ram": "8GB", "cpu": "Байкал"}}',
 '{"category": "laptop", "tags": ["российский", "офисный"], "available": true}'
);