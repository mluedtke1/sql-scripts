declare @idx int=0;

while @idx < 30 begin
	print @idx
	set @idx += 3
end
print 'done'