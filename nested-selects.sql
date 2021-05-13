Insert OrderLines (OrdersId, Product, description,	Quantity, price)
	values
	((select orders.Id from orders where orders.CustomerId = (select Customers.id from Customers where name = 'Matt Luedtke')), 
	'Product ', 'Stuff', 1, 1000)