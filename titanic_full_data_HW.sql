-- try full titanic data
create database if not exists my_titanic;
use my_titanic;

-- load data from CSV

CREATE TABLE IF NOT EXISTS full_passengers(
  id INT(11), 
  pclass DECIMAL(10, 2), 
  survived DECIMAL(10, 2), 
  pname VARCHAR(100), 
  sex VARCHAR(50), 
  age INT(11),
  sibsp INT(11), 
  parch INT(11),
  ticket VARCHAR(100),
  fare DECIMAL(10, 2),
  cabin VARCHAR(50), 
  embarked VARCHAR(50),
  boat VARCHAR(50),
  body INT(11),
  homedest varchar(100)
 );
# drop table full_passengers;

LOAD DATA
INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/titanic_full_data.csv'
INTO TABLE full_passengers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(id, pclass, survived, pname, sex, @age, sibsp, parch, ticket, @fare, cabin, embarked, boat, @body, homedest)
SET age = NULLIF(@age,''), fare = nullif(@fare, ''), body = nullif(@body, '');

select * from full_passengers limit 1350;

-- 1.	查詢各性別乘客的總人數，請顯示在sex與gender_counts這兩個欄位
select sex,count(sex) gender_counts from full_passengers group by sex;

-- 2.	查詢第591至第883名乘客的id與姓名資料
select id 乘客id,pname 乘客姓名 from full_passengers where id between 591 and 883; 

-- 3.	請找出所有的Anders & Alfrida Andersson家成員以及存活狀態
-- <<提示一>>共7人
-- <<提示二>>同一家人會一起上下船
select pname,survived from full_passengers where pname like "Andersson, %" and homedest = "Sweden Winnipeg, MN";

-- 4.	承上題，已知Alfrida還有一個已婚的妹妹叫做Anna，請找出Anna與其丈夫小孩一家三口的全部資料
-- <<提示一>>已結婚的女性姓名欄中仍會註記娘家姓氏
-- <<提示二>>觀察一家人可能會有的資料特徵
select * from full_passengers where ticket = (select ticket from full_passengers where pname like "%Brogren%" and pname like "%anna%");


-- 5.	找出所有名字是Leonard的男性乘客，顯示id, pclass, pname
-- <<提示>>共7位，不是8位
select id,pclass,pname from full_passengers where pname like "% leonard%" and sex = "male";

-- 6.	查詢所有乘客持有的票券中，最多人持有的那一種ticket，回傳票券名稱(ticket)與持有人數(ticket_count)兩個欄位
-- <<提示>>共11人持有
select * from full_passengers;
select ticket,count(ticket) ticket_count from full_passengers group by ticket order by ticket_count desc;

-- 7.	分開列出二等客艙以及三等客艙中所有男性乘客的平均年齡
-- <<提示>>小心邏輯運算子的使用
select pclass, sex,avg(age) from full_passengers where pclass != 1 and sex = "male" group by pclass;

-- 8.	列出所有登船點的登船人數與百分比，僅列出有明確登船地點的資料即可
-- <<提示一>>3列3欄，3欄位名稱分別為登船點、登船人數、登船點佔百分比
-- <<提示二>>select round(3.14159, 2);
select embarked 登船點,count(pname) 登船人數 ,round(count(embarked) / 1309*100, 2)from full_passengers where embarked != "" group by embarked ; 








