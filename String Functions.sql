SELECT EmployeeID, TRIM(EmployeeID) IDTRIM---Gets rid of blank spaces
FROM EmployeeErrors

SELECT EmployeeID, LTRIM(EmployeeID) IDTRIM---Gets rid of Left blank spaces
FROM EmployeeErrors

SELECT EmployeeID, RTRIM(EmployeeID) IDTRIM---Gets rid of Right blank spaces
FROM EmployeeErrors


SELECT *
FROM EmployeeErrors

---------- uSING rEPLace

SELECT LastName, REPLACE(LastName, '- Fired','')
FROM EmployeeErrors


SELECT FirstName, SUBSTRING(FirstName,1,3)
FROM EmployeeErrors


SELECT *
FROM EmployeeDemographics

SELECT Dem.EmployeeID, Dem.FirstName, Dem.LastName, Dem.Age
From EmployeeErrors Err
JOIN EmployeeDemographics Dem
	ON SUBSTRING(Err.FirstName,1,3) = SUBSTRING(Dem.FirstName,1,3)