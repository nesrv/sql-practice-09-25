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

select * from it_employees
UNION
select * from marketing_employees;

select * from it_employees
UNION all
select * from marketing_employees;

select * from it_employees
EXCEPT
select * from marketing_employees;


select skill from it_employees
EXCEPT
select skill from marketing_employees;



select skill from it_employees
INTERSECT
select skill from marketing_employees;


-- Сравнение навыков между отделами

SELECT 'Только ИТ' as category, skill FROM it_employees
EXCEPT
SELECT 'Только ИТ', skill FROM marketing_employees;


-- SELECT first_name, last_name FROM it_employees
--     UNION
-- SELECT first_name, last_name FROM marketing_employees;

SELECT 'Всего уникальных' as metric, COUNT(*) as count FROM (
    SELECT first_name, last_name FROM it_employees
    UNION
    SELECT first_name, last_name FROM marketing_employees
) t;

