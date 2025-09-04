-- Таблица сотрудников ИТ отдела
CREATE TABLE it_employees (
    employee_id INTEGER,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    skill VARCHAR(50)
);

-- Таблица сотрудников отдела маркетинга
CREATE TABLE marketing_employees (
    employee_id INTEGER,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    skill VARCHAR(50)
);

INSERT INTO it_employees VALUES
(1, 'Иван', 'Петров', 'Python'),
(2, 'Мария', 'Сидорова', 'Java'),
(3, 'Алексей', 'Козлов', 'SQL'),
(4, 'Елена', 'Морозова', 'Python');

INSERT INTO marketing_employees VALUES
(3, 'Алексей', 'Козлов', 'SQL'),
(5, 'Дмитрий', 'Волков', 'Analytics'),
(6, 'Анна', 'Новикова', 'Design'),
(7, 'Петр', 'Иванов', 'SMM');