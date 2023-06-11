create table Customers(
	customer_id number,
	name varchar2(25) constraint customer_name_nn not null,
	mail varchar2(50) constraint customer_mail_nn not null,
	telephone_number varchar2(15));

create table Vehicles(
	plaque varchar2(15),
	mark varchar(25) constraint vahicle_mark_nn not null,
	color varchar2(15) constraint vehicle_color_nn not null,
	model varchar(30) constraint vehicle_model_nn not null);

create table Sales_Agents(
	sales_agent_id number,
	name varchar2(25) constraint sales_ag_name_nn not null,
	mail varchar2(50) constraint sales_ag_mail_nn not null,
	telephone_number varchar2(15),
	salary number(6,2) constraint sales_ag_salary_nn not null);

create table Sales(
	customer_id number,
	plaque varchar2(15),
	sales_agent_id number,
	cost number(7,2) constraint sale_cost_nn not null,
	sale_date date);

create index customer_name_idx on Customers(name);
create index vehicle_mark_idx on Vehicles(mark);
create bitmap index vehicle_color_idx on Vehicles(color);
create index vehicle_model_idx on Vehicles(model);
create index sales_ag_nam_idx on Sales_Agents(name);
create index sales_ag_salary_idx on Sales_Agents(salary);
create index sales_cost_idx on Sales(cost);
create index sales_date_idx on Sales(sale_date);


alter table Customers add constraint customer_pk primary key (customer_id);
alter table Vehicles add constraint vehicle_pk primary key (plaque);
alter table Sales_Agents add constraint sale_ag_pk primary key (sales_agent_id);
alter table Sales add constraint sales_pk primary key (customer_id, plaque, sales_agent_id);
alter table Sales add constraint cus_sales_fk foreign key (customer_id) references Customers(customer_id);
alter table Sales add constraint vehi_sales_fk foreign key (plaque) references Vehicles(plaque);
alter table Sales add constraint sal_ag_sales_fk foreign key (sales_agent_id) references Sales_Agents(sales_agent_id);


create sequence cus_id NOMAXVALUE NOCYCLE;
create sequence sal_ag_id NOMAXVALUE NOCYCLE;

create synonym Cus for Customers;
create synonym Vehi for Vehicles;
create synonym Sal_Age for Sales_Agents;
create synonym Sal for Sales;