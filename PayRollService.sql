
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


('Bill',70000,'2021-03-25'),
('Bill',90000,'2023-03-25')



SELECT * FROM employee_payroll WHERE StartDate BETWEEN CAST('2018-01-01' AS DATE) AND CONVERT(date, getdate());

-----------------------------------------------------------------------------
