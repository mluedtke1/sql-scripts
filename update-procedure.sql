create or alter procedure UpdateUsers 
	@username varchar(30) = '',
	@password varchar(30) ='',
	@firstname varchar(30) ='',
	@lastname varchar(30) ='',
	@phone varchar(12) = null,
	@email varchar(255) = null,
	@reviewer bit = false,
	@admin bit = false,
	@id int = 0
as
begin
	if not exists (select 1 from users where id = @id) begin
	print 'error'
	return -1
	end;
	
	update Users set
		Username= @username,
		password = @password,
		firstname = @firstname,
		Lastname = @lastname,
		phone = @phone,
		email = @email,
		isreviewer = @reviewer,
		IsAdmin = @admin

		where Id = @id;

end;
go

exec UpdateUsers 'xxxx11', 'bb', 'xx', 'xx', null, null, false, false, 7;

select * from Users