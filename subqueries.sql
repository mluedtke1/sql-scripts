select * from Customers
	where sales < (select avg(sales) from Customers);