create table if not exists Category
(
    CategoryId      integer     primary key     autoincrement,
    CategoryName    text        not null unique
);

create table if not exists Actor
(
    ActorId     integer     primary key     autoincrement,
    FirstName   text (200)  not null,
    LastName    text (200)  not null
); 

create table if not exists film
(
    FilmId     integer     primary key     autoincrement,
    Title      text        not null,
    Description text,
    ReleaseYear integer,
    Language    text       check(Language in ('English','Arabic')),
    Rate        float      check(Rate between 0 and 5),
    FilmLenfth  integer,
    CategoryId  integer references Category(CategoryId)
); 

create table if not exists FilmActors
(
    FilmActorsId    integer primary key autoincrement,
    FilmId  integer references film(FilmId),
    ActorId   integer references Actor(ActorId),

    unique (FilmId , ActorId)
); 

create table if not exists Store
(
    StoreId     integer primary key autoincrement,
    Location text   not null unique
);

create table if not exists Staff
(
    StaffId     integer primary key,
    FirstName   text(100)   not null,
    LastName    text(100)   not null,
    Email       text(200)   unique,
    Active      Boolean     default true,
    RegisterDate    Data    default Current_Date,
    StoreId     integer     references Store(StoreId)
);

alter table Store add column ManagerId integer references Staff(StaffId);

alter table Staff add column Picture Blob;

create table if not exists Customer 
(
    CustomerId  integer primary key autoincrement,
    FirstName   text(100)   not null,
    LastName    text(100)   not null,
    Email       text(200)   unique,
    Active      Boolean     default true,
    RegisterDate    Data    default Current_Date
);

create table if not exists Rental
(
    RentalId    integer     primary key autoincrement,
    RentalDate  Data        default Current_Date,
    RenturnDate Data        check(RenturnDate>=RentalDate),    
    Amount      float       check(Amount>0),
    CustomerId  integer     references Customer(CustomerId),
    FilmId      integer     references film (FilmId),    
    StoreId     integer     references Store (StoreId),
    StaffId     integer     references Staff (StaffId),

    unique (CustomerId ,FilmId,RentalDate)
    
);
   --insert
   insert into Staff VALUES (1,'Ashraf','Dahdouh',null,'Ashraf@gmail.com',1,true);

   insert into Staff (FirstName,LastName,StoreId)VALUES('Haitham','Taima',1);

   insert into Category VALUES(1,'Anime')

    insert into Actor VALUES (1,'Haitham','Hatem') 

    insert into film VALUES
    ('Mission Impossible', 'Action movie', 1996, 'English', 4.5, 120, 1)
    --كشف اسماء الزبائن الغير فعالين مع ايملاتهم
    select FirstName ,LastName ,Email from Customer where Active =false 

    -- رقم الفلم وعنوانه وتاريخ اصداره لأفلام الأكشن بلغتي الإنجليزية والاطالية
    select  FilmId,Title,ReleaseYear from film where CategoryId=1 and Language in ('Engelush','Italian');
    --join
    select  FilmId,Title,ReleaseYear from film join Category on film.CategoryId=Category.CategoryId where name ='Action' and Language in ('Engelush','Italian');
--**********************
--عرض اسماء الممثلين الذين لهم افلام تم اصدارها في سنة 2006 وتقيمها اكبر من 4 مؤتبين حسب الاسم 

    select distinct FirstName,LastName
    from film join FilmActors
    on film.FilmId-FilmActors.FilmId
    join Actor
    on Actor.ActorId=FilmActors.ActorId
    where film.ReleaseYear=2006
    and film.Rate>=4
    order by FirstName,LastName 
--بطريقة اسهل 
--عرض اسماء الممثلين الذين لهم افلام تم اصدارها في سنة 2006 وتقيمها اكبر من 4 مؤتبين حسب الاسم 
    select distinct FirstName,LastName
    from film ,Actor,FilmActors
    where FilmActors.FilmId = film.FilmId
    and FilmActors.ActorId=Actor.ActorId
    and film.ReleaseYear=2006
    and film.Rate>=4
    order by FirstName,LastName
--**********************

--عرض بيانات الفلام التي تحتوي في وصفها يحتوي على كلمة car
    select *
    from film 
    where Description like '%car%'

--قي العنوان تع الفلم Al اسماء الافلام التي تبداء بحرف 
    select *
    from film
    where Title like 'AL%'
--**********************
 --اظهر معدل  اكبر  - واقل تقدير لافلام الانمي    

    select avg(Rate),max(Rate),min(Rate)
    from film join Category
    --on film.CategoryId=Category.CategoryId
    --نستعمله عندما يكون المفتاح الاجنبي في الجادول 
    --مشابه للمفتاح الاساسي في الجدول الاخر
    using(CategoryId)
    where Category.name='Animation'
--**********************

--اعرض  معدل اكبر - اقل  عدد الافلام حسب التصنيف 
-- الدوال التجميعية لما تكون مع اعمدة بنحط قروب باي 
  select Category.name, avg(Rate),max(Rate),min(Rate),count(*)
    from film join Category
    using(CategoryId)
    group by Category.name
--**********************
--اعرض اسماءالزبائن الفعالين مرتبين حسب  احمالي مدفوعاتهم واعداد استاجارهم اهم للافلام بشرط ان اجمالي مدفوعاتهم  اكبر من 500
select Customer.FirstName,Customer.LastName,sum(Amount),count(RentalId)
from Customer join Rental
using(CustomerId)
where Amount>20
group by Customer.FirstName,Customer.LastName
having sum (Amount)>=500
order by sum (Amount) desc,count(RentalId)
--كشف بجميع اسماء الزبائن و العاملين في المحلات الفعالين مع عمود يبن نوعه
    




