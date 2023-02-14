--SQL
--1- DDL (Data Defintion lang .):
--   1- Create [table, view, index,...]
--   2-alter 
--           1-alter rename
--           2-alter add column
--   3-Drop
--2-DML (Data Manu.Lang.):
--    1-insert
--    2-update
--    3-delete
--    4-select 
--         1- simple select
--         2- join table
--         3- aggregation functions
          
--3-Data Types :
--       1-Integer
--       2-float , real ,double , decimal
--       3-Text .char 
--       4-Date,Time,DateTime
--       5-Boolean
--       6-Blob
       
--4-شروط
--       1-primary key
--       2-unique
--       3-not null
--       4-check
--       5-references
--##########
--       1-default
--       2-autoincrement                   
--*********************************************
--select اسماء الاعمدة(*)
--from اسماءالجداول
--where الشروط المطبقة على السجلات 
--order by اسماءالاعمدة
--llllllllllllllll
-->
-->=
--<
--<=
--in ()
--between --and--
--like
--and
--or

--*********************************************

create table if not exists Departments
(
       DepId Integer primary key autoincrement,
       DepName Text unique
);
create table if not exists  Employee
(
       EmpId        integer primary key,
       EmpName      Text    not null,
       HireDate     Date    default Current_Date,
       Age          float   check(Age>=17 and Age<=100),
       Gender       char    check(Gender in ('M','f')),
       Salary       float   check(Salary>=500),
       EmpDepId     integer references Departments(DepId)        
);
create  table if not exists Projects 
(   
       ProjectId    integer primary key autoincrement,
       ProjectName  Text    not null,
       StartDate    Date    default Current_Date,
       EndDate     Date    check(EndDate>=StartDate),
       fund        float   check(Fund>0)                   
);

--جدول وسيط
create  table if not exists EmpProjects 
(
--بقدر احط الشروط على متوى العمود او على مستوى الجدول مثل الاول  
       EmpId          integer references Departments(DepId) on delete cascade,
       ProjectId      integer,
       WorkingHours   float,
       --الشروط
       primary key (EmpId,ProjectId),
       foreign key (ProjectId)references Projects(ProjectId),
       foreign key (DepId)references Departments(DepId),
       check(WorkingHours>0)             
);

create table if not exists  Employee_HIST
(
       EmpId        integer primary key,
       EmpName      Text    not null,
       HireDate     Date    default Current_Date,
       Age          float   check(Age>=17 and Age<=100),
       Gender       char    check(Gender in ('M','f')),
       Salary       float   check(Salary>=500),
       EmpDepId     integer references Departments(DepId)        
);
 --المتقاعدين نقل المتقاعدين من جدول الموطفين الى جدول الموظفين المتقاعدين 
insert into Employee_HIST
select *
from Employee
where EmpStatus=0

delete from Employee
where EmpStatus =0;



/*الاسم الجديد rename to الم الجدول الحالي alter table*/
alter table EmpProjects rename to ProjectsEmps;


/*اضافة عمودalter tabel add colom*/
alter table Projects add column InFinished Boolean default false;


--اضافة عمود معه علاقة 
alter table Departments add column ManagerId integer references Employee(EmpId);
alter table Employee add column ManagerId integer references Employee(EmpId);

--حذف جدول
Drop table ProjectsEmps;
--اضافة
insert into Departments VALUES (101,'حاسوب',null);
insert into Departments VALUES (23,'هاتف',null);
insert into Departments VALUES (321,'كاميرة',null);

insert into Departments VALUES (329,'تطوير البرامج',null);
insert into Departments VALUES (324,'ادارة',null);
insert into Departments VALUES (325,'تمريض',null);
insert into Departments VALUES (326,'هندسة',null);

insert into Departments ( DepName,DepId ) VALUES ('هيثمة',361);
insert into Departments (DepName ) VALUES ('زجا'); 

insert into Employee VALUES (20,'طارق','2/7/2023',20,'f',500,101);
insert into Employee (EmpId,EmpName)VALUES(1,'هيثم');
insert into Employee (EmpId,EmpName,Age) VALUES (999,'اشرف',23);
--لازم المفتاح الجانبي الي رح تضيفه يكون موجود في الجدول الاصلي 
insert into Employee (EmpId,EmpName,EmpDepId) VALUES(23,'خليل',23);
insert into Employee (EmpId,EmpName,EmpDepId) VALUES(24,'جوو',321);

