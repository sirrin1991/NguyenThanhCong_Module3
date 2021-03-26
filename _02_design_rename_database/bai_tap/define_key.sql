drop database if exists bank;
create database bank;
use bank;

create table customers(
	customer_number varchar(20) primary key,
    fullname varchar(50) not null,
    address varchar(255) not null,
    email varchar(50) not null,
    phone varchar(15) not null
);

create table accounts(
	account_number varchar(20) primary key,
    account_type varchar(50) not null,
    date_of_resign date not null,
    balance double not null,
    customer_number varchar(20),
    foreign key (customer_number) references customers(customer_number)
);

create table transactions(
	tran_number int(50) primary key,
    account_number varchar(20) not null,
    date_of_tran datetime not null,
    amounts double not null,
    descriptions text,
    constraint fk_account_number 
		foreign key(account_number) references accounts(account_number)
);
