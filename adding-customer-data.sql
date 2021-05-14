Insert Customers (name, city, state, sales, active)
	values ('Matt Luedtke', 'Cincinnat', 'OH', 0, 1);
Insert Orders (CustomerId, Date, Description)
	Values ((select Id from Customers where customers.name = 'Matt Luedtke'), '2021-05-13', 'Stuff')
Insert OrderLines (OrdersId, Product, Description, Quantity, price)	
	values ((select Id from Orders where orders.date = '2021-05-13' and orders.Description ='Stuff'), 'Some Stuff', 'Stuff', 1, 20),
	((select Id from Orders where orders.date = '2021-05-13' and orders.Description ='Stuff'), 'Some Stuff', 'Stuff', 2, 20),
	((select Id from Orders where orders.date = '2021-05-13' and orders.Description ='Stuff'), 'Some Stuff', 'Stuff', 3, 20);

Insert OrderLines (OrdersId, Product, description,	Quantity, price)
	values
	((select orders.Id from orders where orders.CustomerId = (select Customers.id from Customers where name = 'Matt Luedtke')), 
	'Product ', 'Stuff', 1, 1000)

Select * 
	from OrderLines
