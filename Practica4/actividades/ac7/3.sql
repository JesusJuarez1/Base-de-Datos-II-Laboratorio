create table Templates(
	template_id integer,
	version_number integer,
	template_type_code char(15),
	date_effective_from datetime,
	date_effective_to datetime,
	template_details varchar(255));

create table Ref_Template_Types(
	template_type_code char(15),
	template_type_description varchar(255));

create table Documents(
	document_id integer,
	template_id integer,
	document_name varchar(255),
	document_description varchar(255),
	other_details varchar(255));

create table Paragraphs(
	paragraph_id integer,
	document_id integer,
	paragraph_text varchar(255),
	other_details varchar(255));


--indices
create index temp_version on Templates(version_number);
create index temp_time on Templates(date_effective_from, date_effective_to);
create index doc_temp on Documents(template_id);
create index doc_name on Documents(document_name);
create index para_doc on Paragraphs(document_id);
create index para_txt on Paragraphs(paragraph_text);

--restricciones
alter table Templates add constraint template_pk primary key (template_id);
alter table Templates add constraint tem_type_template_fk foreign key (template_type_code) references Ref_Template_Types(template_type_code);
alter table Ref_Template_Types add constraint template_type_pk primary key (template_type_code);
alter table Documents add constraint document_pk primary key (document_id);
alter table Documents add constraint temp_doc_fk foreign key (template_id) references Templates(template_id);
alter table Paragraphs add constraint paragraph_pk primary key (paragraph_id);
alter table Paragraphs add constraint doc_paragraph_fk foreign key (document_id) references Documents(document_id);



--secuencias
create sequence temp_id NOMAXVALUE NOCYCLE;
create sequence doc_id NOMAXVALUE NOCYCLE;
create sequence para_id NOMAXVALUE NOCYCLE;
--sinonimos
create synonym Temp for Templates;
create synonym Temp_Typ for Ref_Template_Types;
create synonym Doc for Documents;
create synonym Para for Paragraphs;