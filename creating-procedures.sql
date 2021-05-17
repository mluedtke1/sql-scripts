create or alter procedure findUserByUsernameAndPassword
	@username varchar(30) = null,
	@password varchar(30) = null
AS
BEGIN
	if @username = ''
	begin
	print 'need username'
	end;
	select * from users where Username = @username and Password = @password;
End;
go
exec findUserByUsernameAndPassword '', ''