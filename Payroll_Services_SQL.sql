
CREATE DATABASE payroll_service;


SELECT name 
FROM sys.databases 
WHERE name = 'payroll_service';

USE payroll_service;

CREATE TABLE employee_payroll (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(50),
    salary DECIMAL(18, 2),
    start_date DATE
);



