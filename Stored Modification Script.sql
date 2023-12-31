USE [SQL Refresher]
GO
/****** Object:  StoredProcedure [dbo].[Temp_Employee]    Script Date: 8/25/2023 1:16:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Temp_Employee]
@JobTitle nvarchar(100)
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
	WHERE JobTitle = @JobTitle
GROUP BY JobTitle

SELECT * 
FROM #Temp_Employee
