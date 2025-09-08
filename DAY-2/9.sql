
SELECT
    e.last_name,  
    p.project_name,
    d.department_name,
    p.budget,
    d.location
FROM employees e
NATURAL JOIN projects p
NATURAL JOIN departments d
WHERe d.department_name = 'ИТ' and p.budget > 500_000;




SELECT
    e.last_name,  
    p.project_name,
    d.department_name   
FROM employees e
JOIN projects p on e.department_id = p.department_id
JOIN departments d on e.department_id = d.department_id;

