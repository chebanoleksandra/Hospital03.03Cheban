USE [Hospital03.03]

INSERT Departments(Name)
  VALUES('Cardiology'),
		('Neurology'),
		('Intensive Treatment'),
		('Pediatrics'),
		('Orthopedics')

SELECT * 
FROM Departments

INSERT Sponsors(Name)
  VALUES('Umbrella Corporation'),
		('HealthCorp'),
		('MedLife'),
		('PharmaPlus'),
		('WellBeing Inc.')

SELECT *
FROM Sponsors

INSERT Specializations(Name)
  VALUES('Cardiologist'),
		('Neurologist'),
		('Oncologist'),
		('Pediatrician'),
		('Orthopedic')

SELECT *
FROM Specializations

INSERT Doctors(Name, Premium, Salary, Surname)
  VALUES('John', 100, 2000, 'Smith'),
		('Emily', 150, 2500, 'Johnson'),
		('Michael', 120, 2200, 'Brown'),
		('Sarah', 200, 3000, 'Wilson'),
		('David', 130, 2100, 'Taylor')

SELECT *
FROM Doctors

INSERT Wards(Name, DepartmentId)
  VALUES('Ward A', 1),
		('Ward B', 2),
		('Ward C', 3),
		('Ward E', 4),
		('Ward F', 5)

SELECT *
FROM Wards

INSERT Donations(Amount, Date, DepartmentId, SponsorId)
  VALUES(1000, '2025-02-28', 1, 2),
		(1500, '2025-03-01', 2, 3),
		(800, '2025-03-02', 3, 1),
		(2000, '2025-03-03', 4, 4),
		(1200, '2025-03-03', 5, 5)

SELECT *
FROM Donations

INSERT DoctorsSpecializations(DoctorId, SpecializationId)
	VALUES(1, 2),
	      (2, 3),
	      (3, 1),
	      (4, 5),
	      (5, 4)

SELECT *
FROM DoctorsSpecializations

INSERT Vacations(EndDate, StartDate, DoctorId)
	   VALUES('2025-03-10', '2025-03-01', 1),
			 ('2025-04-15', '2025-04-01', 2),
			 ('2025-05-05', '2025-04-25', 3),
			 ('2025-03-20', '2025-03-10', 4),
			 ('2025-06-10', '2025-05-30', 5)

SELECT *
FROM Vacations

--1
SELECT Doctors.Name+' '+Doctors.Surname as 'Doctor', Specializations.Name as 'Specialization'
FROM DoctorsSpecializations INNER JOIN Doctors ON DoctorsSpecializations.DoctorId = Doctors.Id
							INNER JOIN Specializations ON DoctorsSpecializations.SpecializationId = Specializations.Id

--2
SELECT Doctors.Surname, (Doctors.Premium + Doctors.Salary) as 'Full Salary'
FROM Vacations INNER JOIN Doctors ON Vacations.DoctorId = Doctors.Id
WHERE Vacations.StartDate > '03.03.25' OR Vacations.EndDate < '03.03.25'

--3
SELECT Wards.Name
FROM Wards INNER JOIN Departments ON Wards.DepartmentId = Departments.Id
WHERE Departments.Name = 'Intensive Treatment'

--4
SELECT Departments.Name
FROM Donations INNER JOIN Departments ON Donations.DepartmentId = Departments.Id
			   INNER JOIN Sponsors ON Donations.SponsorId = Sponsors.Id
WHERE Sponsors.Name = 'Umbrella Corporation'

--5
SELECT Departments.Name as 'Department', Sponsors.Name as 'Sponsor', Donations.Amount, Donations.Date
FROM Donations INNER JOIN Departments ON Donations.DepartmentId = Departments.Id
			   INNER JOIN Sponsors ON Donations.SponsorId = Sponsors.Id
WHERE Donations.Date >= '2025-03-01' AND Donations.Date <= '2025-03-31'