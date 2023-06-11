create table Customers(
	customer_id number,
	organisation_or_person varchar2(25),
	organisation_name varchar2(25) constraint cus_org_name_nn not null,
	gender varchar2(10),
	first_name varchar2(25) constraint cus_fir_name_nn not null,
	middle_name varchar2(25),
	last_name varchar2(25) constraint cus_las_name_nn not null,
	email_address varchar2(50),
	login_name varchar2(25) constraint cus_log_name_nn not null,
	login_password varchar2(25) constraint cus_log_pass_nn not null,
	phone_number char(15),
	address_line_1 varchar2(25),
	address_line_2 varchar2(25),
	address_line_3 varchar2(25),
	address_line_4 varchar2(25),
	town_city varchar2(25),
	county varchar2(25),
	country varchar2(25));

create table Ref_Payment_Methods(
	payment_method_code char(2),
	payment_method_description varchar2(25));

create table Customer_Payment_Methods(
	customer_payment_id number,
	customer_id number,
	payment_method_code char(2),
	credit_card_number char(15),
	payment_method_details varchar2(25));

create table Ref_Product_Types(
	product_type_code varchar2(15),
	parent_product_type_code varchar2(15),
	product_type_description varchar2(25));

create table Products(
	product_id number,
	product_type_code varchar2(15),
	return_merchandise_authori varchar2(25),
	product_name varchar2(25) constraint product_name_nn not null,
	product_price number(6,2) constraint product_price_nn not null,
	product_color char(7),
	product_size varchar2(10),
	product_description varchar2(30),
	other_product_details varchar2(30));

create table Ref_Order_Status_Codes(
	order_status_code varchar2(9),
	order_status_description varchar2(30));

create table Orders(
	order_id number,
	customer_id number,
	order_status_code varchar2(9),
	date_order_placed date,
	order_details varchar2(30));

create table Ref_Order_Item_Status_Codes(
	order_item_status_code varchar2(9),
	order_item_stauts_description varchar2(30));

create table Order_Items(
	order_item_id number,
	product_id number,
	order_id number,
	order_item_status_code varchar2(9),
	order_item_quantity number,
	order_item_price number(6,2),
	RMA_number number,
	RMA_issued_by varchar2(25),
	RMA_issued_date date,
	other_order_item_details varchar2(30));

create table Ref_Invoice_status_Codes(
	invoice_stauts_code varchar2(6),
	invoice_status_description varchar2(30));

create table Invocies(
	invoice_number number,
	order_id number,
	invoice_stauts_code varchar2(6),
	invoice_date date,
	invoice_details varchar2(30));

create table Payments(
	payment_id number,
	invoice_number number,
	payment_date date,
	payment_amount number(7,2));

create table Shipments(
	shipment_id number,
	order_id number,
	invoice_number number,
	shipment_tracking_number number,
	shipment_date date,
	other_shipment_details varchar2(30));

create table Shipment_Items(
	shipment_id number,
	order_item_id number);

--Indices
create bitmap index cus_gender_idx on Customers(gender);
create index cus_organisation on Customers(organisation_or_person, organisation_name);
create index cus_name on Customers(first_name, middle_name, last_name);
create unique index cus_log_name on Customers(login_name);
create index cus_pay_me_cus on Customer_Payment_Methods(customer_id);
create index cus_pay_me_pay_me on Customer_Payment_Methods(payment_method_code);
create index ref_pro_typ on Ref_Product_Types(parent_product_type_code);
create bitmap index prod_size on Products(product_size);
create index product_name_idx on Products(product_name, product_price);
create index prod_type_idx on Products(product_type_code);
create bitmap index order_status on Orders(order_status_code);
create index cus_order on Orders(customer_id);
create index order_item_prod on Order_Items(product_id);
create index order_item_order on Order_Items(order_id);
create index order_item_status on Order_Items(order_item_status_code);
create index invoice_order on Invocies(order_id);
create index invoice_status on Invocies(invoice_stauts_code);
create index invo_paym on Payments(invoice_number);
create index payment_date on Payments(payment_date);
create index ship_order on Shipments(order_id);
create index ship_invoice on Shipments(invoice_number);
create index ship_date on Shipments(shipment_date);

