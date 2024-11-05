
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


INSERT INTO employee_payroll (name, salary, start_date) 
VALUES ('Dip', 50000, '2018-02-01'),
    ('Prathamesh', 60000, '2019-05-15'),
    ('Vaibhav', 55000, '2020-10-10');

SELECT * FROM employee_payroll;


