-- null & default
use my_database;

desc employee;

insert into employee(employee_id, employee_name)
value(56, "阿明");

select * from employee;

-- cars
create table cars(
car_brand varchar(50) not null,
car_color varchar(50) not null,
car_sale_price int
);

desc cars;

insert into cars(car_brand, car_sale_price)
values("Luxgen",200000);

show warnings;
-- Field 'car_color' doesn't have a default value

select * from cars;

insert into cars(car_brand, car_color, car_sale_price)
values
("Luxgen", "white", 180000),
("Luxgen", "green", null);

select * from cars;

create table cars_02(
car_brand varchar(50) not null default "窩不知道",
car_color varchar(50) not null default "unknown",
car_sale_price int default 50000
);

desc cars_02;

insert into cars_02()
values();

desc cars_02;

insert into cars_02(car_color)
values("blcak");

select * from cars_02;

-- null with default
create table cars_03(
car_brand varchar(50) default "窩不知道",
car_color varchar(50) default "unknown",
car_sale_price int default 50000
);

desc cars_03;

insert into cars_03(car_brand, car_color, car_sale_price)
values(null,"balck",null);

insert into cars_03(car_color)
values("black");

select * from cars_03;

-- practice
create table cars_04(
car_brand varchar(50) default "unknown",
car_color varchar(50) default "black",
car_sale_price int default 50000
);

insert into cars_04(car_brand, car_color, car_sale_price)
values
(null,default,null),
(default, default, default),
("Toyota",null,default),
("Honda",null,default);

select * from cars_04;