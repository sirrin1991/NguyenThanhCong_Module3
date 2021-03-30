drop database if exists students;
create database students;
use students;

create table students(
	id int primary key,
    `name` varchar(10),
    age int ,
    course varchar(10),
    price float
);

insert into students
values 
	(1,'Hoang',21,'CNTT',400000),
	(2,'Viet',19,'DTVT',320000),
	(3,'Thanh',18,'KTDN',400000),
	(4,'Nhan',19,'CK',450000),
	(5,'Huong',20,'TCNH',500000),
	(6,'Huong',20,'TCNH',200000);
    
select *
from students
where `name` = 'Hương';

select `name`, sum(price) as total_price
from students
where `name`='Huong';

select * 
from students
group by `name`