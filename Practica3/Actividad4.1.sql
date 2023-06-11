create table Animal(
	id_animal number(4),
	family varchar2(100) constraint animal_family_nn not null,
	name varchar2(100) constraint animal_name_nn not null,
	specie varchar2(100) constraint animal_specie_nn not null,
	gender char(2) constraint animal_gender_nn not null,
	age number(3) ,
	kingdom varchar2(100)
);

create table Cage_Type(
	id_cage_type number(2),
	name varchar2(50) constraint cage_type_name_nn not null
);

create table Cage(
	id_cage number(3),
	name varchar2(50) constraint cage_name_nn not null,
	section varchar2(50) constraint cage_section_nn not null,
	id_cage_type number(2)
);

create table Exhibition_record(
	id_animal number(4),
	id_cage number(3),
	status varchar(50) constraint Exhibition_record_status_nn not null
);


alter table Animal add constraint animal_pk primary key (id_animal);

alter table Cage_Type add constraint cage_type_pk primary key (id_cage_type);

alter table Cage add constraint cage_pk primary key (id_cage);
alter table Cage add constraint cage_type_cage_fk foreign key (id_cage_type) references Cage_Type(id_cage_type);

alter table Exhibition_record add constraint exhibition_record_pk primary key (id_animal);
alter table Exhibition_record add constraint animal_exhibition_rec_fk foreign key (id_animal) references Animal(id_animal);
alter table Exhibition_record add constraint cage_exhibition_rec_fk foreign key (id_cage) references Cage(id_cage);