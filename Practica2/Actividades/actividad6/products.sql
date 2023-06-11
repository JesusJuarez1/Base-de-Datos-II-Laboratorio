create table Suppliers(
    supplier_code number(6),
    supplier_details varchar(50) constraint suppliers_supp_details_nn not null
);

create table Product_Supplier(
    product_code number(6),
    supplier_code number(6),
    supplied_from_date date constraint product_supplier_from_nn not null,
    supplied_to_date date constraint product_supplier_to_nn not null
);

create table Product_Hierarchy(
    product_code number(6),
    parent_product_code number(6),
    product_name varchar(25),
    product_description varchar(75),
    amount_required number(3)
);

alter table Suppliers add(status numeric(1),name varchar(25),city int);

alter table Suppliers drop column status;

alter table Suppliers rename column city to city_address;

alter table Suppliers modify city_address varchar(50);

describe Suppliers;

alter table Suppliers add constraint suppliers_pk primary key (supplier_code);

alter table Product_Hierarchy add constraint hroduct_hierarchy_pk primary key (product_code);

alter table Product_Hierarchy add constraint Product_Hierarchy_fk foreign key (parent_product_code) references Product_Hierarchy(product_code);

alter table Product_Supplier add constraint Product_Product_suppliers_fk foreign key (product_code) references Product_Hierarchy(product_code);

alter table Product_Supplier add constraint Suppliers_Product_suppliers_fk foreign key (supplier_code) references Suppliers(supplier_code);



