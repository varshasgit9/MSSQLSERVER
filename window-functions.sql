------------------------------------------------ Window Functions-----------------------------------------------------------------------------------

--Ranking Functions

--ROW_NUMBER()


SELECT Name, Salary,
       ROW_NUMBER() OVER (ORDER BY Salary DESC) AS RowNum
FROM Employees;


--RANK()


SELECT Name, Salary,
       RANK() OVER (ORDER BY Salary DESC) AS Rank
FROM Employees;


--DENSE_RANK()


SELECT Name, Salary,
       DENSE_RANK() OVER (ORDER BY Salary DESC) AS DenseRank
FROM Employees;


----------------------------------------------------------Aggregate Window Functions-----------------------------------------------------------------

--SUM()


SELECT Name, Salary,
       SUM(Salary) OVER () AS TotalSalary
FROM Employees;


--AVG()


SELECT Name, Salary,
       AVG(Salary) OVER () AS AverageSalary
FROM Employees;


--MAX()


SELECT Name, Salary,
       MAX(Salary) OVER () AS MaxSalary
FROM Employees;


--MIN()


SELECT Name, Salary,
       MIN(Salary) OVER () AS MinSalary
FROM Employees;


------------------------------------------------------------Navigation Window Functions-----------------------------------------------------------

--LAG()


SELECT Name, Salary,
       LAG(Salary, 1, 0) OVER (ORDER BY EmployeeID) AS PrevSalary
FROM Employees;


--LEAD()


SELECT Name, Salary,
       LEAD(Salary, 1, 0) OVER (ORDER BY EmployeeID) AS NextSalary
FROM Employees;


--------------------------------------------------------Window Frames-----------------------------------------------------------------------------

ROWS


SELECT Name, Salary,
       SUM(Salary) OVER (ORDER BY EmployeeID ROWS 2 PRECEDING) AS SumSalary
FROM Employees;


RANGE


SELECT Name, Salary,
       SUM(Salary) OVER (ORDER BY Salary RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS CumulativeSum
FROM Employees;
