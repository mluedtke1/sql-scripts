
use master;
drop database if exists PRS;
create database PRS;
use PRS;


create table Users (
	Id int not null primary key identity (1,1),
	Username varchar(30) not null unique,
	Password varchar(30) not null,
	Firstname varchar(30) not null,
	Lastname varchar(30) not null,
	Phone varchar(12),
	Email varchar(255),
	IsReviewer bit,
	IsAdmin bit,
); 


Create table Vendors (
	Id int not null primary key identity (1,1),
	Code varchar(30) not null unique,
	Name varchar(30) not null,
	Address varchar(30) not null,
	City varchar(30) not null,
	State varchar(2) not null,
	Zip varchar(5) not null,
	Phone varchar(12),
	Email varchar(255),
);

create table Product (
	Id int not null primary key identity (1,1),
	PartNbr varchar(30) not null unique,
	Name varchar(30) not null,
	Price decimal(11,2) not null,
	Unit varchar(30) not null,
	PhotoPath varchar(255), 
	VendorId int foreign key references Vendors(Id),
);


Create table Request (
	Id int not null primary key identity (1,1),
	Description varchar(80) not null,
	Justification varchar(80) not null,
	RejectionReason varchar(80),
	DeliveryMode varchar(20) not null default 'Pickup',
	Status varchar(10) not null default 'NEW',
	Total decimal(11,2) not null default 0,
	UserId Int foreign key references Users(Id),
);

create table RequestLine (
	Id int not null primary key identity (1,1),
	RequestId int not null foreign key references Request(Id),
	ProductId int not null foreign key references Product(Id),
	Quantity int not null check(Quantity > 0) default 1,
);


Insert Users
	(Username, Password, Firstname, Lastname, Phone, Email, IsReviewer, IsAdmin)
	values
		('admin', 'pass123', 'Matt', 'Luedtke', '513-319-8795', 'mluedtke@tql.com', 1, 1),
		('rev', 'pass123', 'Matthew', 'L', '111-111-1111', 'email@email.com', 0, 1),
		('normal', 'pass098', 'M', 'Luedtke', '999-999-9999', 'outlook@outlook.com', 0,0);

Insert Vendors
	(Code, Name, Address, City, State, Zip, Phone, Email)
	values
		('TQL', 'Total Quality Logistics', '123 Street', 'Cincinnati', 'OH', '45255', '800-580-3101', 'tql@tql.com'),
		('AMZN', 'Amazon', '838 Amazon Street', 'San Francisco', 'CA', '94133', '999-029-2988', 'jeff@amazon.com'),
		('TGT', 'Target', '318 Main St.', 'New York', 'NY', '10012', '412-098-3452', 'fred@target.com');

Insert Product
	(PartNbr, name, price, unit, VendorId)
	values
		('123', 'Paper', 5.99, 'each', (select vendors.Id from vendors where vendors.code = 'TGT')),
		('444', 'Chair', 45.99, 'each', (select vendors.Id from vendors where vendors.code = 'AMZN')),
		('355', 'Truck', 130000, 'each', (select vendors.Id from vendors where vendors.code = 'TQL')),
		('999', 'Pen', 2.50, 'each', (select vendors.Id from vendors where vendors.code = 'TGT')),
		('321', 'Desk', 235.99, 'each', (select vendors.Id from vendors where vendors.code = 'AMZN')),
		('412', 'Stuff', 2318723.23, 'pallet', (select vendors.Id from vendors where vendors.code = 'TQL')),
		('987', 'Coffee', 6.11, 'lb', (select vendors.Id from vendors where vendors.code = 'AMZN')),
		('345', 'Laptop', 799.99, 'each', (select vendors.Id from vendors where vendors.code = 'AMZN')),
		('103', 'Notebook', 0.99, 'each', (select vendors.Id from vendors where vendors.code = 'AMZN')),
		('003', 'Donuts', 5.99, 'dozen', (select vendors.Id from vendors where vendors.code = 'TQL')),
		('001', 'Monitor', 250, 'each', (select vendors.Id from vendors where vendors.code = 'TGT'));

Insert Request
	(Description, Justification, UserId)
	values
		('necessary stuff', 'needed to do my job', (select id from Users where users.Firstname = 'Matt'));
Insert RequestLine
	(RequestId, ProductId, quantity)
	values
		((select request.id from Request where request.description = 'necessary stuff'), (select product.id from product where product.partnbr = 123), 5)

