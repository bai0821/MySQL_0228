create table my_product(
product_id int primary key auto_increment,
product_name varchar(100) not null,
product_price int not null
);
alter table my_product auto_increment = 21;

insert into my_product(product_name,product_price)
values
("man01",10000),
("man02",20000),
("man03",30000),
("man04",40000),
("man05",50000);

select * from my_product;