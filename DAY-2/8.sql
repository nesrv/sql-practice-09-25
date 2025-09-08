SELECT
    p.project_id,
    p.project_name,
    d.department_name,
    p.budget,
    d.location
FROM projects p
NATURAL RIGHT JOIN departments d;


SELECT
    p.project_id,
    p.project_name,
    d.department_name,
    p.budget,
    d.location
FROM projects p
NATURAL FULL JOIN departments d;


SELECT
    e.last_name,  
    p.project_name,
    d.department_name,
    p.budget,
    d.location
FROM employees e
NATURAL JOIN projects p
NATURAL JOIN departments d;

