Select first_name, last_name from Employees where lower(first_name) like '%li%';

Select 
    case length(first_name||last_name) when 15 then first_name||' '||last_name
        when 14 then first_name||' '||last_name
        when 13 then first_name||' '||last_name
        when 12 then first_name||' '||last_name
        when 11 then first_name||' '||last_name
        when 10 then first_name||' '||last_name
        when 9 then first_name||' '||last_name
        when 8 then first_name||' '||last_name
        when 7 then first_name||' '||last_name
        when 6 then first_name||' '||last_name
        when 5 then first_name||' '||last_name
        when 4 then first_name||' '||last_name
        when 3 then first_name||' '||last_name
        when 2 then first_name||' '||last_name
        when 1 then first_name||' '||last_name
    else substr(first_name,1,1)||' '||rpad(last_name,14,' ') end name
from Employees;

Select employee_id, last_name, hire_date, to_char(months_between(sysdate,hire_date),'999,999.00') as months_worked 
from Employees where months_between('01/01/10',hire_date) >= 90;

Select first_name||' '||last_name name, length(last_name) as "Length last name", instr(lower(last_name),'a') as "Position of the a"
from Employees where last_name like '%n';

Select employee_id, hire_date, to_char(months_between('01/01/10',hire_date),'999,999.00')as "Months employed",
    add_months(hire_date,6) as "Review date", next_day(hire_date,5)as "First Friday", last_day(hire_date) as "Last day"
from Employees where months_between('01/01/10',hire_date) <= 150;

Select employee_id, hire_date from Employees where extract(year from hire_date) = 2005;

