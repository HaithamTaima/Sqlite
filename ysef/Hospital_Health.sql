create table if not exists Hospital
(
       hos_id integer primary key,
       hos_name      text unique,
       hos_phone     text check (hos_phone like '28_____')
);
create table if not exists lab
(
       lab_id   integer primary key,
       lab_name text not null
);

create table if not exists patient
(
       patient_id   integer primary key,
       patient_name text not null,
       is_insuraced boolean default true
);
alter table lab add column hos_id integer references Hospital(Hos_id);
create table if not exists patient_labs
(
   patient_id   integer references patient(patient_id),
   lab_id integer     references lab(lab_id),
   check_date date,
   primary key (patient_id,lab_id)
       
);


