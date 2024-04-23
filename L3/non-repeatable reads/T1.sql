-- non-repeatable reads happen under read committed isolation level bacause the shared locks are realeased as soon as the read is over
-- this means that another transaction can update and commit data if T1 reads again it will read different data

set transaction isolation level read committed
begin tran
	select * 
	from Producer
	
	-- at this point T2 changes something in the table

	-- now we get a different result
	select * 
	from Producer
commit tran


-- to solve this we need to use repeatable read isolation level because shared locks are kept untill the transaction finnishes (commit/rollback)

set transaction isolation level repeatable read
begin tran
	select * 
	from Producer
	
	-- at this point T2 changes something in the table

	select * 
	from Producer
commit tran



select @@TRANCOUNT