insert into Employee (EmpId,EmpName,EmpDepId)
 VALUES(25,'باسل',329),
 (26,'عمر',326),
 (27,'عبد',324),
 (28,'فادي',325);

--lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
--select
select * from Departments
select * from Employee where Gender='f'
--اسم الموظف وتاريخ تعينه للموظفين الذكور
select EmpName as "الاسم الموظف",HireDate as "تاريخ التعين" from Employee where Gender ='M'
--بيانات الموظفين ذو الاعمار من 60 واكبر
select * from Employee where Gender='f' and Age>60
--اسم الموظف وراتبه وتارسخ تعينه للذكور اصحاب الراتب اعلى من 1500
select EmpName, Salary,HireDate from Employee where Gender='M' and Salary>1500
--اسماء الموظفين الذين بعملون في قسم اللوازم او قسم الارشاد
select EmpName from Employee where EmpDepId in (101,326)

--

select e1.EmpName,m1.EmpName from Employee e1,Employee m1 where e1.ManagerId=m1.EmpId

--#################################################################
--join
select EmpName, EmpDepId,DepId,DepName from Employee,Departments where EmpDepId=DepId;
--join
select EmpName ,ProjectName,WorkingHours where EmpProjects.EmpId =Employee.EmpId and EmpProjects.ProjectId=Projects.ProjectId
--###################
--تعديل بجيب كل الموضفين والقسم الموجود فيه كل موظف 

select EmpName,DepName
from Employee join Departments
on Employee.EmpDepId=Departments.DepId
--ممككن تحط شروط 
where Age>=50
and Gender='M'
--#####################


--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--join بتجيب اسماء الموظفين والقسم  اللي بيشتغلوا فيه مع الشروط
select EmpName,DepName from Employee left join Employee.EmpDepId=Departments.DepId where Age>=50 and Gender='M'

--اسماء الاقسام ما اسماء المدراء تع القسم 
--alter table Departments add column ManagerId integer references Employee(EmpId);
select EmpName,DepName from Departments left join Employee on Departments.ManagerId=Employee.EmpDepId;

--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


--التعديل على جميع بيانات الموظفين
update Employee set Salary=1500;

--تعديل بشرط 
update Employee set Salary=2000 where Gender='f' and Age>60;
--نقل  موظف الي قسم اخر  وتغير الراتب 
update Employee set EmpDepId=36113011 , Salary=1200 where EmpId=2068
--تعديل رواتب الموظفين في كل القسم 
update Employee set Salary=1800 where EmpDepId=2332423;
--زيادة 10% للموظفين اعمارهم فوق 50 عام
update Employee set Salary=Salary+.1*Salary where Age>50;

--الحذف 
delete from Employee where Age>60;
--تعديل تغير الموظفين الي داخل قسم الى قسم  اخر  عشان يزبط الحدق او بعمل
-- دليتيد كسكيت جنب الرفرنس  لما اعمل الجدول 
update Employee set EmpDepId=54533 where EmpDepId=345345;
delete from Departments where DepId =345345;



--##############################################################################################
--aggregation function:دوال تجميع 

--1- count (*|اسم العمود )بتحسم كم موظف عندك اكم من زبون عندك هيك 
--2-sum (اسم عمود )بتعمل تجميع للقيم الي بداخل العمود مع اهمال قيمة  الnull
--3-avg(اسم عمود)بتحسب متوسط او معدل 
--4-max(اسم العمود) بتعمل احتساب لاكبر قيمة داخل العمودد(بتجيب اعلى علامة مثلا )
--5-min(اسم االعمود)بتعمل احتساب لاقل قيمة داخل العمودد

Salary 
300
200
null
500
100

count (Salary)=4
count(*)=5
sum(Salary)=1100
avg (Salary)=275
max (Salary)=500
min (Salary)=100


