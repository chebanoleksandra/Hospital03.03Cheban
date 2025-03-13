USE Hospital

--6
SELECT Doctors.Surname, Departments.Name, Medical_examination.Date
FROM Medical_examination INNER JOIN Doctors ON Medical_examination.Doctor_id = Doctors.Id 
						 INNER JOIN Departments ON Medical_examination.Department_id = Departments.Id
--WHERE (DATEPART(weekday, Medical_examination.Date)) <>7 AND (DATEPART(weekday, Medical_examination.Date)) <>1

--7
SELECT Departments.Name as 'Department', Wards.Name as 'Ward'
FROM Medical_examination INNER JOIN Doctors ON Medical_examination.Doctor_id = Doctors.Id 
						 INNER JOIN Departments ON Medical_examination.Department_id = Departments.Id, Wards
WHERE Wards.DepartmentId = Departments.Id

--8
SELECT Departments.Name as 'Department', Doctors.Name as 'Doctor'
FROM Donations INNER JOIN Departments ON Donations.DepartmentId = Departments.Id,
	 Medical_examination INNER JOIN Doctors ON Medical_examination.Doctor_id = Doctors.Id
WHERE Donations.Amount > 100000 AND Medical_examination.Department_id = Departments.Id

--9
SELECT Departments.Name
FROM Medical_examination INNER JOIN Doctors ON Medical_examination.Doctor_id = Doctors.Id 
						 INNER JOIN Departments ON Medical_examination.Department_id = Departments.Id
WHERE Doctors.Premium = 0

--10
SELECT Specializations.Name
FROM Medical_examination INNER JOIN Doctors ON Medical_examination.Doctor_id = Doctors.Id
                         INNER JOIN Illnesses ON Medical_examination.Illness_id = Illnesses.Id,
	 DoctorsSpecializations, Specializations
WHERE DoctorsSpecializations.DoctorId = Doctors.Id AND DoctorsSpecializations.SpecializationId = Specializations.Id AND Illnesses.Severity >3

--11
SELECT Departments.Name, Illnesses.Name
FROM Medical_examination INNER JOIN Departments ON Medical_examination.Department_id = Departments.Id
						 INNER JOIN Illnesses ON Medical_examination.Illness_id = Illnesses.Id
WHERE Medical_examination.Date>'20240913'

--12
SELECT Departments.Name, Wards.Name
FROM Medical_examination INNER JOIN Departments ON Medical_examination.Department_id = Departments.Id
						 INNER JOIN Illnesses ON Medical_examination.Illness_id = Illnesses.Id,
	 Wards
WHERE Wards.DepartmentId = Departments.Id AND Illnesses.Contagiousness = 'True'