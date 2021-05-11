select c.id, code, subject, Section, concat(Firstname,' ', Lastname) 'Name'
	from class c
	join Instructor i
		on c.InstructorId = i.id
		where c.Section between 300 and 399