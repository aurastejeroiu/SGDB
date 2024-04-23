
set transaction isolation level snapshot

begin tran

	select *
	from Producer
	where producer_name = 'Dumm3'


	select *
	from Producer
	where producer_name = 'Dumm3'
	
	update Producer
	set primary_location = 'magie'
	where producer_name = 'Dumm3'


commit tran