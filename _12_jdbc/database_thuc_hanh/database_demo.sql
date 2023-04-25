create database test;
use test;

create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 `name` varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 address varchar(120),
 PRIMARY KEY (id)
);

create table permission (
 id int auto_increment primary key,
 `name` varchar(45)
);
-- drop table users;
-- drop table permision;

create table user_permission (
	user_id int,
    permission_id int,
    primary key(user_id,permission_id),
    foreign key(user_id) references users(id) ,
    foreign key(permission_id) references permission(id)

);

insert into users (`name`,email,address)
values ('Thanh Cong','sirrin1991@gmail.com','Thanh Hai'),
		('Quang Kha','quangkha@gmail.com','Ngo Thi Nham'),
		('Thanh Tai','thanhtai@gmail.com','Nguyen Tat Thanh'),
		('Duc Hau','hau@gmail.com','Cau Do');

insert into permission (`name`)
values  ('add'),
		('edit'),
		('delete'),
		('view');
        


select * from permission;
select * from user_permission;

DELIMITER //
create procedure find_all()
begin
select *
from users;
end;
// DELIMITER ;

call find_all();

DELIMITER //
create procedure delete_user(id int)
begin
delete from users
where users.id = id;
end;
// DELIMITER ;

call delete_user(4);
truncate table user_permission;

DELIMITER //
create procedure edit_user( id int, new_name varchar(45), new_email varchar(45), new_address varchar(45))
begin
update users
set `name` = new_name,
	email = new_email,
    address = new_address
where users.id = id;
end ;
// DELIMITER ;

call edit_user(4,'Thanh Tam','tam@gmail.com','Hoa Khanh');




DELIMITER //
create procedure get_user_by_id( id int)
begin
select *
from users u
where u.id = id;
end ;
// DELIMITER ;

DELIMITER //
create procedure insert_user(new_name varchar(45),new_email varchar(45), new_address varchar(45) )
begin
insert into users (`name`,email,address)
values (new_name,new_email,new_address);
end ;
// DELIMITER ;
