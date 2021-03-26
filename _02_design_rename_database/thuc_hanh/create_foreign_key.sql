drop database if exists customers;
create database customers;
use customers;

create table customers(
	id int auto_increment primary key,
    `name` varchar(50),
    address varchar(255),
    email varchar(100)
);

create table orders(
	id int auto_increment primary key,
    staff varchar(50),
    customer_id int ,
    constraint fk_customer_id foreign key (customer_id) references customers(id)
);