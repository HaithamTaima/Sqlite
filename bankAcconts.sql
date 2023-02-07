create table Customer
(
    customer_id     integer primary key ON UPDATE CASCADE ,
    customer_name   text  not null unique,
    customer_address text  
);
create table Accounts
(
    account_id integer primary key,
    account_type text not null,
    balance integer,
    customer_id integer references Customer (customer_id) ON DELETE CASCADE 
);

insert into Customer VALUES (1,'Ali','Gaza')
insert into Customer VALUES (2,'omar','Rafah')

insert into Accounts VALUES (1002,'saving',2500,2)
insert into Accounts VALUES (1001,'saving',2800,1)
--
DELETE FROM Accounts WHERE account_id=1001;
