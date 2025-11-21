-- variables 自訂變數斷線失效
select @myname := "Masataka Oniwa";
select @myname;

select @myname := "Sekiro", @myhome := "Ashina";

-- 在set裡面 : and := 都是給值得意思

-- set

-- select裡 := 叫給值 單純= 叫比較 
select @myhome = "Taipei";

-- set 
set @myname := 'Tim', @myhome = 'Taipei';
select @myname, @myhome;

select @myname := 'Tim', @myhome = 'Taipei';

select @myhome = 'Taipei';
select @myhome = 'Tainan';

-- set time
set @mytimestamp = now();
select @mytimestamp;

set @mytimestamp = current_timestamp;
select @mytimestamp;
