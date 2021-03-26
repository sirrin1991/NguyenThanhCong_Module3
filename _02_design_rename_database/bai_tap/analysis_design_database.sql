drop database if exists carstore;
create database carstore;
use carstore;


create table offices(
	office_code varchar(10) primary key,
    city varchar(50) not null,
    address1 varchar(50) not null,
    address2 varchar(50),
    state varchar(50),
    phone int not null,
    `national` varchar(20) not null,
    postal_code varchar(15) not null
);

create table employees(
	employee_code int primary key,
    last_name varchar(50) not null,
    first_name varchar(50) not null,
    email varchar(50) not null,
    job varchar(20) not null,
    office_code varchar(10),
    report_to int,
    constraint fk_employees foreign key(report_to) references employees(employee_code),
    constraint fk_offices_employees foreign key(office_code) references offices(office_code)
);

create table customers(
	customer_number int primary key,
    customer_name varchar(50) not null,
    contact_last_name varchar(50) not null,
    contact_first_name varchar(50) not null,
    customer_phone int,
    customer_address_line1 varchar(50) not null,
    customer_address_line2 varchar(50),
    city varchar(50) not null,
    state varchar(50) not null,
    postal_code varchar(15) not null,
    country varchar(50) not null,
    credit_limit double not null,
    employee_code int,
    constraint fk_employees_customers foreign key(employee_code)
		references employees(employee_code)
);

create table products(
	product_code varchar(15) primary key,
    product_name varchar(70) not null,
    product_scale varchar(10) not null,
    product_factory varchar(50) not null,
    product_description text not null,
    quantity_in_stock int not null,
    import_price double not null,
    sell_price double not null
);

create table products_type(
	product_type_code varchar(50) primary key,
    description_product_type text,
    image blob,
    product_code varchar(15),
    constraint fk_products_products_type 
		foreign key(product_code) references products(product_code)
);



create table orders(
	order_number int primary key,
	order_day date not null,
    date_of_requirement date not null,
    date_of_ship date,
    status_order varchar(15) not null,
    comment_of_order text,
    quantity_ordered int not null,
    price_each_order double not null,
    customer_number int,
    constraint fk_customers_orders 
		foreign key(customer_number) references customers(customer_number)
);

create table payments(
	customer_number int ,
	payment_code varchar(50) primary key,
    date_of_payment date not null,
    price double not null,
    constraint fk_customers_payments 
		foreign key(customer_number) references customers(customer_number)
);


create table products_in_orders(
	product_code varchar(15),
    order_number int,
    primary key(product_code,order_number),
    constraint fk_product_order foreign key(product_code) references products(product_code),
    constraint fk_order_product foreign key(order_number) references orders(order_number)
);