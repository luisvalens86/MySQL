/* 
Name: Luis Valenzuela
Date 2/11/2023
Description: HW Assignment 2
Name	Date		Description
LV		2/11/2023	SQL Tutorial
					
*/

-- USE Your own ClassiModels Database
use nyit_1299302_classicmodels;
show tables;

-- SELECT
-- FROM --> SELECT

select lastName, firstName, jobTitle
from employees;

-- ORDER BY Clause
-- ASC, DESC

describe customers;
describe orderdetails;
describe employees;

select contactLastName, contactFirstName
from customers
order by contactLastName DESC;

select orderNumber, quantityOrdered, productCode
from oderdetails
order by quantityOrdered * priceEach DESC;

select (quantityOrdered * priceEach) as totalAmt, orderNumbner, quantityOrderred, productCode
from orderdetails
order by totalAmt DESC;

-- WHERE clause
-- from -> where -> select

select lastName, firstName
from employees
where jobTitle = 'Sales Rep'
or officeCode=1
order by officeCode;

select productCode
from orderdetails
where priceEach between 0 and 200;

-- LIKE parameter
select firstName, lastName
from employees
where lastName LIKE '%son';

-- IN 
select firstName, lastName
from employees
where officeCode in (2,3)
order by officeCode;

-- is null
select lastName, firstName, reportsTo
from employees
where  reportsTo is null;

-- DISTINCT
select distinct lastName
from employees
order by lastName;

select distinct state, city
from customers
where state is not null
order by state, city
limit 10;

-- JOINS
-- orderdetails and orders
describe orderdetails;
describe orders;

-- o is an alias,
select o.orderNumber, o.comments, sum(quantityOrdered * priceEach)
from orders o
inner join orderdetails d
on o.orderNumber = d.orderNumber;

-- Products and ProductLines
describe products;
describe productlines;

-- Question: perform an inner join on the attribute productline
select productCode, productName 
from products p
inner join productlines pl
on p.productline = pl.productline;

-- join on three tables
describe orders;

select orderNumber, orderDate, productName, priceEach
from orders
inner join orderdetails using (orderNumber)
inner join products using (productCode)
limit 10;


-- Question, modify the query above to do an inner join on customerNumber with the 
-- customers table

select orderNumber, orderDate, productName, priceEach
from orders
inner join orderdetails using (orderNumber)
inner join products using (productCode)
inner join customers using (customerNumber);

-- Left Join
select c.customerNumber, c.customerName, o.orderNumber
from customers c
left join orders o on 
o.customerNumber = c.customerNumber;

