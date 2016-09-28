insert into #TestMe (my_col1, my_col2, my_col3) values(N'Solun', N'Belgrade', N'Bourgas');

select * from #TestMe

declare @city	as nvarchar(100);
declare @my_counter		as int
set @my_counter=1;

set @city = (select min(my_col3) from #TestMe);
while @city is not null
begin 

	print @my_counter;
	print @city;
	set @my_counter = @my_counter+1

	set @city = (select min(my_col3) from #TestMe
		where my_col3>@city);
	end 
go

IF OBJECT_ID('tempdb..#TestMe') IS NOT NULL 
	DROP TABLE #TestMe;
