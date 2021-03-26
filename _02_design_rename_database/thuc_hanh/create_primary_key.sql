drop database if exists users;
create database users;
use users;

create table users(
	user_id int auto_increment primary key,
    user_name varchar(50),
    user_password varchar(32),
    email varchar(50)
);

create table roles(
	role_id int auto_increment,
    role_name varchar(50),
    primary key(role_id)
);

create table usersrole(
	user_id int not null,
    role_id int not null,
    primary key(user_id,role_id),
    foreign key (user_id) references users(user_id),
    foreign key (role_id) references roles(role_id)
);

insert into users(users.user_name, users.user_password,users.email)
	values ('Nguyen Thanh Cong','123123','sirrin1991@gmail.com');

insert into roles(role_name)
	values ('jungle');

select *
from roles;

select *
from usersrole;