CREATE DATABASE SalesDatabase;


USE SalesDatabase;



CREATE TABLE sales_sample (
    Product_Id INT NOT NULL,
    Region VARCHAR(50) NOT NULL,
    Date DATE,
    Sales_Amount NUMERIC NOT NULL
);


INSERT INTO sales_sample (Product_Id, Region, Date, Sales_Amount)
VALUES 
(101, 'North', '2023-01-01', 5000),
(102, 'South', '2023-01-02', 6000),
(103, 'East', '2023-01-03', 7000),
(104, 'West', '2023-01-04', 8000),
(105, 'North', '2023-01-05', 5500),
(106, 'South', '2023-01-06', 6500),
(107, 'East', '2023-01-07', 7500),
(108, 'West', '2023-01-08', 8500),
(109, 'North', '2023-02-01', 5600),
(110, 'South', '2023-02-02', 6700);


--3a
SELECT Region, Product_Id, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY Region, Product_Id
ORDER BY Region, Product_Id;









--3b
SELECT Region, Product_Id, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY ROLLUP(Region, Product_Id)
ORDER BY Region, Product_Id;



--3c
SELECT Product_Id, Region, Date, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY CUBE(Product_Id, Region, Date)
ORDER BY Product_Id, Region, Date;

--3d
SELECT Product_Id, Region, Date, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
WHERE Region = 'East'
GROUP BY Product_Id, Region, Date
ORDER BY Date;

--3d2
SELECT Product_Id, Region, Date, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
WHERE Date BETWEEN '2023-01-01' AND '2023-02-01'
GROUP BY Product_Id, Region, Date
ORDER BY Date;


--4
SELECT Product_Id, Region, Date, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
WHERE (Product_Id = 101 AND Region = 'East')
   OR (Product_Id = 102 AND Region = 'South')
   OR (Date = '2023-01-02')
GROUP BY Product_Id, Region, Date
ORDER BY Date, Product_Id, Region;








