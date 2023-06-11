BEGIN TRAN

CREATE TABLE Test_Employee (
	EmployeeID INT NOT NULL
	,EmployeeName VARCHAR(50)
	,JobPosition VARCHAR(50)
	,TenureInYears INT
	,Company VARCHAR(50)
	)

COMMIT

SELECT *
FROM Test_Employee

BEGIN TRAN

INSERT INTO Test_Employee (
	EmployeeID
	,EmployeeName
	,JobPosition
	,TenureInYears
	,Company
	)
VALUES (
	6
	,'John'
	,'Product Tester'
	,3
	,'Apple'
	)

COMMIT

BEGIN TRAN

UPDATE Test_Employee
SET EmployeeID = 2
WHERE EmployeeName = 'Shamoon'

BEGIN TRAN

CREATE TABLE Finance_Table (
	EmployeeID INT NOT NULL
	,EmployeeName VARCHAR(50)
	,Salary VARCHAR(50)
	,ProvidentFund INT
	,
	)

SELECT *
FROM Finance_Table

COMMIT

BEGIN TRAN

INSERT INTO Finance_Table (
	EmployeeID
	,EmployeeName
	,Salary
	,ProvidentFund
	)
VALUES (
	6
	,'Jerald'
	,85000
	,2000
	)

COMMIT

SELECT *
FROM Test_Employee

SELECT *
FROM Finance_Table

SELECT avg(Salary)
FROM Finance_Table

SELECT *
FROM Test_Employee
WHERE JobPosition LIKE '%Manager'

BEGIN TRAN

ALTER TABLE Finance_Table

ALTER COLUMN Salary INT

COMMIT

SELECT avg(salary)
FROM (
	SELECT emp.employeeid
		,emp.employeeName
		,jobposition
		,tenureinyears
		,company
		,fin.salary
		,fin.providentfund
	FROM Test_Employee emp
	INNER JOIN Finance_Table fin ON emp.EmployeeID = fin.EmployeeID
	) IJT
WHERE company = 'Cisco'

SELECT *
FROM Finance_Table
ORDER BY salary DESC offset 1 row

FETCH first 1 row ONLY

CREATE PROCEDURE company_procedure @company VARCHAR(50)
AS
SELECT *
FROM (
	SELECT emp.employeeId
		,emp.employeeName
		,emp.jobposition
		,emp.tenureinyears
		,emp.company
		,fin.salary
		,fin.providentfund
	FROM Test_Employee emp
	INNER JOIN Finance_Table fin ON emp.EmployeeID = fin.EmployeeID
	) IJT
WHERE IJT.Company = @company

EXEC company_procedure @company = 'Apple'

CREATE TRIGGER insertTrigger ON Test_Employee
FOR INSERT
AS
INSERT INTO EmpLog (
	EmpID
	,Operation
	,UpdatedDate
	)
SELECT EmployeeID
	,'inserted'
	,GETDATE()
FROM inserted

BEGIN TRAN

CREATE TABLE Test_Emplog (
	EmployeeID INT identity(1, 1)
	,Operation VARCHAR(50)
	,Time_Stamp VARCHAR(50)
	,
	)

COMMIT

SELECT *
FROM Test_Emplog
