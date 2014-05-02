-- create stored proc to select into a table

create or replace procedure pgarvey.populateGiftMart as
begin
	insert into pg_gift_mart
	(gift_donor_id, giving_total)
	select g.gift_donor_id, sum(g.gift_associated_amount) 
	from gift g
	group by g.gift_donor_id;
	commit;
end;
