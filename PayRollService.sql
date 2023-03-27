
--UC-1 Ability to create a payroll service database

CREATE DATABASE Payroll_Service


USE Payroll_Service

----------------------------------------------------------------------------

-- UC-2 Ability to create a employee payroll table in the payroll service database to manage employee payrolls

CREATE TABLE employee_payroll(
Id INT PRIMARY KEY IDENTITY(1,1),
Name VARCHAR(30),
Salary INT,
StartDate DATE
);


SELECT * FROM employee_payroll

----------------------------------------------------------------------------

-- UC-3 Ability to create employee payroll data in the payroll service database as part of CRUD Operation

INSERT INTO employee_payroll(Name,Salary,StartDate)
VALUES('Pranav',50000,'2023-04-30'),
('Prakash',50000,'2023-04-30'),
('Kushal',52400,'2023-04-30'),
('Shubham',38000,'2023-04-30')


-- UC-4 Ability to retrieve all the employee payroll data that is added to payroll service database

SELECT * FROM employee_payroll

----------------------------------------------------------------------------

-- UC-5 Ability to retrieve salary data for a particular employee as well as all employees who have joined in a particular data range from the payroll service database

INSERT INTO employee_payroll(Name,Salary,StartDate)
VALUES
('Kushal',52400,'2023-04-30','M'),
('Bill',70000,'2018-04-30','M'),
('Shubham',38000,'2023-04-30','M'),
('Bill',70000,'2019-03-25','M'),
('Pranav',50000,'2023-04-30','M'),
('Braowly',70000,'2020-04-22','F'),
('Prakash',50000,'2023-04-30','M'),
('Skyler',90000,'2023-03-25','F')




SELECT * FROM employee_payroll WHERE StartDate BETWEEN CAST('2018-01-01' AS DATE) AND CONVERT(date, getdate());

-----------------------------------------------------------------------------

-- UC -6 Ability to add Gender to Employee Payroll Table and Update the Rows to reflect the correct Employee Gender


ALTER TABLE employee_payroll ADD Gender CHAR(2);




INSERT INTO employee_payroll(Name,Salary,StartDate,Gender)
VALUES
('Charlie',52400,'2023-04-30','F'),
('Charlie',52400,'2023-04-30','F'),
('Charlie',52400,'2023-04-30','F'),
('Bill',70000,'2018-04-30','M'),
('Shubham',38000,'2023-04-30','M'),
('Bill',70000,'2019-03-25','M'),
('Pranav',50000,'2023-04-30','M'),
('Braowly',70000,'2020-04-22','F'),
('Prakash',50000,'2023-04-30','M'),
('Skyler',90000,'2023-03-25','F')

SELECT * FROM employee_payroll;


UPDATE employee_payroll set gender =
'M' where name = 'Bill' or name =
'Charlie';


--UC-7 Ability to find sum, average, min, max and number of male and female employees

SELECT * FROM employee_payroll;
SELECT Gender , SUM(Salary) AS SumOfSalary FROM employee_payroll WHERE Gender= 'F'  GROUP BY Gender 
SELECT Gender , SUM(Salary) AS SumOfSalary FROM employee_payroll WHERE Gender= 'M' GROUP BY Gender 


SELECT Gender , AVG(Salary) AS AvgOfSalary FROM employee_payroll WHERE Gender= 'M'  GROUP BY Gender 
SELECT Gender , AVG(Salary) AS AvgOfSalary FROM employee_payroll WHERE Gender= 'F'  GROUP BY Gender 

SELECT Gender , MIN(Salary) AS MinOfSalary FROM employee_payroll WHERE Gender= 'M'  GROUP BY Gender 
SELECT Gender , MIN(Salary) AS MinOfSalary FROM employee_payroll WHERE Gender= 'F'  GROUP BY Gender 

SELECT Gender , MAX(Salary) AS MaxOfSalary FROM employee_payroll WHERE Gender= 'M'  GROUP BY Gender 
SELECT Gender , MIN(Salary) AS MinOfSalary FROM employee_payroll WHERE Gender= 'F'  GROUP BY Gender 


-- UC-8 Ability to extend employee_payroll data to store employee informationlike employee phone, address and department


ALTER TABLE employee_payroll  ADD Department VARCHAR(50);

-- UC-9 Ability to extend employee_payroll table to have Basic Pay, Deductions, Taxable Pay, Income Tax, Net Pay

ALTER TABLE employee_payroll  ADD BasicPay INT
ALTER TABLE employee_payroll  ADD Deductions INT
ALTER TABLE employee_payroll  ADD TaxablePay INT
ALTER TABLE employee_payroll  ADD IncomeTax INT
ALTER TABLE employee_payroll  ADD NetPay INT


-- UC10
INSERT INTO employee_payroll (Name,Salary,Gender,PhoneNumber,Department)
VALUES ('Terissa',200000,'F',987654321,'HR'),
('Terissa',200000,'F',987654321,'Sales')


CREATE TABLE Employee_Table
(
EmpId INT IDENTITY(1,1) PRIMARY KEY,
EmpName VARCHAR(30),
PhoneNumber BIGINT,
Address VARCHAR(100),
City VARCHAR(20),
State VARCHAR(20),
Gender CHAR(1),
)

SELECT * FROM Employee_Table
INSERT INTO Employee_Table (EmpName) 
VALUES ('Pranav'),
('Pravin'),
('Vivek'),
('loki')

CREATE TABLE Department_Table
(
DepartmentId INT IDENTITY(1,1) PRIMARY KEY,
DepartmentName VARCHAR(30),
EmpId INT,
FOREIGN KEY (EmpId) REFERENCES Employee_Table(EmpId)
)

INSERT INTO Department_Table (DepartmentName,EmpId) 
VALUES ('sales',6)
SELECT * FROM Department_Table;

CREATE TABLE PayRoll_Table
(
EmpId INT,
BasicPay INT,
Deduction INT,
TaxablePay INT,
Tax INT,
NetPay INT,
FOREIGN KEY (EmpId) REFERENCES Employee_Table(EmpId)
)

CREATE TABLE Company_Table
(
CompanyId INT IDENTITY(1,1) PRIMARY KEY,
CompanyName VARCHAR(30),
EmpId INT,
FOREIGN KEY (EmpId) REFERENCES Employee_Table(EmpId),
)