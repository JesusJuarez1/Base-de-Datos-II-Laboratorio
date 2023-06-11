Select e.last_name, e.hire_date, m.last_name, m.hire_date from Employees e join 
Employees m on (e.manager_id=m.employee_id and e.hire_date < m.hire_date);