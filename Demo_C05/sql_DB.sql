Create database demo_wt;
use demo_wt;

create table person(
 id int auto_increment primary key,
 `name` varchar(255),
 address varchar(255),
 email varchar(255),
 `status` bit
);
create table tien(
id int auto_increment primary key,
`name` varchar(255)
)
select * from person where `name` regexp '[T][a-z]*$';
insert into person(`name`,address,email,status)
value ('Công','Đà Nẵng','sirrin1991@gmail.com',1);
    
select * from person where `status` = 1 AND ( `name` like '%C%' or address like '%n%');
update person
set `name` = 'Đặng Thị Thủy Tiên', email='thuytiendang2003@gmail.com', address ='194 Vũ Miên'
where id = 2;
    
