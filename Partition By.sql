SELECT FirstName, LastName, Gender, Salary
		,COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender
FROM EmployeeDemographics Dem
JOIN EmployeeSalary Sal
ON Dem.EmployeeID = Sal.EmployeeID

