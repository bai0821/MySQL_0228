-- order by 五年內慢慢消失
select * from passengers;
select * from passengers order by name;

select * from passengers order by age;
select * from passengers order by age desc;

-- p123practice
-- select * from passengers;

-- select * from passengers order by portid is null asc;

select * from passengers order by -portid desc;


