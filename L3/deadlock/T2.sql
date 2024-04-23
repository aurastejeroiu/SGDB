begin tran

	update Processor
	set base_clock = 2.3
	where id = 4

	update Producer
	set primary_location = 'Abracadabra'
	where producer_name = 'Dumm3'

commit tran