drop table logs
create table logs (
	operation varchar(3),
	table_name varchar(30),
	date datetime
)
go


-- create a stored procedure that inserts data in tables that are in a m:n relationship;
-- if one insert fails, all the operations performed by the procedure must be rolled back (grade 3);


create or alter function udf_validate_date (@date date)
returns bit
as
	begin
		declare @res bit = 1
		if (@date < '1950-01-01')
			set @res = 0
		return @res
	end
go


create or alter function udf_validate_socket (@socket varchar(30))
returns bit
as
	begin
		declare @res bit = 1
		if (@socket not in (select socket_type from CPU_Socket))
			set @res = 0
		return @res
	end
go

create or alter function udf_validate_producer (@producer varchar(30))
returns bit
as
	begin
		declare @res bit = 1
		if (@producer not in (select producer_name from Producer))
			set @res = 0
		return @res
	end
go

create or alter function udf_validate_clock_speed (@speed varchar(30))
returns bit
as
	begin
		declare @res bit = 1
		if (@speed not between 1.2 and 5.5)
			set @res = 0
		return @res
	end
go



create or alter procedure udp_insert_into_processor @release_date date, @socket_type varchar(30), @base_clock float, @boost_clock float, @producer varchar(30)
as
	if (dbo.udf_validate_date(@release_date) <> 1)
	begin
		raiserror('Invalid date', 15, 1)
	end
	if (dbo.udf_validate_socket(@socket_type) <> 1)
	begin
		raiserror('Invalid socket', 15, 1)
	end
	if (dbo.udf_validate_clock_speed(@base_clock) <> 1)
	begin
		raiserror('Invalid base clock', 15, 1)
	end
	if (dbo.udf_validate_clock_speed(@boost_clock) <> 1)
	begin
		raiserror('Invalid boost clock', 15, 1)
	end
	if (dbo.udf_validate_producer(@producer) <> 1)
	begin
		raiserror('Invalid socket', 15, 1)
	end

	insert into Processor (release_date, socket_type, base_clock, boost_clock, producer) 
	values (@release_date, @socket_type , @base_clock , @boost_clock , @producer)
	insert into logs values ('add', 'processor', getdate())
go


create or alter procedure udp_good_inserts
as
begin tran
	begin try
		exec udp_insert_into_processor '2000-10-30', 'test1', 3, 4, 'Intel'
		exec udp_insert_into_processor '2010-10-30', 'test2', 2.3, 4.5, 'AMD'
		exec udp_insert_into_processor '2020-10-30', 'test3', 1.3, 4.3, 'Nvidia'
		commit tran
	end try
	begin catch
		ROLLBACK TRAN
		PRINT 'ERROR'
	end catch
go



create or alter procedure udp_bad_inserts
as
begin tran
	begin try
		exec udp_insert_into_processor '2000-10-30', 'test1', 3, 4, 'Intel'
		exec udp_insert_into_processor '2010-10-30', 'test2', 2.3, 4.5, 'AMD'
		-- the last one is bad
		exec udp_insert_into_processor '1820-10-30', 'test3', 7.3, 4.3, 'Nvidia'
		commit tran
	end try
	begin catch
		ROLLBACK TRAN
		PRINT 'ERROR'
	end catch
go



-- good insert
exec udp_good_inserts

-- bad insert
exec udp_bad_inserts

-- undo 
delete from Processor where id >= 1007
delete from logs

select * from logs
select * from Processor
order by id desc



select * from Producer


