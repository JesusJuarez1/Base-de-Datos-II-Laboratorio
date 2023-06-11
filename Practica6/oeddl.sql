/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     12/05/2012 09:14:47 a.m.                     */
/*==============================================================*/


/*==============================================================*/
/* Table: CATEGORIES_TAB                                        */
/*==============================================================*/
create table OE.CATEGORIES_TAB 
(
   CATEGORY_NAME        VARCHAR2(50),
   CATEGORY_DESCRIPTION VARCHAR2(1000),
   CATEGORY_ID          NUMBER(2)            not null,
   PARENT_CATEGORY_ID   NUMBER(2),
   constraint SYS_C0011038 primary key (CATEGORY_ID)
);

/*==============================================================*/
/* Table: COUNTRIES                                             */
/*==============================================================*/
create table OE.COUNTRIES 
(
   COUNTRY_ID           CHAR(2)              not null
      constraint COUNTRY_ID_NN check ("COUNTRY_ID" IS NOT NULL),
   COUNTRY_NAME         VARCHAR2(40),
   REGION_ID            NUMBER,
   constraint COUNTRY_C_ID_PK primary key (COUNTRY_ID)
);

comment on column OE.COUNTRIES.COUNTRY_ID is
'Primary key of countries table.';

comment on column OE.COUNTRIES.COUNTRY_NAME is
'Country name';

comment on column OE.COUNTRIES.REGION_ID is
'Region ID for the country. Foreign key to region_id column in the departments table.';

/*==============================================================*/
/* Table: CUSTOMERS                                             */
/*==============================================================*/
create table OE.CUSTOMERS 
(
   CUSTOMER_ID          NUMBER(6)            not null
      constraint CUSTOMER_ID_MIN check (CUSTOMER_ID > 0),
   CUST_FIRST_NAME      VARCHAR2(20)         not null
      constraint CUST_FNAME_NN check ("CUST_FIRST_NAME" IS NOT NULL),
   CUST_LAST_NAME       VARCHAR2(20)         not null
      constraint CUST_LNAME_NN check ("CUST_LAST_NAME" IS NOT NULL),
   CUST_ADDRESS         NUMBER(4),
   NLS_LANGUAGE         VARCHAR2(3),
   NLS_TERRITORY        VARCHAR2(30),
   CREDIT_LIMIT         NUMBER(9,2)         
      constraint CUSTOMER_CREDIT_LIMIT_MAX check (CREDIT_LIMIT is null or (CREDIT_LIMIT <= 5000)),
   CUST_EMAIL           VARCHAR2(30),
   ACCOUNT_MGR_ID       NUMBER(6),
   DATE_OF_BIRTH        DATE,
   MARITAL_STATUS       VARCHAR2(20),
   GENDER               VARCHAR2(1),
   INCOME_LEVEL         VARCHAR2(50),
   constraint CUSTOMERS_PK primary key (CUSTOMER_ID)
);

comment on column OE.CUSTOMERS.CUSTOMER_ID is
'Primary key column.';

comment on column OE.CUSTOMERS.CUST_FIRST_NAME is
'NOT NULL constraint.';

comment on column OE.CUSTOMERS.CUST_LAST_NAME is
'NOT NULL constraint.';

comment on column OE.CUSTOMERS.CUST_ADDRESS is
'Object column of type address_typ.';

comment on column OE.CUSTOMERS.CREDIT_LIMIT is
'Check constraint.';

comment on column OE.CUSTOMERS.ACCOUNT_MGR_ID is
'References OE.employees.employee_id.';

/*==============================================================*/
/* Table: INVENTORIES                                           */
/*==============================================================*/
create table OE.INVENTORIES 
(
   PRODUCT_ID           NUMBER(6)            not null,
   WAREHOUSE_ID         NUMBER(3)            not null
      constraint INVENTORY_WAREHOUSE_ID_NN check ("WAREHOUSE_ID" IS NOT NULL),
   QUANTITY_ON_HAND     NUMBER(8)            not null
      constraint INVENTORY_QOH_NN check ("QUANTITY_ON_HAND" IS NOT NULL),
   constraint INVENTORY_PK primary key (PRODUCT_ID, WAREHOUSE_ID)
);

comment on column OE.INVENTORIES.PRODUCT_ID is
'Part of concatenated primary key, references product_information.product_id.';

comment on column OE.INVENTORIES.WAREHOUSE_ID is
'Part of concatenated primary key, references warehouses.warehouse_id.';

