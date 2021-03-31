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
DELIMITER //

CREATE PROCEDURE find_all_product()

BEGIN

  SELECT * FROM product;

END //

DELIMITER ;

call find_all_product();


DELIMITER //

CREATE PROCEDURE add_new_product( product_code varchar(20), product_name varchar(20),  product_price float, product_amounts int, product_description text, product_status varchar(10))

BEGIN
	insert into product(`code`,`name`,price,amounts,`description`,`status`)
	values ( product_code,product_name,product_price,product_amounts,product_description,product_status);
END; //

DELIMITER ;

call add_new_product('P005','Black Shark','13000000','30','Black','FUll Box');

select * from product;

DELIMITER //

CREATE PROCEDURE edit_product_by_id( product_id int,product_code varchar(20), product_name varchar(20),  product_price float, product_amounts int, product_description text, product_status varchar(10))

BEGIN
	update product
    set `name` = product_name, 
		`code` = product_code,
        price = product_price,
        amounts = product_amounts,
        `description` = product_description,
        `status` = product_status
	where product.id = product_id;
END; //

DELIMITER ;

call edit_product_by_id(1,'P001','IphoneXS MAX','30000000','50','Pink','Full Box');

select * from product;

DELIMITER //

CREATE PROCEDURE delete_product_by_id( product_id int)

BEGIN
	delete from product where product.id = product_id;
END; //

DELIMITER ;

call delete_product_by_id(2);

select * from product;