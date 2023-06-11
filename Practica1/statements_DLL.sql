create table Asset_Types(
  asset_type_code number(8) constraint asset_types_pk primary key,
  asset_type_description varchar2(100) constraint ass_ty_des_nn not null
);

create table IT_Assets(
  asset_id number(8) constraint it_asset_pk primary key,
  asset_type_code number(8),
  description varchar2(100),
  other_details varchar2(100),
  constraint asset_type_it_asset_fk foreign key (asset_type_code) references Asset_Types(asset_type_code)
);

create table IT_Asset_Inventory(
  it_asset_inventory_id number(8) constraint it_asset_inven_pk primary key,
  asset_id number(8) constraint it_as_as_nn not null,
  inventory_date Date constraint asset_inven_inven_nn not null,
  number_assingned number(8) constraint asset_inven_num_assig_nn not null,
  number_in_stock number(8) constraint asset_inven_num_in_stock_nn not null,
  other_details varchar2(100),
  constraint it_asset_it_asset_inven_fk foreign key (asset_id) references IT_Assets(asset_id)
);

create table Employee(
  employee_id number(8) constraint employee_pk primary key,
  first_name varchar(50) constraint emplo_fir_na_nn not null,
  last_name varchar(50) constraint emplo_las_na_nn not null,
  departament varchar(50) constraint emplo_dep_nn not null,
  extension varchar(50) constraint emplo_ext_nn not null,
  cell_mobile char(15) constraint emplo_cell_mo_nn not null,
  email_address varchar(50) constraint emplo_ema_add_nn not null,
  other_details varchar(100)
);

create table Employee_Assets(
  asset_id number(8),
  employee_id number(8),
  date_out date,
  date_returned varchar(50),
  condition_out varchar(50),
  condition_returned varchar(50),
  other_details varchar(100),
  constraint emplo_emplo_asse_fk foreign key (employee_id) references Employee(employee_id),
  constraint asse_emplo_asse_fk foreign key (asset_id) references IT_Assets(asset_id),
  constraint employee_asset__pk primary key (asset_id,employee_id,date_out)
);




