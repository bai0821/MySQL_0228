create table player(
player_id int not null primary key auto_increment,
player_name varchar(50),
player_position varchar(50),
player_age int
);

insert into player(player_name, player_position, player_age)
values
('Bobby', 'INF', 23),
('Luis', 'P', 30),
('Jonah', 'C', 28),
('Framber', 'P', 30),
('Pete', 'P', 27),
('Matt', 'INF', 29),
('Corbin', 'OF', 23),
('Juan', 'OF', 28);

-- select
select * from player;

-- partial select
select player_name from player;
select player_id, player_name from player;

-- where clause
select * from player where player_age = 23;

-- >, <, =
select * from player where player_age > 28;
select * from player where player_age >= 28;

select * from player where player_age < 28;
select * from player where player_age <= 28;

--
select * from player where player_name = "Corbin";
select * from player where player_name = "corbin";
#case insensitive

-- double where
select * from player where player_position = "p";
select * from player where player_position = "p" and player_age < 28;

--
select * from player where player_age >= 27;
select * from player where player_age <= 29;
select * from player where player_position = "p";

select * from player where player_age between 27 and 29 and player_position = "p";

-- aliases
select player_name,player_position,player_age from player;

select player_name as 球員姓名,player_position as 球員守位,player_age as 球員年齡 from player;

select player_name as "球員 姓名",player_position as "球員 守位",player_age as "球員 年齡" from player;

-- as select
select player_name 球員姓名,player_position 球員守位,player_age 球員年齡 from player;

-- update
select * from player;
select * from player where player_position = "p";
update player set player_position = "Pitcher" where player_position = "p";

select * from player;

select * from player where player_name = "Pete";
update player set player_position = "OF" where player_name = "Pete";
select * from player;