create or alter function udf_validate_size (@size int)
returns bit
as
	begin
		declare @res bit = 1
		if (@size not between 200 and 2000)
			set @res = 0
		return @res
	end
go

create or alter function udf_validate_string (@string varchar(30))
returns bit
as
	begin
		declare @res bit = 1
		if (len(@string) < 3)
			set @res = 0
		return @res
	end
go


create or alter procedure udp_insert_into_cpu_socket @release_date date, @socket_type varchar(30), @length int, @width int
as
	if (dbo.udf_validate_date(@release_date) <> 1)
	begin
		raiserror('Invalid date', 15, 1)
	end
	if (dbo.udf_validate_string(@socket_type) <> 1)
	begin
		raiserror('Invalid socket, name too short', 15, 1)
	end
	if (dbo.udf_validate_size(@length) <> 1)
	begin
		raiserror('Invalid length', 15, 1)
	end
	if (dbo.udf_validate_size(@width) <> 1)
	begin
		raiserror('Invalid width', 15, 1)
	end

	insert into CPU_Socket (release_date, socket_type, length_mm, width_mm) 
	values (@release_date, @socket_type , @length , @width)
	insert into logs values ('add', 'socket', getdate())
go


create or alter procedure udp_good_inserts_save
as
begin tran
	begin try
		exec udp_insert_into_cpu_socket '2000-10-30', 'rollback1', 500, 1000
		exec udp_insert_into_cpu_socket '2000-10-30', 'rollback2', 500, 1000
		exec udp_insert_into_processor '2000-10-30', 'rollback1', 3, 4, 'Intel'
		exec udp_insert_into_processor '2010-10-30', 'rollback2', 2.3, 4.5, 'AMD'
		commit tran
	end try
	begin catch
		ROLLBACK TRAN
		PRINT 'ERROR'
	end catch
go



create or alter procedure udp_bad_inserts_save
as
begin tran

	begin try
		exec udp_insert_into_cpu_socket '2000-10-30', 'rollback1', 500, 1000
		save transaction first_socket
	end try
	begin catch
		ROLLBACK TRAN
		PRINT 'ERROR'
	end catch

	begin try
		exec udp_insert_into_cpu_socket '2000-10-30', 'rollback2', 500, 1000
		save transaction second_socket
	end try
	begin catch
		ROLLBACK TRAN first_socket
		PRINT 'Error after first socket'
	end catch

	begin try
		exec udp_insert_into_processor '2000-10-30', 'rollback1', 3, 4, 'Intel'
		save transaction first_processor
	end try
	begin catch
		ROLLBACK TRAN second_socket
		PRINT 'Error after second socket'
	end catch

	-- the last one is bad
	begin try
		exec udp_insert_into_processor '1820-10-30', 'test3', 7.3, 4.3, 'Nvidia'
	end try
	begin catch
		ROLLBACK TRAN first_processor
		PRINT 'Error after first processor'
	end catch
commit tran
go



-- good insert
exec udp_good_inserts_save

-- bad insert
exec udp_bad_inserts_save


select * from logs
select * from Processor
order by id desc
select * from CPU_Socket



-- undo 
delete from logs
delete from Processor where id >= 1007
delete from CPU_Socket
where socket_type = 'rollback1' or 
	  socket_type = 'rollback2'



