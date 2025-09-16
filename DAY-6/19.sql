-- # Правила RULES

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees (name, department, salary) VALUES
('Иванов Иван Иванович', 'Бухгалтерия', 85000.50),
('Петрова Анна Сергеевна', 'Маркетинг', 92000.00),
('Сидоров Алексей Владимирович', 'IT-отдел', 125000.75),
('Кузнецова Елена Дмитриевна', 'Маркетинг', 78000.00),
('Федорова Мария Петровна', 'Бухгалтерия', 87000.50),
('Николаев Андрей Игоревич', 'IT-отдел', 135000.00);

CREATE VIEW marketing_employees AS
SELECT id, name, salary FROM employees WHERE department = 'Маркетинг';


select * from marketing_employees;

CREATE RULE insert_marketing AS ON INSERT TO marketing_employees DO INSTEAD
INSERT INTO employees (name, department, salary) VALUES (NEW.name, 'Маркетинг', NEW.salary);

CREATE RULE update_marketing AS ON UPDATE TO marketing_employees DO INSTEAD
UPDATE employees SET name = NEW.name, salary = NEW.salary 
WHERE id = OLD.id AND department = 'Маркетинг';

CREATE RULE delete_marketing AS ON DELETE TO marketing_employees DO INSTEAD
DELETE FROM employees WHERE id = OLD.id AND department = 'Маркетинг';


INSERT INTO marketing_employees (name, salary) VALUES ('Джон Бидон', 50000);







