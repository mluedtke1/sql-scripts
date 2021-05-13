Insert Student (Firstname, Lastname, StateCode, SAT, gpa,	MajorId)
	values
		('Noah', 'Phence', 'GA', 1235, 3.15, (select major.id from Major where major.Description = 'Math'));

Update Student set
	MajorId = (select major.id from Major where major.Description = 'Accounting'), 
	GPA = (3.51)
	where student.Firstname = 'Noah' and student.Lastname = 'Phence';