--***********************
--اول شي بجيب الذكور الموظفين الي بشتغلو في قسم 2214 بعدين بنفذ دوال التجميع 
--عدد الموظفين الكلي وعدد الموظفين الي لهم راتب وعدد الموظفين اللي ما لهم راتب 
select count (*) as "EmployeeCont" ,count (Salary) as "EmployeeWithsalry",count(*)-count(Salary) as "EmployeeWithNoSalary"
from Employee 
where Gender='M';
and ManagerId=2214
--************************

--اسماء الادارات مع عدد الموظفين 
select DepName ,count(EmpName)
from Employee join Departments 
on EmpDepId=DepId

--بيانات الموظفين الذي لا يوجد له راتب 
select Employee from Employee where Salary is null

--بيانات الموظفين الذي  يوجد له راتب 
select Employee from Employee where Salary is not null

--عدد الموظفين الكلي وعدد الموظفين الي لهم راتب وعدد الموظفين اللي ما لهم راتب 
select count (*) as EmployeeCont ,count (Salary) as EmployeeWithsalry,count(*)-count(Salary) from Employee

--عدد الموظفين الكلي وعدد الموظفين الي لهم راتب وعدد الموظفين اللي ما لهم راتب للذكور
select count (*) as EmployeeCont ,count (Salary) as EmployeeWithsalry,count(*)-count(Salary) from Employee where Gender='M';

-- عدد الموظفين الكلي وعدد الموظفين الي لهم راتب وعدد الموظفين اللي ما لهم راتب للذكوريتبع للمدير
select count (*) as EmployeeCont ,count (Salary) as EmployeeWithsalry,count(*)-count(Salary) from Employee where Gender='M' and ManagerId=2214;


--اسماء الادارات  مع عدد الموضفين فيها 
--group byممنوع نستخدم دوال التجميع مع اسماء الاعمدة الا اذا وضعنا اسماء الاعمدة في ي
select DepName,count(EmpName)  
from Employee join Departments 
on EmpDepId=DepId group by DepName


--اسماء الادارات  مع عدد الموضفين فيها ورواتاتب الادارة
select DepName,count(EmpName),sum(Salary),max(Salary),min(Salary)  
from Employee join Departments 
on EmpDepId=DepId group by DepName

--اسماء الادارات  مع عدد الموضفين فيها للادارات التي  بها اكثر من 12 موظف
--having بنحط فيها شروط على مستوى التجميع
select DepName,count(EmpName),sum(Salary),max(Salary),min(Salary) 
 from Employee join Departments 
 on EmpDepId=DepId 
 where Gender='M' 
 group by DepName 
 having count(EmpName)>12 
 order by DepName
 




-- اسالة الاختبار*************************************

--الموظفات الاناث الاتي تتروح اعمارهن بين 30و 20
select * 
from Employee
where Gender='M'
and Age between 20 and 30
--الموظفين الذكور الذين  يبدأ  اسمهم بحرف م 
select *
from Employee
where Gender='M'
and EmpName like 'م%'

-- المشاريع المنتهية 
select*
from Projects 
where EndDate<=Current_Date

--اسم الموظف واسم القسم الذي يعمل فيه 
select DepName,EmpName 
from Employee join Departments 
on EmpDepId=DepId group by DepName
--اسماء الاقسام  وعدد العاملين في كل قسم 
select DepName ,count(EmpName)
from Employee join Departments
on EmpDepId=DepId
group by DepName

--تعديل رواتب الموظفين الذين تقل رواتبهم عن 100 بحيت تصبح 1200 
update Employee set Salary =1200 where Salary<100
--حذف بيانات الموظفين الذين تزيد اعمارهم عن 60 عام
DELETE from Employee where Age >60
 
--*****************************نهاية الاختبار

select EmpName,Salary
from Employee 
where Gender='M'
order by  Salary desc
limit 10 offset 30
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
 --المتقاعدين 
 --تعديل الجدول 
 alter table Employee add column  EmpStatus Boolean default 1

 update Employee 
 set EmpStatus =0
 where Age >=60
 



--تعديل 
update Employee 
set ManagerId=null
where ManagerId in (select EmpId from Employee_HIST)

--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

-- حساب عدد حروف
select length (EmpName),EmpName
from Employee
order by 1 desc
--*********************
select count(*)
from Employee
--*********************
select EmpName ,EmpId from Employee