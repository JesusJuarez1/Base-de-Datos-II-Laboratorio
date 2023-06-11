create table employees_2 as (select * from employees);

describe employees_2;

alter table employees_2 read only;

insert into employees_2 values(43,'Juan','Perez','juan@gmailcom',null,'27-08-21','AD_PRES',null,null,null,null);

alter table employees_2 read write;

select *from employees_2 where employee_id = 43;

drop table employees_2;