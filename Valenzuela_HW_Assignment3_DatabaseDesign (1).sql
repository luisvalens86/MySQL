/* 	Author: Luis Valenzuela
	Date: 02/18/2023
    Description: HW Assignment 3, Database Design - Thought Exercise
    Revision History
    Name 				Date				Description
    - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	lv					2/18/2023		Inital code framework for to create new Database
    lv					2/24/2023		Create schema 
    lv					2/24/2023		Create a test database:	nyit_1299302_stock_db	
    lv					2/24/2023		what is implied by description attribute?
  
*/

-- Name the database: nyit_1299302_stock_db (last Name)
drop database if exists nyit_1299302_stock_db;
create database nyit_1299302_stock_db;
use nyit_1299302_stock_db;

-- Drop and Recreate table
-- customer_table - [ attributes: customer_id, customer_name, portfolio_num]
drop table if exists customer_table;
create table customer_table (
		customer_id int,  
		customer_name varchar(25),  
        portfolio_num int
        );
        
-- Insert test values into the database table
-- customer_table
insert into customer_table values (25, "george", 1345);
insert into customer_table values (28, "john", 1429);
insert into customer_table values (12, "claire", 1294);
insert into customer_table values (9, "marybeth", 1543);
insert into customer_table values (3, "tom", 1948);

-- test the table by quering 
select * from customer_table;

-- portfolio_table attributes: customer_id, portfolio_num, stock_symbol, purchase_price, purchase_date]
drop table if exists portoflio_table;
create table portfolio_table (
		customer_id int,  
		portfolio_num int,  
        stock_symbol varchar(5),
        purchase_price decimal(5,2),
        purchase_date date
        );
        
-- Insert test values into the database table
-- porfolio_table
insert into portfolio_table values (25, 1345, "MSFT", 259.96, '2022-06-30');
insert into portfolio_table values (28, 1429, "APPL", 146.71, '2020-03-05');
insert into portfolio_table values (12, 1294, "NFLX", 361.46, '2019-03-15');
insert into portfolio_table values (9, 1543, "TSLA", 196.88, '2023-02-23');
insert into portfolio_table values (3, 1948, "DIS", 84.17, '2021-12-28');

-- test the table by quering 
select * from portfolio_table;

-- stock_table - [attributes: symbol, description, last_price, last_date]
-- remove 'description' ask professor 
drop table if exists stock_table;
create table stock_table (
		symbol varchar(5),
        _description varchar(25),
        last_price decimal(5,2),
        last_date date
        );

-- Insert test values into the database table
-- stock_table
insert into stock_table values ("MSFT", "microsoft", 248.90, '2023-02-24');
insert into stock_table values ("APPL", "apple", 146.42, '2023-02-24');
insert into stock_table values ("NFLX", "netflix", 317.00, '2023-02-24');
insert into stock_table values ("TSLA", "tesla", 196.48, '2023-02-24');
insert into stock_table values ("DIS", "disney", 100.35, '2023-02-24');

-- test the table by quering 
select * from stock_table;


-- 4. Your database architect has asked you to populate each table with relevant sample \
-- tuples (rows) of data and then write simple SQL statement to query the tables:

-- a. customer_table: 	SQL = 
select customer_name, portfolio_num 
from customer_table
order by customer_name DESC;

-- b. portfolio_table: SQL =
select SUM(purchase_price) as total_price 
from portfolio_table;

-- c. stock_table: SQL = 
describe stock_table;

select _description, last_price
from stock_table
order by _description ASC;


