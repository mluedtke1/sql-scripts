create or alter procedure DeleteVendors 
	@id int = 0
as
begin
	if not exists (select 1 from Vendors where id = @id) begin
	print 'error'
	return -1
	end;
	
	delete from Vendors where id = @id
		

end;
go

create or alter procedure AddVendor 
	@Code varchar(30) = '',
	@name varchar (30) = '',
	@address varchar(30) = '',
	@city varchar(30) = '',
	@state varchar(2) = '',
	@zip varchar(5) = '',
	@phone varchar(12) = null,
	@email varchar(255) = NULL

as
begin
	if exists (select 1 from Vendors where @code = Code) begin 
		print 'error'
		end
	insert into Vendors (Code, Name, Address, city,	State, zip, phone, Email)
		values (@code, @name, @address, @city, @state, @zip, @phone, @email)
end;
go

create or alter procedure UpdateVendor
	@Code varchar(30) = '',
	@name varchar (30) = '',
	@address varchar(30) = '',
	@city varchar(30) = '',
	@state varchar(2) = '',
	@zip varchar(5) = '',
	@phone varchar(12) = null,
	@email varchar(255) = NULL

as
begin
if not exists (select 1 from Vendors where @code = Code) begin 
		print 'error'
		end
	update Vendors set 
	name = @name, 
	Address = @address,
	city = @city,
	state = @state,
	zip = @zip,
	phone = @phone,
	email = @email
	where code = @code
end
go

exec UpdateVendor 'new code', 'new vendor222', 'new address', 'new city', 'NV', '12345', '1231231234', 'new email'



select * from Vendors