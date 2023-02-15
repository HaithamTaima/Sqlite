create table if not exists Branch(
Branch_id        integer       primary key,
Branch_name      text          UNIQUE,
Cus_Age          integer       check (Cus_Age> 17)
);


create table if not exists Student(
Stud_id      integer       primary key,
Stud_Name    text          not null,
Stud_Avg     integer       DEFAULT 0,
Stud_DOB     date          DEFAULT current_date
);


create table if not exists School(
School_Id                    integer       primary key,
School_Name                  text          UNIQUE,
School_location_City         text,
School_location_area         text,
School_location_Street       text
);

create table if not exists School_phone (
School_Id    integer       REFERENCES School (School_Id),
School_phone text,
primary key (School_Id,School_phone)
);

alter table Student add column School_Id integer REFERENCES School (School_Id);

alter table Student add column Branch_id integer REFERENCES Branch (Branch_id);
