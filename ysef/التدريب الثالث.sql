--1
select *
from Schools;

--2
Select FANAME ||' '|| LANAME , AVG
from Students;

--3
Select *
from Students
where Avg between 50 and 60;

--4
select *
from Students
where Avg >= 50
order by AVG DESC , FANAME ASC;

--5
Select * 
from Students join Schools
on Students.School_Id = Schools.School_Id
where school_name = 'أسامة بن زيد الثانوية للبنين' and AVG >70;

--6
select count(*) , avg (avg) , max (avg)
from Students;

--7
select SCHOOL_NAME , count (*)
from Students join Schools
on Students.School_Id = Schools.School_Id
group by SCHOOL_NAME;

--8
select FANAME||' '|| LANAME , BRANCH_NAME
from Students join Branches
on Students.BRANCH_ID = Branches.BRANCH_ID ;

--9
select *
From Students
where LANAME like ('ع%');

--10
select FANAME , LANAME , SCHOOL_NAME
from Students join Schools
on Students.School_Id = Schools.School_Id;

--11
select * , max (avg)
from Students;

--12
select BRANCH_NAME, count(Students.FANAME) as total ,AVG(AVG) as s_av
from Branches join Students 
on Branches.BRANCH_ID = Students.BRANCH_ID
where GENDER = 'ذكر' 
group by BRANCH_NAME
order by avg desc

--13 
select BRANCH_NAME, count(Students.FANAME) as total ,AVG(AVG) as s_av
from Branches join Students 
on Branches.BRANCH_ID = Students.BRANCH_ID
where GENDER = 'ذكر' and total > 200 
group by BRANCH_NAME
order by avg desc

--14 
delete from Students where avg < 50;

-- 15
update Students
    set avg = avg+(0.1*avg)
where GENDER = 'ذكر';

--16
insert into Schools(SCHOOL_ID, SCHOOL_NAME, Admin_Name) 
values (31114304 , 'شادية بو غزالة', 'وشمال غزة');

--17
insert into Branches
values (12 , 'الشرعيي');


