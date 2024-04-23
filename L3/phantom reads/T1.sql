-- phantom reads happen when a different transaction adds a new row that matches our selection criterion
-- they can happen even under repeatable read

set transaction isolation level repeatable read
begin tran
	select *
	from Processor
	where base_clock between 2 and 2.5

	
	select *
	from Processor
	where base_clock between 2 and 2.5

commit tran


-- to avoid this we need to use isolation level serializable so that the shared locks are applied on the whole range from the where clause
set transaction isolation level serializable
begin tran
	select *
	from Processor
	where base_clock between 2 and 2.5

	
	select *
	from Processor
	where base_clock between 2 and 2.5

commit tran


select @@TRANCOUNT