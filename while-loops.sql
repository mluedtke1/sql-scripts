declare @idx int=0;

while @idx < 200 begin
	
	
	set @idx += 3
	if @idx%9 = 0 continue
	if @idx > 100 break
	print @idx

end
print 'done'