create database demo;
use demo;

create table product(
	id int auto_increment primary key,
    `code` varchar(20),
    `name` varchar(20),
    price float,
    amounts int,
    `description` text,
    `status` varchar(10)
);

insert into product(`code`,`name`,price,amounts,`description`,`status`)
values ('P001','IphoneXS Max','25000000','20','black','new'),
		('P002','Iphone 8Plus','15000000','20','white','new'),
		('P003','Iphone 8','8000000','20','black','new'),
		('P004','Iphone 7Plus','5000000','20','white','old');
        
 explain select `code`
from product;

alter table product add unique idx_code (`code`);

drop index idx_code on product;
-- ------------------------- 

create view view_product as
select `code`,`name`,price,`status`
from product;

select * from view_product;

create or replace view view_product as
select `code`,`name`,price,`status`,`description`
from product;

drop view view_product;


-- ____________________________--

