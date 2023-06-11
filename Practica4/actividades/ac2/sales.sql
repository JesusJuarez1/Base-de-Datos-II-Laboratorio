create table Shops(
    shop_id number,
    address varchar2(50) constraint shops_address_nn not null,
    manager number(6));

create table Products(
    product_id number,
    pname varchar2(25) constraint products_pname_nn not null,
    sale_price number(6,2) constraint products_sale_price_nn not null,
    purcahse_price number(6,2), constraint products_purchase_pri_nn not null,
    provider varchar(25) constraint products_provider_nn not null);

create table Channels(
    channel_id number,
    cname varchar2(25) constraint channels_cname_nn not null);

create table Employees(
    emp_id number,
    emp_name varchar2(25) constraint employee_name_nn not null,
    emp_lastn varchar2(25),
    boss_id number,
    address varchar(50) constraint employee_address_nn not null,
    date_of_birth date,
    gender varchar2(6) constraint employee_gender_nn not null,
    beneficiaries varchar(50));

create table Sales(
    sale_id number,
    channel_id number,
    product_id number,
    shop_id number,
    quantity number,
    emp_id number,
    sale_date date);


create bitmap index shops_addr_idx on Shops(address);
create unique index product_pname_idx on Products(pname);
create index product_idx on Products(pname, sale_price, purchase_price, provider);
create bitmap index channels_cname_idx on Channels(cname);
create bitmap index employee_gender_idx on Employees(gender);
create index employee_idx on Employees(emp_name, emp_lastn, address, date_of_birth, beneficiaries);
create index sales_idx Sales(quantity, sale_date);

--restricciones
alter table Shops add constraint shops_pk primary key (shop_id);
alter table Products add constraint product_pk primary key (product_id);
alter table Channels add constraint channel_pk primary key (channel_id);
alter table Employees add constraint employee_pk primary key (emp_id);
alter table Sales add constraint sales_pk primary key (sale_id);
alter table Shops add constraint employee_shop_fk foreign key (manager) references Employees(emp_id);
alter table Employees add constraint employee_employee_fk foreign key (boss_id) references Employees(emp_id);
alter table Sales add constraint shop_sales_fk foreign key (shop_id) references Shops(shop_id);
alter table Sales add constraint product_sales_fk foreign key (product_id) references Products(product_id);
alter table Sales add constraint channel_sales_fk foreign key (channel_id) references Channels(channel_id);
alter table Sales add constraint employee_sales_fk foreign key (emp_id) references Employees(emp_id);

--secuencias
create sequence sq_shops_id NOMAXVALUE NOCYCLE;
create sequence sq_products_id NOMAXVALUE NOCYCLE;
create sequence sq_channels_id NOMAXVALUE NOCYCLE;
create sequence sq_employees_id NOMAXVALUE NOCYCLE;
create sequence sq_sales_id NOMAXVALUE NOCYCLE;

--sinonimos
create synonym Sho for Shops;
create synonym Prod for Products;
create synonym Chann for Channels;
create synonym Emp for Employees;
create synonym Sal for Sales;