--Restricciones
alter table Customers add constraint customer_pk primary key (customer_id);
alter table Ref_Payment_Methods add constraint ref_paym_met_pk primary key (payment_method_code);
alter table Customer_Payment_Methods add constraint custo_pay_met_pk primary key (customer_payment_id);
alter table Customer_Payment_Methods add constraint cus_cus_pay_met_fk foreign key (customer_id) references Customers(customer_id);
alter table Customer_Payment_Methods add constraint ref_cus_pay_met_fk foreign key (payment_method_code) references Ref_Payment_Methods(payment_method_code);
alter table Ref_Product_Types add constraint ref_pro_ty_pk primary key (product_type_code);
alter table Ref_Product_Types add constraint ref_ty_ref_pro_ty_fk foreign key (parent_product_type_code) references Ref_Product_Types(product_type_code);
alter table Products add constraint product_pk primary key (product_id);
alter table Products add constraint ref_ty_prod_fk foreign key (product_type_code) references Ref_Product_Types(product_type_code);
alter table Ref_Order_Status_Codes add constraint ref_or_status_pk primary key (order_status_code);
alter table Orders add constraint order_pk primary key (order_id);
alter table Orders add constraint cus_order_fk foreign key (customer_id) references Customers(customer_id);
alter table Orders add constraint status_order_fk foreign key (order_status_code) references Ref_Order_Status_Codes(order_status_code);
alter table Ref_Order_Item_Status_Codes add constraint item_status_pk primary key (order_item_status_code);
alter table Order_Items add constraint order_item_pk primary key (order_item_id);
alter table Order_Items add constraint pro_order_item_fk foreign key (product_id) references Products(product_id);
alter table Order_Items add constraint ord_order_item_fk foreign key (order_id) references Orders(order_id);
alter table Order_Items add constraint status_order_item_fk foreign key (order_item_status_code) references Ref_Order_Item_Status_Codes(order_item_status_code);
alter table Ref_Invoice_status_Codes add constraint ref_inv_stat_pk primary key (invoice_stauts_code);
alter table Invocies add constraint invoice_pk primary key (invoice_number);
alter table Invocies add constraint order_invoice_fk foreign key (order_id) references Orders(order_id);
alter table Invocies add constraint stauts_invoice_fk foreign key (invoice_stauts_code) references Ref_Invoice_status_Codes(invoice_stauts_code);
alter table Payments add constraint payment_pk primary key (payment_id);
alter table Payments add constraint invoice_payment_fk foreign key (invoice_number) references Invocies(invoice_number);
alter table Shipments add constraint shipment_pk primary key (shipment_id);
alter table Shipments add constraint order_shipment_fk foreign key (order_id) references Orders(order_id);
alter table Shipments add constraint invoice_shipment_fk foreign key (invoice_number) references Invocies(invoice_number);
alter table Shipment_Items add constraint shipment_item_pk primary key (shipment_id,order_item_id);
alter table Shipment_Items add constraint ship_ship_item_fk foreign key (shipment_id) references Shipments(shipment_id);
alter table Shipment_Items add constraint order_ship_item_fk foreign key (order_item_id) references Order_Items(order_item_id);


--Secuencias
create sequence cus_id NOMAXVALUE NOCYCLE;
create sequence pay_met_id NOMAXVALUE NOCYCLE;
create sequence prod_id NOMAXVALUE NOCYCLE;
create sequence order_id NOMAXVALUE NOCYCLE;
create sequence order_item_id NOMAXVALUE NOCYCLE;
create sequence inv_id NOMAXVALUE NOCYCLE;
create sequence order_id NOMAXVALUE NOCYCLE;
create sequence inv_sta__id NOMAXVALUE NOCYCLE;
create sequence pay_id NOMAXVALUE NOCYCLE;
create sequence ship_id NOMAXVALUE NOCYCLE;


-- Sononimos
create synonym Cus for Customers;
create synonym Ref_Pay_Met for Ref_Payment_Methods;
create synonym Cus_Pay_Met for Customer_Payment_Methods;
create synonym Ref_Pro_Typ for Ref_Product_Types;
create synonym Prod for Products;
create synonym Ref_Ord_Status for Ref_Order_Status_Codes;
create synonym Ord for Orders;
create synonym Ref_Ord_It_Sta_Co for Ref_Order_Item_Status_Codes;
create synonym Ord_Ite for Order_Items;
create synonym Ref_Inv_Stat_Co for Ref_Invoice_status_Codes;
create synonym Invo for Invocies;
create synonym Paym for Payments;
create synonym Ship for Shipments;
create synonym Ship_Ite for Shipment_Items;

