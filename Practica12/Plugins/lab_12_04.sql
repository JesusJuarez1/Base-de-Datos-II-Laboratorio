Select e.last_name "Employee", e.employee_id "Emp#", m.last_name "Manager", m.employee_id "MGR#" from Employees e 
join Employees m on (e.manager_id=m.employee_id);