/*==============================================================*/
/* Index: INV_PRODUCT_IX                                        */
/*==============================================================*/
create index OE.INV_PRODUCT_IX on OE.INVENTORIES (
   PRODUCT_ID ASC
);

/*==============================================================*/
/* Table: LOCATIONS                                             */
/*==============================================================*/
create table OE.LOCATIONS 
(
   LOCATION_ID          NUMBER(4)            not null,
   STREET_ADDRESS       VARCHAR2(40),
   POSTAL_CODE          VARCHAR2(12),
   CITY                 VARCHAR2(30)         not null
      constraint LOC_CITY_NN check ("CITY" IS NOT NULL),
   STATE_PROVINCE       VARCHAR2(25),
   COUNTRY_ID           CHAR(2),
   constraint LOC_ID_PK primary key (LOCATION_ID)
);

comment on column OE.LOCATIONS.LOCATION_ID is
'Primary key of locations table';

comment on column OE.LOCATIONS.STREET_ADDRESS is
'Street address of an office, warehouse, or production site of a company.
Contains building number and street name';

comment on column OE.LOCATIONS.POSTAL_CODE is
'Postal code of the location of an office, warehouse, or production site
of a company.';

comment on column OE.LOCATIONS.CITY is
'A not null column that shows city where an office, warehouse, or
production site of a company is located.';

comment on column OE.LOCATIONS.STATE_PROVINCE is
'State or Province where an office, warehouse, or production site of a
company is located.';

comment on column OE.LOCATIONS.COUNTRY_ID is
'Country where an office, warehouse, or production site of a company is
located. Foreign key to country_id column of the countries table.';

/*==============================================================*/
/* Table: ORDERS                                                */
/*==============================================================*/
create table OE.ORDERS 
(
   ORDER_ID             NUMBER(12)           not null,
   ORDER_DATE           DATE                 not null
      constraint ORDER_DATE_NN check ("ORDER_DATE" IS NOT NULL),
   ORDER_MODE           VARCHAR2(8)         
      constraint ORDER_MODE_LOV check (ORDER_MODE is null or (ORDER_MODE in ('direct','online'))),
   CUSTOMER_ID          NUMBER(6)            not null
      constraint ORDER_CUSTOMER_ID_NN check ("CUSTOMER_ID" IS NOT NULL),
   ORDER_STATUS         NUMBER(2),
   ORDER_TOTAL          NUMBER(8,2)         
      constraint ORDER_TOTAL_MIN check (ORDER_TOTAL is null or (ORDER_TOTAL >= 0)),
   SALES_REP_ID         NUMBER(6),
   PROMOTION_ID         NUMBER(6),
   constraint ORDER_PK primary key (ORDER_ID)
);

comment on column OE.ORDERS.ORDER_ID is
'PRIMARY KEY column.';

comment on column OE.ORDERS.ORDER_DATE is
'TIMESTAMP WITH LOCAL TIME ZONE column, NOT NULL constraint.';

comment on column OE.ORDERS.ORDER_MODE is
'CHECK constraint.';

comment on column OE.ORDERS.ORDER_STATUS is
'0: Not fully entered, 1: Entered, 2: Canceled - bad credit, -
3: Canceled - by customer, 4: Shipped - whole order, -
5: Shipped - replacement items, 6: Shipped - backlog on items, -
7: Shipped - special delivery, 8: Shipped - billed, 9: Shipped - payment plan,-
10: Shipped - paid';

comment on column OE.ORDERS.ORDER_TOTAL is
'CHECK constraint.';

comment on column OE.ORDERS.SALES_REP_ID is
'References OE.employees.employee_id.';

comment on column OE.ORDERS.PROMOTION_ID is
'Sales promotion ID. Used in SH schema';

/*==============================================================*/
/* Index: ORD_CUSTOMER_IX                                       */
/*==============================================================*/
create index OE.ORD_CUSTOMER_IX on OE.ORDERS (
   CUSTOMER_ID ASC
);

/*==============================================================*/
/* Table: ORDER_ITEMS                                           */
/*==============================================================*/
create table OE.ORDER_ITEMS 
(
   ORDER_ID             NUMBER(12)           not null,
   LINE_ITEM_ID         NUMBER(3)            not null,
   PRODUCT_ID           NUMBER(6)            not null,
   UNIT_PRICE           NUMBER(8,2),
   QUANTITY             NUMBER(8),
   constraint ORDER_ITEMS_PK primary key (ORDER_ID, LINE_ITEM_ID)
);

