-- like
use my_train_titanic;
select * from passengers;

-- where 嚴格
select * from passengers where name = "Braund";
select * from passengers where name = "Braund, Mr. Owen Harris";


-- like 鬆散
select * from passengers where name like "%william%";
select * from passengers where name like "william%";
select * from passengers where name like "%william";

-- find william
select * from passengers where name like "% william %";
select * from passengers where name like "% william %" and sex = "male";


-- p133 practice
select * from passengers where name like "williams,%";

-- find smith
select * from passengers where name like "%smith%";
select * from passengers where name like "smith,%";

select * from passengers where name like '%)';
select * from passengers where name like "%)%";

select * from passengers where name like "%williams%" and name like "%charles%";

select * from passengers where ticketid like "_";
select * from passengers where ticketId like "__";
select * from passengers where ticketId like "___";

-- p135 practice
select * from passengers where ticketId like "__" and name like "% william %" and sex like "male";

