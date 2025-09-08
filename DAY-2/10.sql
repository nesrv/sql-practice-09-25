SELECT
    e.last_name,  
    p.project_name,
    d.department_name   
FROM employees e
NATURAL JOIN  projects p 
NATURAL JOIN  departments d;


SELECT
    d.department_name, 
    count(e.last_name)      
FROM employees e
NATURAL JOIN  projects p 
NATURAL JOIN  departments d
GROUP by d.department_name;


SELECT
    d.department_name,
    p.project_name, 
    count(e.last_name)      
FROM employees e
NATURAL JOIN  projects p 
NATURAL JOIN  departments d
GROUP by d.department_name, p.project_name
HAVING SUM(p.budget) > 500000;


