select city, sum(sales) 'Sales'
	from Customers 
	group by City
	having sum(sales) > 600000


	
