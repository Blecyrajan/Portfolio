create database sales_analysis;

use sales_analysis;

show databases;

#creating a new table
create table sales(order_id int primary key, order_date date, region varchar(20), product varchar(20), category varchar(30), quantity int, price int, revenue int);

desc sales;

INSERT INTO sales VALUES
(1001,'2024-01-05','North','Laptop','Electronics',2,50000,100000),
(1002,'2024-01-06','South','Chair','Furniture',4,3000,12000),
(1003,'2024-01-07','East','Printer','Office',1,15000,15000),
(1004,'2024-01-08','West','Mobile','Electronics',3,20000,60000),
(1005,'2024-02-02','North','Desk','Furniture',2,8000,16000),
(1006,'2024-02-05','South','Laptop','Electronics',1,50000,50000),
(1007,'2024-02-10','East','Mobile','Electronics',2,20000,40000),
(1008,'2024-02-15','West','Chair','Furniture',5,3000,15000);

select * from sales;

show databases;

show tables;

show tables;

select * from sales;

#-------Upto now, created database, created table and inserted values into it and verified----#

#Starting querying based on the data

#Total revenue
SELECT SUM(revenue) AS total_revenue FROM sales;

#Revenue by Region
SELECT region, SUM(revenue) AS revenue
FROM sales
GROUP BY region;

#Revenue by Product
SELECT product, SUM(revenue) AS revenue
FROM sales
GROUP BY product
ORDER BY revenue DESC;

#Revenue by category
SELECT category, SUM(revenue) AS revenue
FROM sales
GROUP BY category;

#Monthly revene
SELECT MONTH(order_date) AS month, SUM(revenue) AS revenue
FROM sales
GROUP BY MONTH(order_date);

#Electronics sales only
SELECT * FROM sales
WHERE category = 'Electronics';

#High value orders
SELECT * FROM sales
WHERE revenue > 40000;

#Top 2 products
SELECT product, SUM(revenue) AS revenue
FROM sales
GROUP BY product
ORDER BY revenue DESC
LIMIT 2;

#Average revenue
SELECT AVG(revenue) AS avg_revenue
FROM sales;

SELECT product,
CASE
    WHEN sum(revenue) >= 50000 THEN 'High'
    ELSE 'Low'
END AS revenue_category
FROM sales
GROUP BY product;









