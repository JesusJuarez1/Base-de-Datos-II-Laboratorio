--6
Select job_id, count(*) from Employees group by job_id;

--7
Select count(distinct manager_id) "Number of Managers" from Employees;

--8
Select (max(salary)-min(salary)) Diference from Employees;

--9
Select manager_id, min(salary) from Employees where manager_id is not null group by manager_id having min(salary) > 6000 order by min(salary) desc;

--10
Select count(*) total, count(nvl2(nullif(to_char(hire_date,'yyyy'),'2001'),null,hire_date)) "2001",
    count(nvl2(nullif(to_char(hire_date,'yyyy'),'2002'),null,hire_date)) "2002",
    count(nvl2(nullif(to_char(hire_date,'yyyy'),'2003'),null,hire_date)) "2003",
    count(nvl2(nullif(to_char(hire_date,'yyyy'),'2004'),null,hire_date)) "2004"
from Employees where to_char(hire_date,'yyyy') in ('2001','2002','2003','2004');

--11
Select job_id "Job", nvl2(nullif(department_id,20),null,max(salary)) "Dept 20",
    nvl2(nullif(department_id,50),null,max(salary)) "Dept 50",
    nvl2(nullif(department_id,80),null,max(salary)) "Dept 80",
    nvl2(nullif(department_id,90),null,max(salary)) "Dept 90",sum(salary) "Total" 
from Employees where department_id in (20,50,80,90) group by job_id,department_id;




