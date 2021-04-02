
	-- service_id int auto_increment primary key,
--     service_name varchar(45) not null,
--     service_area float not null,
--     service_floor int not null ,
--     max_of_people int not null,
--     rent_cost float not null,
--     status_of_service varchar(45) not null,
--     rent_type_id int,
--     service_type_id int,
insert into services(service_name,service_area,service_floor,max_of_people,rent_cost,status_of_service,rent_type_id,service_type_id)
values ('Rose',500,4,10,500,'Sun rise view',1,1),
		('Violet',400,3,8,400,'Sun rise view',3,2),
		('Boss',300,2,6,300,'Sun set view',4,3);
        
