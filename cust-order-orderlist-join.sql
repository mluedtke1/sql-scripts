select state, o.description, ol.Product, ol.Description, ol.Quantity, ol.price,  (price * Quantity) 'total'
	from Orders o
	join Customers c on c.Id = o.CustomerId
	join OrderLines ol on o.Id = ol.OrdersId
	order by c.Name