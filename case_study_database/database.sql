
create database furama_resort;
use furama_resort;

create table positions(
	position_id int auto_increment primary key,
    position_name varchar(45) not null
);

create table employee_level(
	level_id int auto_increment primary key,
    level_name varchar(45) not null
);

create table departments(
	department_id int auto_increment primary key,
    department_name varchar(45) not null
);

create table customer_type(
	type_id int auto_increment primary key,
    customer_type_name varchar(45) not null
);

create table rent_type(
	rent_type_id int auto_increment primary key,
    rent_name varchar(45) not null
);

create table service_type(
	service_type_id int auto_increment primary key,
    service_type_name varchar(45) not null
);

create table accompanied_service(
	accompanied_service_id int auto_increment primary key,
    accompanied_service_name varchar(45) not null,
    price int not null,
    status_accompanied_service varchar(45) not null
);

create table employees(
	employee_id int auto_increment primary key,
    employee_name varchar(45) not null,
    employee_birthday date not null,
    employee_id_card varchar(45) not null,
    employee_salary float not null,
    employee_phone varchar(11) not null,
    employee_email varchar(45) not null,
    employee_address varchar(45) not null,
    position_id int,
    level_id int,
    department_id int,
    constraint fk_positions_employees foreign key(position_id) references positions(position_id) on delete cascade,
    constraint fk_level_employees foreign key(level_id) references employee_level(level_id) on delete cascade,
    constraint fk_departments_employees foreign key(department_id) references departments(department_id) on delete cascade
);

create table customers(
	customer_id int auto_increment primary key,
    customer_name varchar(45) not null,
    customer_birthday date not null,
    customer_id_card varchar(45) not null,
    customer_phone_number varchar(45) not null,
    customer_email varchar(45) not null,
    customer_address varchar(45) not null,
    type_id int,
    constraint fk_type_customers foreign key(type_id) references customer_type(type_id) on delete cascade
);

create table services(
	service_id int auto_increment primary key,
    service_name varchar(45) not null,
    service_area float not null,
    service_floor int not null ,
    max_of_people int not null,
    rent_cost float not null,
    status_of_service varchar(45) not null,
    rent_type_id int,
    service_type_id int,
    constraint fk_rent_type_service foreign key(rent_type_id)
		references rent_type(rent_type_id) on delete cascade,
    constraint fk_service_type_service foreign key(service_type_id)
		references service_type(service_type_id) on delete cascade
);

create table contracts(
	contract_id int auto_increment primary key,
    start_day date not null,
    end_day date not null,
    deposit float not null,
    employee_id int,
    customer_id int,
    service_id int,
    constraint fk_employees_contracts foreign key(employee_id) references employees(employee_id) on delete cascade,
    constraint fk_customers_contracts foreign key(customer_id) references customers(customer_id)on delete cascade ,
    constraint fk_services_contracts foreign key(service_id) references services(service_id)on delete cascade
);

create table contract_detail(
	contract_detail_id int not null,
    contract_id int,
    accompanied_service_id int,
    amounts int,
    primary key (contract_id,accompanied_service_id),
    constraint fk_contract_detail foreign key(contract_id) references contracts(contract_id)on delete cascade,
    constraint fk_accompanied_service_detail foreign key(accompanied_service_id) 
		references accompanied_service(accompanied_service_id) on delete cascade
);