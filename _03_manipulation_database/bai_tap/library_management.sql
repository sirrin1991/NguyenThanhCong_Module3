create database library;
use library;

create table books(
	`code` varchar(15) primary key,
    `name` varchar(45) not null,
    publisher varchar(45) not null,
    author varchar(45) not null,
    year_of_publisher char(4) not null,
	amounts int not null,
    price float not null,
    image blob 
);

create table categorys(
	id int primary key,
    `name` varchar(45) not null,
    `code` varchar(15),
    constraint fk_books foreign key(`code`) references books(`code`)
);

create table students(
	`code` varchar(15) primary key,
    `name` varchar(45) not null,
    day_of_birth date not null,
    address varchar(45) not null,
    email varchar(45) not null,
    phone int not null,
    image blob not null
);

create table borrow_order(
	id int not null,
    student_code varchar(15),
    book_code varchar(15),
    primary key(student_code,book_code),
    constraint fk_student foreign key(student_code) references students(`code`),
    constraint fk_book foreign key(book_code) references books(`code`)
);