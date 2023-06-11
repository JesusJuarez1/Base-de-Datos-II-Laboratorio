create table vehicle(id_veh number, lic_plates varchar2(10),
owner_id number);
create table owner(owner_id number, surname varchar2(10),
forename varchar2(10), dateobirth date);

--indices
create unique index vehicle_lic_plates_idx on vehicle(lic_plates);
create index owner_sur_for_name on owner(surname,forename);

--restricciones
alter table vehicle add constraint vahicle_pk primary key (id_veh);
alter table vehicle add constraint owner_vehicle_fk foreign key (owner_id) references owner(owner_id);
alter table owner add constraint owner_pk primary key (owner_id);