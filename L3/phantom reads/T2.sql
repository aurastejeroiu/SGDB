begin tran

	insert into Processor values ('2000-10-10', 'test1', 2.3, 3.5, 'Intel')

commit tran


-- undo
delete from Processor where id > 2033