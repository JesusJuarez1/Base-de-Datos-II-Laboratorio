--1
Select first_name, last_name, to_char(hire_date, 'fmDay, "the" ddth "of" Month, Year') Satrt_date 
from Employees where to_char(hire_date,'fmDay') = 'Sábado';

--2
Select first_name, last_name, 
    decode(length(first_name),
        length(last_name), 'Same Length',
        'Different Length') name_lengths
from Employees where department_id = 100;

--3
Select state_province,
    decode(state_province,
        'Washington', 'Headquarters',
        'Texas', 'Oil Wells',
        'California', city,
        'New Jersey', street_address)Location_info 
from Locations where country_id = 'US' order by location_info;







