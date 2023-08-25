--WITH CTE_Employee AS 

--(SELECT FirstName, LastName, Gender, Salary
--		,COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender
--		, AVG(Salary) OVER (PARTITION BY Gender) as AvgSalary
--FROM EmployeeDemographics emp
--JOIN EmployeeSalary Sal
--	ON emp.EmployeeID = Sal.EmployeeID
--WHERE Salary > '45000'
--)

--SELECT *
--FROM CTE_Employee

-------------------------------
DROP TABLE IF EXISTS #temp_Employee
CREATE TABLE #temp_Employee (
EmployeeID int,
JobTitle varchar(100),
Salary int
)

Select *
FROM #temp_Employee

INSERT INTO #temp_Employee VALUES(
'1001', 'HR', '45000'
)


INSERT INTO #temp_Employee
SELECT *
FROM EmployeeSalary

DROP TABLE IF EXISTS #Temp_Employee2
CREATE TABLE #Temp_Employee2(
JobTitle varchar(50),
EmployeePerJob int,
AvgAge int,
AvgSalary int)


INSERT INTO #Temp_Employee2
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(Salary)
FROM EmployeeDemographics emp
JOIN EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
GROUP BY JobTitle

SELECT *
FROM #Temp_Employee2