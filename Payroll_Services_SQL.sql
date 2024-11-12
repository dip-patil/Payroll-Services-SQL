
---------UC1----------

CREATE DATABASE payroll_service;

SELECT name 
FROM sys.databases 
WHERE name = 'payroll_service';

USE payroll_service;

----------UC2-----------

CREATE TABLE employee_payroll (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(50),
    salary DECIMAL(18, 2),
    start_date DATE
);

---------UC3--------------

INSERT INTO employee_payroll (name, salary, start_date) 
VALUES ('Dip', 50000, '2018-02-01'),
    ('Prathamesh', 60000, '2019-05-15'),
    ('Vaibhav', 55000, '2020-10-10');


-------------UC4-------------------

SELECT * FROM employee_payroll;

-------------UC5-------------------

SELECT salary FROM employee_payroll WHERE name = 'Dip';

-------------UC6-------------------

SELECT * FROM employee_payroll
WHERE start_date BETWEEN CAST('2018-03-01' AS DATE) AND CAST(GETDATE() AS DATE);

-------------UC7-------------------

ALTER TABLE employee_payroll
ADD gender CHAR(1);

UPDATE employee_payroll 
SET gender = 'M' 
WHERE name = 'Dip' OR name = 'Prathamesh';

UPDATE employee_payroll 
SET gender = 'F' 
WHERE name = 'Vaibhav';

-------------UC7------------


SELECT 
    gender,
    SUM(salary) AS total_salary,
    AVG(salary) AS average_salary,
    MIN(salary) AS minimum_salary,
    MAX(salary) AS maximum_salary,
    COUNT(*) AS employee_count
FROM 
    employee_payroll
GROUP BY 
    gender;




----UC8--------

ALTER TABLE employee_payroll
ADD 
    phone NVARCHAR(15),
    address NVARCHAR(255) ,
    department NVARCHAR(50);


UPDATE employee_payroll
SET department = 'Sales',phone= '4554244343',address='Pune'
WHERE name = 'Vaibhavi';

UPDATE employee_payroll
SET department = 'Marketing',phone= '5645456465',address='Nashik'
WHERE name = 'Prathamesh';

UPDATE employee_payroll
SET department = 'Engineering',phone= '9689629399',address='Jalgaon'
WHERE name = 'Dip';


ALTER TABLE employee_payroll
ALTER COLUMN address NVARCHAR(255);


ALTER TABLE employee_payroll
ADD CONSTRAINT DF_employee_payroll_address DEFAULT 'Not Provided' FOR address;

    
ALTER TABLE employee_payroll
Alter column department NVARCHAR(50) NOT NULL;

--------------UC9----------------------

ALTER TABLE employee_payroll
ADD 
    Basic_Pay DECIMAL(18, 2),
    Deductions DECIMAL(18, 2),
    Taxable_Pay DECIMAL(18, 2),
    Income_Tax DECIMAL(18, 2),
    Net_Pay DECIMAL(18, 2);


UPDATE employee_payroll 
SET 
    Basic_Pay = 40000,
    Deductions = 5000,
    Taxable_Pay = 35000,
    Income_Tax = 7000,
    Net_Pay = 28000
WHERE name = 'Dip';

UPDATE employee_payroll 
SET 
    Basic_Pay = 50000,
    Deductions = 6000,
    Taxable_Pay = 25000,
    Income_Tax = 6000,
    Net_Pay = 18000
WHERE name = 'Prathamesh';

UPDATE employee_payroll 
SET 
    Basic_Pay = 60000,
    Deductions =4000,
    Taxable_Pay = 33000,
    Income_Tax = 7700,
    Net_Pay = 32000
WHERE name = 'Vaibhavi';

-------------------UC10--------------------

INSERT INTO employee_payroll (name, salary, start_date, phone, address, department, Basic_Pay, Deductions, Taxable_Pay, Income_Tax, Net_Pay, gender)
VALUES 
    ('Terissa', 65000, '2023-01-10', '123-456-7890', '456 Market St', 'Sales and Marketing', 50000, 5000, 45000, 9000, 36000, 'F');


UPDATE employee_payroll 
SET 
    department = 'Sales and Marketing', 
    salary = 68000
WHERE name = 'Terissa' AND department = 'Sales and Marketing';


