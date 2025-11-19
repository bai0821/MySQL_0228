-- Limit & Offset
select * from passengers limit 10;
select * from passengers limit 100;
select * from passengers limit 890;

select * from passengers limit 1000;

-- limit 跳過num, 數num
select * from passengers limit 10,2;
select * from passengers limit 5,20;

-- offset
select * from passengers limit 20 offset 5;

--
select * from passengers limit 0,10;
select * from passengers limit 10,10;
select * from passengers limit 20,10;

-- p126 practice
select * from passengers order by portid limit 2,15;
select * from passengers order by -portid desc limit 15;






