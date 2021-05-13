select m.Description, c.Code, c.Subject
	from Major m
	join MajorClass mc on mc.MajorId = m.Id
	join Class c on c.Id = mc.ClassId
	where m.Description = 'General Business'

