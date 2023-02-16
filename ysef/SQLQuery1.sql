create database supermarket collate arabic_100_ci_as;
go
use  supermarket	
go
create table customer(
customer_id			int		primary key identity (1,1),
customer_F_name		varchar(20)		not null,
customer_L_name		varchar(20)		not null,
customer_Email		nvarchar(50)	unique
);

create table customer_phone(
customer_id			int	 references customer(customer_id),
customer_phone		char(10) ,
primary key (customer_id,customer_phone)
);

create table product(
product_id			int		primary key,
product_name		varchar(50)		not null,
market_price		smallint		not null
);

create table product_categories(
category_id			int		primary key,
category_name		varchar(50)		not null
);

alter table product add  category_id int references product_categories(category_id);

create table sales(
sales_id			int		primary key,
sales_date			datetime2 default getdate(),
sales_discount		smallint
);

alter table customer add sales_id int references sales(sales_id);

create table included(
product_id	int references		product_categories(category_id),
sales_id	int references		sales (sales_id),
unit_price	smallint	not null,
quantity	smallint	not null
primary key (product_id,sales_id)
);

create table Employee(
Employee_id			int		primary key,
Employee_F_name		varchar(20)		not null,
Employee_L_name		varchar(20)		not null,
hire_date			date			default getdate(),
contract_tybe		varchar(20)		check (contract_tybe in ('fixed','Hourly')),
gender				char			check (gender in ('M','F'))
);

create table hourly_Employee(
Employee_id			int references Employee (Employee_id),
working_hours		decimal (3,1)		check (working_hours between 10 and 300),
salary_hours		decimal (2,1)		check (salary_hours between 10 and 50),
primary key (Employee_id)
);

create table fixed_Employee(
Employee_id			int references Employee (Employee_id),
salary_month		decimal (4,1)		check (salary_month between 1000 and 5000),
primary key (Employee_id)
);

alter table sales add Employee_id int references Employee (Employee_id);