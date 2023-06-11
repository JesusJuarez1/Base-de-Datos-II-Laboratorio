create table customers(
    customer_id number(8) constraint customer_pk primary key,
    name varchar(25) constraint cus_name_nn not null,
    last_name varchar(25) constraint cus_last_name_nn not null,
    date_birth date,
    address varchar(100) constraint cus_address_nn not null,
    rfc char(13) constraint cus_rfc_nn not null,
    reference1 varchar(50) constraint cus_ref1_nn not null,
    reference2 varchar(50)
);

create table telephone_numbers(
    telephone_number number(10) constraint telephone_pk primary key,
    activation date constraint tel_activation_nn not null,
    flag char(1) constraint tel_flag_nn not null,
    constraint tel_flag_check check (flag in('A','I'))
);

create table customers_tel_numbers(
    customer_id number(8),
    telephone_number number(10),
    constraint customer_tel_number_pk primary key (customer_id,telephone_number),
    constraint cust_cust_tel_number_fk foreign key (customer_id) references customers(customer_id),
    constraint tel_cust_tel_number_fk foreign key (telephone_number) references telephone_numbers(telephone_number)
);

create table telephones(
    serial_number number(16) constraint py_telephone_pk primary key,
    brand varchar(20) constraint tel_brand_nn not null,
    tel_capacity number(5,2) constraint tel_tel_capacity_nn not null,
    cpu varchar(50) constraint tel_cpu_nn not null,
    display varchar(50) constraint tel_display_nn not null,
    camera number(2) constraint tel_camera_nn not null
);

create table customer_telephones(
    customer_id number(8),
    serial_number number(16),
    constraint customer_telephone_pk primary key (customer_id,serial_number),
    constraint cust_cust_tel_fk foreign key (customer_id) references customers(customer_id),
    constraint tel_cus_tel_fk foreign key (serial_number) references telephones(serial_number)
);

create table types_plan(
    plan_id number(3) constraint type_plan_pk primary key,
    duration char(2) constraint type_plan_duration_nn not null,
    constraint type_plan_duration_check check(duration in(6,12,18,24))
);

create table telephone_plan(
    telephone_number number(10),
    plan_id number(3),
    constraint telephone_plan_pk primary key (telephone_number,plan_id),
    constraint tel_plan_tel_number_fk foreign key (telephone_number) references telephone_numbers(telephone_number),
    constraint type_plan_telephone_plan_fk foreign key (plan_id) references types_plan(plan_id)
);

create table calls(
    telephone_number1 number(10),
    telephone_number2 number(10),
    time_started date,
    time_end date,
    constraint call_pk primary key (telephone_number1,telephone_number2,time_started,time_end),
    constraint tel1_calls_fk foreign key (telephone_number1) references telephone_numbers(telephone_number),
    constraint tel2_calls_fk foreign key (telephone_number2) references telephone_numbers(telephone_number)
);






