begin tran
create table Test_Employee (
	EmployeeID int NOT NULL,
	EmployeeName varchar(50),
	JobPosition varchar(50),
	TenureInYears int,
	Company varchar(50)
)
commit
select * from Test_Employee

begin tran
insert into Test_Employee (
	EmployeeID,
	EmployeeName,
	JobPosition,
	TenureInYears,
	Company
)
Values (
	6,
	'John',
	'Product Tester',
	3,
	'Apple'
)
commit

begin tran
update Test_Employee
set EmployeeID = 2
where EmployeeName = 'Shamoon'

begin tran
create table Finance_Table (
	EmployeeID int NOT NULL,
	EmployeeName varchar(50),
	Salary varchar(50),
	ProvidentFund int,
)
select * from Finance_Table
commit
begin tran
insert into Finance_Table (
	EmployeeID,
	EmployeeName,
	Salary,
	ProvidentFund
)
Values (
	6,
	'Jerald',
	85000,
	2000
)
commit
select * from Test_Employee
select * from Finance_Table

select avg(Salary) from Finance_Table

select * from Test_Employee where JobPosition like '%Manager'

begin tran
alter table Finance_Table
alter column Salary int
commit

select avg(salary) from 
(select emp.employeeid,emp.employeeName, jobposition, tenureinyears, company, fin.salary, fin.providentfund from Test_Employee emp
inner join Finance_Table fin on emp.EmployeeID = fin.EmployeeID) IJT
where company = 'Cisco'

select * from Finance_Table order by salary desc offset 1 row fetch first 1 row only

create procedure company_procedure @company varchar (50)
as
select * from
(select emp.employeeId, emp.employeeName, emp.jobposition, emp.tenureinyears, emp.company, fin.salary, fin.providentfund
from Test_Employee emp
inner join Finance_Table fin on emp.EmployeeID=fin.EmployeeID) IJT
where IJT.Company = @company

exec company_procedure @company='Apple'

create trigger insertTrigger
on Test_Employee
for insert
as
	INSERT INTO EmpLog (EmpID,Operation,UpdatedDate)
	SELECT EmployeeID ,'inserted',GETDATE() 
	FROM inserted


	begin tran
create table Test_Emplog (
	EmployeeID int identity (1,1),
	Operation varchar(50),
	Time_Stamp varchar(50),
)
commit
select * from Test_Emplog

