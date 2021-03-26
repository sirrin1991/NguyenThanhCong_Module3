drop database if exists contacts;

create database contacts;

use contacts;

create table contacts (
	contact_id int(11) auto_increment,
    last_name varchar(30) not null,
    first_name varchar(30),
    birth_day date,
    constraint contacts_pk primary key (contact_id)
);


select *
from contacts;

create table suppliers (
	supplier_id int(11) not null auto_increment,
    supplier_name varchar(30) not null,
    account_rep varchar(30) not null default 'TBD',
    constraint supplier_pk primary key (supplier_id)
);

alter table contacts
	add contact_phone int(10) not null default '0909090909'
    after birth_day;
    
alter table suppliers
	modify supplier_name varchar(50) not null
