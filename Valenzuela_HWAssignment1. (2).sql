/* 
Name: Luis Valenzuela
Date 2/11/2023
Description: HW Assignment 1: Single Entities Tables and Properties
Name	Date		Description
LV		2/11/2023	Query the following tables
					-employees
					-payments
                    -productlines
					
*/

USE nyit_1299302_classicmodels;
show tables;

-- 1. Create a list of offices sorted by country, state, city (hint: use ORDER BY]

describe offices;

SELECT country, state, city
FROM offices
ORDER BY country, state, city;

-- 2. How many employees are there in the company?
describe employees;

select count(employeeNumber)
from employees;

-- or (first query has with primary key)
-- both produce same results

SELECT COUNT(*)
FROM employees;

-- 3. What is the total of payments received?
describe payments;

SELECT SUM(amount)
FROM payments;

-- 4. List the product lines that contain 'Cars'?

describe productlines;

SELECT productLine
FROM productlines
WHERE productLine LIKE '%Cars%';

-- 5.	Report total payments for October 28, 2004.

describe payments;

SELECT SUM(amount)
FROM payments
WHERE paymentDate = '2004-10-28';
