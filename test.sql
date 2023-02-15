create table if not exists Department
(
    DipId  integer  primary key autoincrement,
    Dep  Text   unique 
);

create table Employee 
(
    EmpId Integer primary key autoincrement,
    EmpName  Text   not null ,
    HireDate  Data  default Current_Date,
    Age  integer  check (Age>-17 and Age<=45),
    Gen  char  check (Gen in ('M','F')),
    Salary float check(Salary>=500),
    EmpDepId insert  references Departments(DipId)

);

create table Projects 
(
    ProjectId integer primary key autoincrement,
    ProjectName Text not null,
    StartDate  Data default Current_Date,
    EndDate  Data  check (EndDate >=StartDate),
    Fund float  check (Fund >0)
);

create table EmpProjects
(
    EmpId  integer references Employee (EmpId),
    ProjectId  integer references Projects (ProjectId) ,
    WorkingHours float  check (WorkingHours>0),
    --dd
    primary key (DepId,EmpId),



)

alter table Projects add column ManagerId integer references Employee (EmpId),

insert into Departments VALUES(123,'das',null)

select *
from Employee
where Gender ='M'


select EmpName as "bfdfbd" ,HireDate as "fdgdfgdfg"
from Employee
where Gender ='M'and Age >60


select EmpName as "bfdfbd" ,HireDate as "fdgdfgdfg"
from Employee
where Gender ='M'or Age >60

select EmpName ,Salary ,HireDate
from Employee
where Gender ='F' and Salary>1500


select EmpName 
from Employee 
where EmpDepId in (231,1231)

select *
from Employee
where Gender ='M' and Age between 30 and 45
 


select *
from Employee 
--start
where EmpName like 'mohamad%'



select *
from Employee 
--end
where EmpName like '%mohamad'



select *
from Employee 
--تحتوي 
where EmpName like '%mohamad%'


select * 
from Departments 
where DepId like '13_11%'

select EmpName ,Gender ,Salary
from Employee 
where Gender ='M' 
and  (Salary >1500 or Salary<1300)

select DepName 
from Departments
order by DepName


select EmpName ,DepName 
from Employee,Departments
where EmpDepId=DepId

update Employee 
set Salary=1500
where Gender ='F' and age<60

update Employee
set EmpId =12313 ,Salary=1800
where EmpId=30

update Employee 
set Salary=Salary+0.1*Salary
where age>60

unique Employee 
set Salary=3000
where EmpId=83435


delete from Employee
where age >85

--
update Employee
set EmpDepId=34322
where EmpDepId=3333

delete from Departments
where DepId=3333
--
alter table Departments 
add column ManagerId 
integer references Employee (EmpId);

--

select DepName ,EmpName
from Employee left join Departments
on Departments.ManagerId=Employee.EmpId














 