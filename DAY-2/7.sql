CREATE TABLE departments (
    department_id INTEGER,
    department_name VARCHAR(100),
    location VARCHAR(100)
);

-- Таблица сотрудников
CREATE TABLE employees (
    employee_id INTEGER,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INTEGER, -- общий столбец с departments
    salary DECIMAL(10, 2)
);

-- Таблица проектов
CREATE TABLE projects (
    project_id INTEGER,
    project_name VARCHAR(100),
    department_id INTEGER, -- общий столбец с departments
    budget DECIMAL(10, 2)
);

-- Вставим данные в departments
INSERT INTO departments (department_id, department_name, location) VALUES
(1, 'ИТ', 'Москва'),
(2, 'Кадры', 'Санкт-Петербург'),
(3, 'Продажи', 'Екатеринбург'),
(4, 'Маркетинг', 'Новосибирск'),
(5, 'Пряники', 'Тула');

-- Вставим данные в employees
INSERT INTO employees (employee_id, first_name, last_name, department_id, salary) VALUES
(1, 'Иван', 'Петров', 1, 80000),
(2, 'Мария', 'Сидорова', 1, 75000),
(3, 'Алексей', 'Козлов', 2, 65000),
(4, 'Елена', 'Морозова', 3, 70000),
(5, 'Дмитрий', 'Волков', NULL, 60000),
(6, 'Анна', 'Новикова', 4, 68000);

-- Вставим данные в projects
INSERT INTO projects (project_id, project_name, department_id, budget) VALUES
(101, 'Редизайн сайта', 1, 500000),
(102, 'Система найма', 2, 300000),
(103, 'Обучение продажам', 3, 400000),
(104, 'Рекламная кампания', 4, 600000),
(105, 'Мобильное приложение', 1, 800000),
(106, 'Миграция на постгрес', NULL, 800000);