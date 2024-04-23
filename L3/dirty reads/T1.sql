-- dirty reads happen under read uncommitted isolation level => no shared locks for reading data

set transaction isolation level read uncommitted
begin tran
	select * 
	from Producer

	-- at this point T2 changes something in the table

	-- now we get a different result
	select * 
	from Producer
commit tran

-- to solve this we need to set the isolation level to read committed
set transaction isolation level read committed

begin tran
	select * 
	from Producer


	select * 
	from Producer
commit tran


select @@TRANCOUNT