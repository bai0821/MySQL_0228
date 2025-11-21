-- stored procedure

delimiter //
select * from ports;

delimiter //
create procedure select_ports()
begin
  select * from ports;
end //
delimiter ;

call select_ports();

#drop procedure select_ports;

-- stored procedure with parameters
delimiter $$
create procedure ports_city(in portsid int)
begin
  select city from ports where id = portsid;
end $$
delimiter ;

call ports_city(1);
call ports_city(3);
call ports_city(4);


delimiter //
create procedure pname_ports(in pname varchar(250))
begin
  select name,portid from passengers where name like pname;
end //
delimiter ;

call pname_ports('William');
call pname_ports('%William%');
call pname_ports('% William %');

call pname_ports('% John %');
call pname_ports('Williams, %');