comment on column OE.ORDER_ITEMS.ORDER_ID is
'Part of concatenated primary key, references orders.order_id.';

comment on column OE.ORDER_ITEMS.LINE_ITEM_ID is
'Part of concatenated primary key.';

comment on column OE.ORDER_ITEMS.PRODUCT_ID is
'References product_information.product_id.';

/*==============================================================*/
/* Index: ITEM_ORDER_IX                                         */
/*==============================================================*/
create index OE.ITEM_ORDER_IX on OE.ORDER_ITEMS (
   ORDER_ID ASC
);

/*==============================================================*/
/* Index: ITEM_PRODUCT_IX                                       */
/*==============================================================*/
create index OE.ITEM_PRODUCT_IX on OE.ORDER_ITEMS (
   PRODUCT_ID ASC
);

/*==============================================================*/
/* Table: PHONE_NUMBERS                                         */
/*==============================================================*/
create table PHONE_NUMBERS 
(
   CUSTOMER_ID          NUMBER(6)            not null,
   PHONE_ID             NUMBER(4)            not null,
   PHONE_NUMBER         VARCHAR(20),
   constraint PK_PHONE_NUMBERS primary key (CUSTOMER_ID, PHONE_ID)
);

/*==============================================================*/
/* Table: PRODUCT_DESCRIPTIONS                                  */
/*==============================================================*/
create table OE.PRODUCT_DESCRIPTIONS 
(
   PRODUCT_ID           NUMBER(6)            not null,
   LANGUAGE_ID          VARCHAR2(3)          not null,
   TRANSLATED_NAME      NVARCHAR2(50)        not null
      constraint TRANSLATED_NAME_NN check ("TRANSLATED_NAME" IS NOT NULL),
   TRANSLATED_DESCRIPTION NVARCHAR2(2000)      not null
      constraint TRANSLATED_DESC_NN check ("TRANSLATED_DESCRIPTION" IS NOT NULL),
   constraint PRODUCT_DESCRIPTIONS_PK primary key (PRODUCT_ID, LANGUAGE_ID)
);

comment on column OE.PRODUCT_DESCRIPTIONS.PRODUCT_ID is
'Primary key column.';

comment on column OE.PRODUCT_DESCRIPTIONS.LANGUAGE_ID is
'Primary key column.';

/*==============================================================*/
/* Table: PRODUCT_INFORMATION                                   */
/*==============================================================*/
create table OE.PRODUCT_INFORMATION 
(
   PRODUCT_ID           NUMBER(6)            not null,
   PRODUCT_NAME         VARCHAR2(50),
   PRODUCT_DESCRIPTION  VARCHAR2(2000),
   CATEGORY_ID          NUMBER(2),
   WEIGHT_CLASS         NUMBER(1),
   WARRANTY_PERIOD      NUMBER(4),
   SUPPLIER_ID          NUMBER(6),
   PRODUCT_STATUS       VARCHAR2(20)        
      constraint PRODUCT_STATUS_LOV check (PRODUCT_STATUS is null or (PRODUCT_STATUS in ('orderable','planned','under development','obsolete'))),
   LIST_PRICE           NUMBER(8,2),
   MIN_PRICE            NUMBER(8,2),
   CATALOG_URL          VARCHAR2(50),
   constraint PRODUCT_INFORMATION_PK primary key (PRODUCT_ID)
);

comment on column OE.PRODUCT_INFORMATION.PRODUCT_ID is
'Primary key column.';

comment on column OE.PRODUCT_INFORMATION.PRODUCT_DESCRIPTION is
'Primary language description corresponding to translated_description in
OE.product_descriptions, added to provide non-NLS text columns for OC views
to accss.';

comment on column OE.PRODUCT_INFORMATION.CATEGORY_ID is
'Low cardinality column, can be used for bitmap index.
Schema SH uses it as foreign key';

comment on column OE.PRODUCT_INFORMATION.WEIGHT_CLASS is
'Low cardinality column, can be used for bitmap index.';

comment on column OE.PRODUCT_INFORMATION.WARRANTY_PERIOD is
'INTERVAL YEAER TO MONTH column, low cardinality, can be used for bitmap
index.';

comment on column OE.PRODUCT_INFORMATION.SUPPLIER_ID is
'Offers possibility of extensions outside Common Schema.';

