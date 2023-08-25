CREATE PROCEDURE TEST
AS
SELECT *
FROM EmployeeDemographics

EXEC TEST


DROP PROCEDURE IF EXISTS Temp_Employee
CREATE PROCEDURE Temp_Employee
AS 
DROP TABLE IF EXISTS #Temp_Employee
CREATE TABLE #Temp_Employee(
JobTitle varchar(50),
EmployeePerJob int,
AvgAge int,
AvgSalary int)


INSERT INTO #Temp_Employee
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(Salary)
FROM EmployeeDemographics emp
JOIN EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
GROUP BY JobTitle

SELECT * 
FROM #Temp_Employee


EXEC Temp_Employee @JobTitle = 'Salesman'