
/*Create database BootCamp;*/
/*
create table Students (
	Id int primary key identity(1,1),
	FirstName nvarchar(30) not null,
	LastName nvarchar(30) not null,
	Address nvarchar(50) not null,
	City nvarchar(50) not null,
	State char(2) not null,
	Zip varchar(10) not null,
	AssessmentScore int not null
);
*/
/*
create table assessments(
	Id int primary key identity (1,1),
	StudentId int not null foreign key references Students(Id),
	Topic nvarchar(30) not null,
	Score int not null
);
*/

/*

insert students (firstname, lastname, address, city, state, zip, assessmentscore)
	values
	('Matt', 'Luedtke', '3556 Handman Avenue','Cincinnati', 'OH', '45226', 92)

Insert assessments (studentid, Topic, Score)
	values
	((select Id from students where firstname = 'Matt' and lastname = 'Luedtke'),'Git', 100)

*/
/*
create table Customers (
	Id int not null primary key identity (1,1),
	Code varchar(10) not null unique,
	Name varchar(30) not null,
	Sales decimal(9,2) not null default 0 check (Sales >=0),
	Active bit not null default 1,
	created datetime not null default getdate()
);

insert Customers (Code, Name)
	values
	('KROG', 'Kroger'),
	('FCC', 'FC Cincinnati'),
	('TQL', 'Total Quality Logistics')

*/
/*
Alter table Customers 
	add Updated datetime;
	*/


Alter table Customers 
	alter column Name varchar(50) not null;