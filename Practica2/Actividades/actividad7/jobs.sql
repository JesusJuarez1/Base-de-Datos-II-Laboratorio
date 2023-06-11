create table jobs(
    job_id number(6),
    job_description varchar(50) constraint jobs_job_description_nn not null,
    status numeric(1) constraint jobs_status_nn not null
);

create table employees(
    employee_id number(6),
    frist_name varchar2(25) constraint employees_name_nn not null,
    last_name varchar2(25) constraint employees_last_name_nn not null,
    phone_number numeric(10) constraint employees_phone_nn not null 
);

create table branchs(
    branch_id number(6),
    address varchar2(75) constraint branchs_address_nn not null
);

create table work_on(
    employee_id number(6),
    job_id number(6),
    branch_id number(6),
    job_start date
);

create table managers(
    manager_id number(6),
    frist_name varchar2(25) constraint managers_name_nn not null,
    last_name varchar2(25) constraint managers_last_name_nn not null,
    phone_number numeric(10) constraint managers_phone_nn not null 
);

create table manages(
    employee_id number(6),
    job_id number(6),
    branch_id number(6),
    job_start date,
    assignment_date date,
    manager_id number(6)
);

alter table jobs add constraint job_pk primary key (job_id);

alter table employees add constraint employee_pk primary key (employee_id);

alter table branchs add constraint branch_pk primary key (branch_id);

alter table work_on add constraint work_on_pk primary key (employee_id,job_id,branch_id,job_start);
alter table work_on add constraint employee_work_on_fk foreign key (employee_id) references employees(employee_id);
alter table work_on add constraint job_work_on_fk foreign key (job_id) references jobs(job_id);
alter table work_on add constraint branch_work_on_fk foreign key (branch_id) references branchs(branch_id);

alter table managers add constraint manager_pk primary key (manager_id);

alter table manages add constraint manages_pk primary key (employee_id,job_id,branch_id,job_start,assignment_date,manager_id);
alter table manages add constraint manager_manages_fk foreign key (manager_id) references managers(manager_id);
alter table manages add constraint work_on_manages_fk foreign key (employee_id,job_id,branch_id,job_start) references work_on(employee_id,job_id,branch_id,job_start);