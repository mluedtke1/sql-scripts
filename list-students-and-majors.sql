select * 
	from student
	left join major
		on Student.MajorId = Major.Id 
	where gpa >= 3.5 and gpa < 4.0

	order by gpa desc, sat desc

