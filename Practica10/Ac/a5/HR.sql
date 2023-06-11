--1
Select (last_name||' earns '||to_char(salary,'fm$999,999')||' monthly but wants '||to_char(salary*3,'fm$999,999')) "Dream Salaries" from Employees;

--2
Select last_name, hire_date, to_char(next_day(add_months(hire_date,6),1),'fmDay, "the" ddth "of" Month, yyyy') Review from Employees;

--3
Select last_name, hire_date, to_char(hire_date,'fmDay') "Day" from Employees order by mod(to_char(hire_date,'D')+6,7);

--4
Select last_name, decode(
    commission_pct,
        null, 'No Commission',
        commission_pct) comm 
from Employees;

--5
Select job_id,
    decode(job_id,
        'AD_PRES', 'A',
        'ST_MAN', 'B',
        'IT_PROG', 'C',
        'SA_REP', 'D',
        'ST_CLERK', 'E',
        0) Grade
from Employees;

--6
Select job_id,
    case job_id
        when 'AD_PRES' then 'A'
        when 'ST_MAN' then 'B'
        when 'IT_PROG' then 'C'
        when 'SA_REP' then 'D'
        when 'ST_CLERK' then 'E'
        else '0' end Grade
from Employees;


