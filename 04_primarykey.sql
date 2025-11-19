create table cars_05(
car_id int primary key,
car_brand varchar(50),
car_color varchar(50),
car_sale_price int
);

desc cars_05;

insert into cars_05(car_id, car_brand, car_color,car_sale_price)
values(1,"Luxgen","pink", 140000);

desc cars_05;

insert into cars_05(car_id, car_brand, car_color,car_sale_price)
values(1,"Luxgen","pink", 140000);

show warnings;
-- Duplicate entry '1' for key 'cars_05.PRIMARY'

insert into cars_05(car_id, car_brand, car_color,car_sale_price)
values(2,"Luxgen","purple", 120000);

select * from cars_05;

create table cars_06(
car_id int primary key auto_increment,
car_brand varchar(50),
car_color varchar(50),
car_sale_price int
);

desc cars_06;

insert into cars_06(car_brand, car_color, car_sale_price)
values("Luxgen","yellow",120000);

select * from cars_06;

-- auto increment customized
create table cars_07(
car_id int primary key auto_increment,
car_brand varchar(50),
car_color varchar(50),
car_sale_price int
);

alter table cars_07 auto_increment = 101;

insert into cars_07(car_brand, car_color, car_sale_price)
values("Luxgen","brown",120000);

select * from cars_07;

-- unique key
create table user_account(
user_id int primary key auto_increment,
user_name varchar(100) not null unique,
user_password varchar(100) not null
);

desc user_account;

#1
insert into user_account(user_name, user_password)
values("iLoveLuxgen", "5566");

select * from user_account;

#2
insert into user_account(user_name, user_password)
values("iLoveLuxgen", "5566");

show warnings;
-- Duplicate entry 'iLoveLuxgen' for key 'user_account.user_name'

#3
insert into user_account(user_name, user_password)
values("ihateLuxgen", "5566");

select * from user_account;
