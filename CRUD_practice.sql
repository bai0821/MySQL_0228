-- CRUD practice
create table grocery(
grocery_id int primary key auto_increment,
grocery_name varchar(50),
grocery_category varchar(50),
grocery_reserves int
);

insert into grocery(grocery_name, grocery_category, grocery_reserves)
values
('Beef', 'Meat', 13),
('Milk', 'Dairy', 15),
('Spinach', 'Vegetables', 20),
('Cheese', 'Dairy', 5),
('Pork', 'Meat', 8),
('Beer', 'Beverage', 60),
('Cabbage', 'Vegetables', 21),
('Lamb', 'Meat', 16);

select * from grocery;

select grocery_id, grocery_name from grocery where grocery_id between 3 and 7;

select grocery_id, grocery_name, grocery_category from grocery where grocery_category = "meat";


-- update practice
select * from player;
update player set player_age = 26 where player_name = "bobby";
select player_name,player_age from player where player_name = "bobby";

update player set player_name = "Jonathan" where player_name = "Jonah";
select player_name,player_age from player where player_name = "Jonathan" or player_name = "bobby";

-- delete
select * from player where player_name = "jonathan";
delete from player where player_name = "jonathan";
select * from player;

-- alter table setting
#rename table
select * from employee;
alter table employee rename 員工;
select * from 員工;

#rename column name
select * from 員工;

alter table 員工 change column employee_salary 員工薪資 int;
