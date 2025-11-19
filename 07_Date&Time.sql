create table phone(
phone_name varchar(100),
phone_price int,
stocking_time timestamp not null
);

desc phone;

insert into phone(phone_name,phone_price,stocking_time)
values("iPone 17 Pro Max 1TB", 57500, "2025-11-13 13:45:00");

select * from phone;

-- now()
create table phone_02(
phone_name varchar(100),
phone_price int,
stocking_time timestamp not null default now()
);

insert into phone_02(phone_name,phone_price)
values("iPone 17 Pro Max 1TB", 57500);

select * from phone_02;
