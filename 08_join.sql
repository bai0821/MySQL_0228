use my_database;

create table ports(
id int(10),
embarked varchar(5),
city varchar(20),
primary key(id)
);

create table class(
id int(10),
class_number int(5),
class_level varchar(20),
primary key(id)
);

create table passengers(
id int(10), 
pclass int(10), 
pname varchar(100), 
sex varchar(6), 
age int(10), 
portId int(10),
foreign key(portId) references ports(id),
foreign key(pclass) references class(id)
);

INSERT INTO ports(id, embarked, city) VALUES (1, 'S', 'Southampton');
INSERT INTO ports(id, embarked, city) VALUES (2, 'C', 'Cherbourg');
INSERT INTO ports(id, embarked, city) VALUES (3, 'Q', 'Queenstown');

INSERT INTO class(id, class_number, class_level) VALUES (1, 1, 'First Class');
INSERT INTO class(id, class_number, class_level) VALUES (2, 2, 'Second Class');
INSERT INTO class(id, class_number, class_level) VALUES (3, 3, 'Third Class');

INSERT INTO passengers(id, pclass, pname, sex, age, portId) VALUES (1, 3, 'Braund, Mr. Owen Harris', 'male', 22, 1);
INSERT INTO passengers(id, pclass, pname, sex, age, portId) VALUES (2, 1, 'Cumings, Mrs. John Bradley (Florence Briggs Thayer)', 'female', 38, 2);
INSERT INTO passengers(id, pclass, pname, sex, age, portId) VALUES (3, 3, 'Heikkinen, Miss. Laina', 'female', 26, 1);
INSERT INTO passengers(id, pclass, pname, sex, age, portId) VALUES (4, 1, 'Futrelle, Mrs. Jacques Heath (Lily May Peel)', 'female', 35, 1);
INSERT INTO passengers(id, pclass, pname, sex, age, portId) VALUES (5, 3, 'Allen, Mr. William Henry', 'male', 35, 1);
INSERT INTO passengers(id, pclass, pname, sex, age, portId) VALUES (6, 3, 'Moran, Mr. James', 'male', NULL, 3);
INSERT INTO passengers(id, pclass, pname, sex, age, portId) VALUES (7, 1, 'McCarthy, Mr. Timothy J', 'male', 54, 1);
INSERT INTO passengers(id, pclass, pname, sex, age, portId) VALUES (8, 3, 'Palsson, Master. Gosta Leonard', 'male', 2, 1);
INSERT INTO passengers(id, pclass, pname, sex, age, portId) VALUES (9, 3, 'Johnson, Mrs. Oscar W (Elisabeth Vilhelmina Berg)', 'female', 27, 1);
INSERT INTO passengers(id, pclass, pname, sex, age, portId) VALUES (10, 2, 'Nasser, Mrs. Nicholas (Adele Achem)', 'female', 14, 2);

select * from passengers;

select * from class;

select * from ports;


-- inner join
select * 
from passengers 
join ports 
on portid = id;

show warnings;
-- Error	1052	Column 'id' in on clause is ambiguous

select * 
from passengers 
join ports 
on portid = ports.id;

-- meaningless join
select * 
from passengers 
join ports 
on portid = passengers.id;

-- switch table order
select * 
from ports
join passengers
on portid = ports.id;

-- join with correct columns
select pname, city
from passengers 
join ports 
on portid = ports.id;

-- with ambiguous columns
select id, pname, city
from passengers 
join ports 
on portid = ports.id;

show warnings;
-- Error	1052	Column 'id' in field list is ambiguous

-- solved
select passengers.id, pname, city
from passengers 
join ports 
on portid = ports.id;

-- start with aliases
select passengers.id, pname, portid, ports.id, city
from passengers 
join ports 
on passengers.portid = ports.id;

-- join with ailases
select pa.id as 乘客編號, pname, portid, po.id as 碼頭編號, city
from passengers as pa
join ports as po
on pa.portid = po.id;

-- skip 'as'
select pa.id 乘客編號, pname, portid, po.id 碼頭編號, city
from passengers pa
join ports po
on pa.portid = po.id;

-- p108 practice
select pname 乘客姓名, class_level 船艙等級 from passengers as pa join class on pclass = class.id;

-- join with null
select * from passengers;

insert into passengers(id, pclass, pname, sex, age, portid)
values(11, 2, 'Nancy Alomar', 'female', 54, null);

select * from passengers;

-- try inner join
select *
from passengers
join ports
on portid = ports.id;

-- try left join
select *
from passengers
left join ports
on portid = ports.id;

-- right join
insert into ports(id, embarked, city)
values(4, null, 'Liverpool');

select * from ports;

select *
from passengers
right join ports
on portid = ports.id;

-- switch table order in left or right join
select *
from ports
left join passengers
on portid = ports.id;

-- full outer join
select *
from passengers
full join ports
on portid = ports.id;
#inner join

-- union
select *
from passengers
left join ports
on portid = ports.id
union
select *
from passengers
right join ports
on portid = ports.id;

-- join with where
select pname, sex, city
from passengers
join ports
on portid = ports.id
where sex = 'female';

-- p109 practice
select pname , class_level from passengers join class on pclass = class.id where class_level = "Second Class" or class_level = "Third Class";

-- Three Table Join
create table teams(
id int not null primary key auto_increment,
team_name varchar(50),
team_nickname varchar(50)
);

create table result(
id int not null primary key auto_increment,
result_name varchar(50),
result_description varchar(100)
);

create table matches(
fk_result_id int,
fk_team_id int,
foreign key (fk_result_id) references result(id),
foreign key (fk_team_id) references teams(id)
);

insert into teams(team_name, team_nickname)
values
('Brother Elephants', '爪爪'),
('Rakuten Monkeys', '吱吱'),
('Uni Lions', '喵喵'),
('Fubon Guardians', '邦邦'),
('WeiChuan Dragons', '油龍');

insert into result(result_name, result_description)
values
('贏球', '得分比對方多'),
('輸球', '得分比對方少'),
('平手', '雙方得分一樣多');

insert into matches(fk_result_id, fk_team_id)
values
(1, 2),
(1, 3),
(1, 5),
(1, 4),
(2, 1),
(2, 2),
(2, 4),
(2, 5),
(3, 1),
(3, 3);

-- check table
#1
select * from teams;
select * from result;
select * from matches;

select team_nickname, result_name from teams join matches on id  = fk_team_id
join result on fk_result_id = result.id;

#2
select * from teams;
select * from result;
select * from matches;

select team_nickname, result_name from teams join matches on id  = fk_team_id
join result on fk_result_id = result.id order by teams.id;

select * from teams join matches on id  = fk_team_id
join result on fk_result_id = reult.id;