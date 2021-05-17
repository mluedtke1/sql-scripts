create or alter procedure AddProduct
	@partnbr varchar(30) = '',
	@name varchar (30) = '',
	@Price decimal(11,2) = null,
	@unit varchar(30) = '',
	@photopath varchar(255) = null,
	@vendor varchar(30) = ''

as
begin
	
	insert into Product (PartNbr, name, price, unit, PhotoPath, VendorId)
		values (@partnbr, @name, @price, @unit,	@photopath, (select Vendors.id from vendors where @vendor like vendors.name))
end;
go

exec AddProduct '111111', 'new prod', 1000000, 'each', null, 'Total Quality Logistics'

select * from Product