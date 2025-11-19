-- Distinct
select * from passengers;

select pclass from passengers;
select distinct pclass from passengers;

select distinct portid from passengers;
select distinct cabin from passengers order by cabin;

select count(distinct pclass) class_count from passengers;

-- count distinct portid
select count(distinct portid) class_count from passengers;

select * from tickets;
select count(distinct fare) from tickets;

-- double distinct
select distinct pclass, sex from passengers;

select count(distinct pclass, sex) from passengers;
select count(distinct pclass, sex, portid) from passengers;
select count(distinct pclass, sex, portid, survived) from passengers;