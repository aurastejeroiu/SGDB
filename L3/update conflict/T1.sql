-- to replicate the update conflict we need to enable snapshots

alter database ComputerPartsWharehouseManagement set allow_snapshot_isolation on


begin tran

	
	update Producer
	set primary_location = 'Abracadabra'
	where producer_name = 'Dumm3'

commit tran








-- undo
alter database ComputerPartsWharehouseManagement set allow_snapshot_isolation off

-- undo 
update Producer
set primary_location = '123'
where producer_name = 'Dumm3'