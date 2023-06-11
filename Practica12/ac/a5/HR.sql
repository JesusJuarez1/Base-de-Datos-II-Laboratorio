--1
Select distinct location_id,street_address,city,state_province,country_name 
from Departments natural join Locations natural join Countries order by location_id;

--2
Select e.last_name, d.department_id, d.department_name from Employees e join Departments d on (e.department_id = d.department_id);

--3
Select e.last_name, e.job_id, e.department_id, d.department_name from Employees e join Departments d on (e.department_id=d.department_id) join 
Locations l on (d.location_id=l.location_id and l.city='Toronto');

--7
describe Job_Grades;
Select e.last_name, e.job_id, d.department_name, e.salary, g.grade from Employees e join Departments d on (e.department_id=d.department_id) 
join Job_Grades g on (e.salary >= g.lowest_sal and e.salary <= g.highest_sal);

--8
Select last_name, hire_date from Employees where hire_date > (Select hire_date from Employees where last_name = 'Davies');


