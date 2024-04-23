begin tran
	update Producer
	set primary_location = 'Abracadabra'
	where producer_name = 'Dumm3'
commit tran


select * from Producer

-- undo 
update Producer
set primary_location = '123'
where producer_name = 'Dumm3'