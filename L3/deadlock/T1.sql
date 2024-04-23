-- a deadlock happens when two or more transaction are waiting for each other to realease locks and they form a cycle in the precedence graph
-- to solve this, the most recent transaction or the one easiest to undo is aborted

set transaction isolation level read committed
begin tran

	update Producer
	set primary_location = 'Abracadabra'
	where producer_name = 'Dumm3'

	update Processor
	set base_clock = 2.3
	where id = 4

commit tran

select * from Processor


-- what we can to is to set the priority of on transaction to be higher so that is doesn't get chosen as a victim

set deadlock_priority high
begin tran

	update Producer
	set primary_location = 'Abracadabra'
	where producer_name = 'Dumm3'

	update Processor
	set base_clock = 2.3
	where id = 4

commit tran

select * from Processor