comment on column OE.PRODUCT_INFORMATION.PRODUCT_STATUS is
'Check constraint. Appropriate for complex rules, such as "All products in
status PRODUCTION must have at least one inventory entry." Also appropriate
for a trigger auditing status change.';

/*==============================================================*/
/* Table: PROMOTIONS                                            */
/*==============================================================*/
create table OE.PROMOTIONS 
(
   PROMO_ID             NUMBER(6)            not null,
   PROMO_NAME           VARCHAR2(20),
   constraint PROMO_ID_PK primary key (PROMO_ID)
);

/*==============================================================*/
/* Table: REGIONS                                               */
/*==============================================================*/
create table OE.REGIONS 
(
   REGION_ID            NUMBER               not null
      constraint REGION_ID_NN check ("REGION_ID" IS NOT NULL),
   REGION_NAME          VARCHAR2(25),
   constraint REG_ID_PK primary key (REGION_ID)
);

/*==============================================================*/
/* Table: WAREHOUSES                                            */
/*==============================================================*/
create table OE.WAREHOUSES 
(
   WAREHOUSE_ID         NUMBER(3)            not null,
   WAREHOUSE_NAME       VARCHAR2(35),
   LOCATION_ID          NUMBER(4),
   constraint WAREHOUSES_PK primary key (WAREHOUSE_ID)
);

comment on column OE.WAREHOUSES.WAREHOUSE_ID is
'Primary key column.';

alter table OE.COUNTRIES
   add constraint FK_COUNTRIE_REFERENCE_REGIONS foreign key (REGION_ID)
      references OE.REGIONS (REGION_ID);

alter table OE.CUSTOMERS
   add constraint FK_CUSTOMER_REFERENCE_LOCATION foreign key (CUST_ADDRESS)
      references OE.LOCATIONS (LOCATION_ID);

alter table OE.INVENTORIES
   add constraint INVENTORIES_PRODUCT_ID_FK foreign key (PRODUCT_ID)
      references OE.PRODUCT_INFORMATION (PRODUCT_ID)
      not deferrable;

alter table OE.INVENTORIES
   add constraint INVENTORIES_WAREHOUSES_FK foreign key (WAREHOUSE_ID)
      references OE.WAREHOUSES (WAREHOUSE_ID)
      not deferrable enable novalidate;

alter table OE.LOCATIONS
   add constraint FK_LOCATION_REFERENCE_COUNTRIE foreign key (COUNTRY_ID)
      references OE.COUNTRIES (COUNTRY_ID);

alter table OE.ORDERS
   add constraint ORDERS_CUSTOMER_ID_FK foreign key (CUSTOMER_ID)
      references OE.CUSTOMERS (CUSTOMER_ID)
      on delete set null
      not deferrable;

alter table OE.ORDERS
   add constraint FK_ORDERS_REFERENCE_PROMOTIO foreign key (PROMOTION_ID)
      references OE.PROMOTIONS (PROMO_ID);

alter table OE.ORDER_ITEMS
   add constraint ORDER_ITEMS_ORDER_ID_FK foreign key (ORDER_ID)
      references OE.ORDERS (ORDER_ID)
      on delete cascade
      not deferrable enable novalidate;

alter table OE.ORDER_ITEMS
   add constraint ORDER_ITEMS_PRODUCT_ID_FK foreign key (PRODUCT_ID)
      references OE.PRODUCT_INFORMATION (PRODUCT_ID)
      not deferrable;

alter table PHONE_NUMBERS
   add constraint FK_PHONE_NU_REFERENCE_CUSTOMER foreign key (CUSTOMER_ID)
      references OE.CUSTOMERS (CUSTOMER_ID);

alter table OE.PRODUCT_DESCRIPTIONS
   add constraint PD_PRODUCT_ID_FK foreign key (PRODUCT_ID)
      references OE.PRODUCT_INFORMATION (PRODUCT_ID)
      not deferrable;

alter table OE.PRODUCT_INFORMATION
   add constraint FK_PRODUCT__REFERENCE_CATEGORI foreign key (CATEGORY_ID)
      references OE.CATEGORIES_TAB (CATEGORY_ID);

alter table OE.WAREHOUSES
   add constraint FK_WAREHOUS_REFERENCE_LOCATION foreign key (LOCATION_ID)
      references OE.LOCATIONS (LOCATION_ID);
