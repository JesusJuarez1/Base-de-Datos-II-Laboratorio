create table Customers(
	customer_id number,
	fname varchar2(25) constraint customer_fname_nn not null,
	lname varchar2(25),
	shopping_cart_id number);

create table Shopping_Cart(
	shopping_cart_id number);

create table Establishments(
	establish_id number,
	name varchar2(25) constraint establesh_name_nn not null,
	address_id number);

create table Address(
	address_id number,
	country varchar2(25) constraint address_country_nn not null,
	postal_code char(12) constraint address_postal_c_nn not null,
	city varchar2(25) constraint address_city_nn not null,
	street varchar2(25) constraint address_street_nn not null,
	anumber number constraint address_anumber_nn not null);

create table Warehouse(
	warehouse_id number,
	address_id number);

create table Products(
	product_id number,
	price number(6,2) constraint product_price_nn not null);

create table Product_warehouse(
	warehouse_id number,
	product_id number);

create table Buy(
	shopping_cart_id number,
	product_id number,
	date_buy date);

create table Book(
	ISBN char(12),
	product_id number,
	title varchar2(25) constraint book_title_nn not null);

create table Cassettes(
	cassette_id number,
	product_id number,
	capacity number(5,2));

create table Electronic_cards(
	card_id number,
	product_id number,
	capacity number(5,2));

create table Blue_Ray(
	blue_ray_id number,
	product_id number,
	capacity number(5,2));

create table CDs(
	cd_id number,
	product_id number,
	capacity number(5,2));

create table Publisher(
	publisher_id number,
	fname varchar2(25) constraint publisher_fname_nn not null,
	lname varchar2(25));

create table Author(
	author_id number,
	fname varchar2(25) constraint author_fname_nn not null,
	lname varchar2(25));



create bitmap index esta_name_idx on Establishments(name);
create index esta_addr_idx on Establishments(address_id);
create index address_idx on Address(country,postal_code,city);
create index ware_addr_idx on Warehouse(address_id);
create index pro_ware_idx on Product_warehouse(warehouse_id,product_id);
create index book_title_idx on Book(title);
create index cassette_capa_idx on Cassettes(capacity);
create index elect_capa_idx on Electronic_cards(capacity);
create index blue_ray_capa_idx on Blue_Ray(capacity);
create index cd_capa_idx on CDs(capacity);
create index publisher_name_idx on Publisher(fname,lname);
create index author_name_idx on Author(fname,lname);



alter table Customers add constraint customer_pk primary key (customer_id);
alter table Customers add constraint shoppin_customer_fk foreign key (shopping_cart_id) references Shopping_Cart(shopping_cart_id);
alter table Establishments add constraint establish_pk primary key (establish_id);
alter table Establishments add constraint addr_establish_fk foreign key (address_id) references Address(address_id);
alter table Address add constraint address_pk primary key (address_id);
alter table Warehouse add constraint warehouse_pk primary key (warehouse_id);
alter table Warehouse add constraint addr_warehouse_fk foreign key (address_id) references Address(address_id);
alter table Product add constraint product_pk primary key (product_id);
alter table Product_warehouse add constraint pro_ware_pk primary key (warehouse_id,product_id);
alter table Product_warehouse add constraint pro_pro_ware_fk foreign key (product_id) references Products(product_id);
alter table Product_warehouse add constraint ware_pro_ware_fk foreign key (warehouse_id) references Warehouse(warehouse_id);
alter table Buy add constraint buy_pk primary key (shopping_cart_id,product_id,date_buy);
alter table Buy add constraint shoppin_buy_fk foreign key (shopping_cart_id) references Shopping_Cart(shopping_cart_id);
alter table Buy add constraint product_buy_fk foreign key (product_id) references Products(product_id);
alter table Book add constraint book_pk primary key (ISBN,product_id);
alter table Book add constraint product_book_fk foreign key (product_id) references Products(product_id);
alter table Cassettes add constraint cassette_pk primary key (cassette_id,product_id);
alter table Cassettes add constraint product_cassette_fk foreign key (product_id) references Products(product_id);
alter table Electronic_cards add constraint elec_card_pk primary key (card_id,product_id);
alter table Electronic_cards add constraint product_card_fk foreign key (product_id) references Products(product_id);
alter table Blue_Ray add constraint blue_ray_pk primary key (blue_ray_id,product_id);
alter table Blue_Ray add constraint product_blue_ray_fk foreign key (product_id) references Products(product_id);
alter table CDs add constraint cd_pk primary key (cd_id,product_id);
alter table CDs add constraint product_cd_fk foreign key (product_id) references Products(product_id);
alter table Publisher add constraint publisher_pk primary key (publisher_id);
alter table Author add constraint author_pk primay key (author_id);



create sequence sq_cus_id NOMAXVALUE NOCYCLE;
create sequence sq_shop_id NOMAXVALUE NOCYCLE;
create sequence seq_est_id NOMAXVALUE NOCYCLE;
create sequence seq_addr_id NOMAXVALUE NOCYCLE;
create sequence seq_ware_id NOMAXVALUE NOCYCLE;
create sequence seq_pro_id NOMAXVALUE NOCYCLE;
create sequence seq_prowa_id NOMAXVALUE NOCYCLE;
create sequence seq_buy_id NOMAXVALUE NOCYCLE;
create sequence seq_book_id NOMAXVALUE NOCYCLE;
create sequence seq_cass_id NOMAXVALUE NOCYCLE;
create sequence seq_car_id NOMAXVALUE NOCYCLE;
create sequence seq_blue_id NOMAXVALUE NOCYCLE;
create sequence seq_cd_id NOMAXVALUE NOCYCLE;
create sequence seq_pub_id NOMAXVALUE NOCYCLE;
create sequence seq_aut_id NOMAXVALUE NOCYCLE;



create synonym Cus for Customers;
create synonym Sho_Ca for Shopping_Cart;
create synonym Estab for Establishments;
create synonym Addr for Address;
create synonym Ware for Warehouse;
create synonym Prod for Products;
create synonym Prod_Ware for Product_warehouse;
create synonym Buy for Buy;
create synonym Book for Book;
create synonym Cass for Cassettes;
create synonym Elec_Card for Electronic_cards;
create synonym BRay for Blue_Ray;
create synonym CD for CDs;
create synonym Publi for Publisher;
create synonym Auth for Author;
