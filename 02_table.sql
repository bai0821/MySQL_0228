-- table
-- create table
create table employee(
employee_id int,
employee_name varchar(50),
employee_age int,
employee_salary int,
employee_department varchar(30)
);

create table members(
member_id int,
member_name varchar(100),
member_gender varchar(20),
member_age int
);

-- error
show warnings;

-- how to find table settings
show columns from members;
describe members;
desc members;

-- drop table
drop table members;
drop table employee;

create table player_02(
player_id int,
player_name varchar(100),
player_age int,
player_salary int,
player_team varchar(100)
);

show columns from player_02;
drop table player_02;

-- insert data
-- 假如是文字型別請用引號''
insert	into members(member_id,member_name,member_gender,member_age)
values(1, 'Abigil', 'Female',15);

-- *=全部
select * from members;

-- muti insertion
insert into members(member_id,member_name,member_gender,member_age)
values
(2, 'Maria', 'Female', 21),
(3, 'Gregory', 'Male', 35),
(4, 'Scott', 'Male', 39),
(5, "O'Neal", 'Male', 25);

select * from members;

-- practice
insert into employee(employee_id,employee_name,employee_age,employee_salary,employee_department)
values
(1, 'Tim', 39, 100000, 'Sales'),
(2, 'Danny', 27, 33000, 'Accounting'),
(3, 'Wilson', 33, 42000, 'Administration'),
(4, 'Elizabath', 22, 29000, 'Accounting');

select * from employee;