Select e.department_id, e.last_name employee, m.last_name colleague from Employees e join 
Employees m on (e.department_id=m.department_id) where e.employee_id!=m.employee_id;