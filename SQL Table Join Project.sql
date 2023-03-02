--- This Project Will Demonstrate how to use the 
--- Join functions via premade tables and joing regions to form a larger table

--- Items Complet below
	-- Creation of regional tables and unioning them together.
	-- Joining data of both Marketing and Financial KPI tables for the West Region.
	-- Finding all Combinations of the company Pasta Bar using WITH and Cross Join.  
	
-- Creating and joining Tables to make a Larger data set: 

--Midwest Table

CREATE TABLE Midwest (
    Office_ID INT,
    State VARCHAR(255),
    City VARCHAR(255),
    General_Manager VARCHAR(255),
    Total_Sales DECIMAL(10,2),
    Gross_Profit_Margin DECIMAL(5,2),
    Net_Profit_Margin DECIMAL(5,2),
    Working_Capital DECIMAL(10,2),
    Operating_Cash_Flow DECIMAL(10,2),
    Return_on_Equity DECIMAL(5,2),
    COGS DECIMAL(10,2),
    Day_Sales_Outstanding INT,
    Sales_Growth DECIMAL(5,2),
    Repeat_Purchase_Rate DECIMAL(5,2),
    Average_Order_Value DECIMAL(10,2),
    PRIMARY KEY (Office_ID)
);

INSERT INTO Midwest VALUES 
(1, 'Illinois', 'Chicago', 'John Smith', 100000.00, 0.25, 0.15, 50000.00, 25000.00, 0.20, 60000.00, 30, 0.10, 0.50, 150.00),
(2, 'Ohio', 'Cleveland', 'Jane Doe', 75000.00, 0.30, 0.20, 25000.00, 15000.00, 0.18, 45000.00, 25, 0.05, 0.40, 125.00),
(3, 'Michigan', 'Detroit', 'Sam Johnson', 125000.00, 0.20, 0.10, 75000.00, 35000.00, 0.15, 80000.00, 35, 0.15, 0.60, 175.00),
(4, 'Indiana', 'Indianapolis', 'Bob Williams', 90000.00, 0.28, 0.18, 30000.00, 20000.00, 0.22, 54000.00, 28, 0.08, 0.45, 140.00),
(5, 'Wisconsin', 'Madison', 'Sara Lee', 80000.00, 0.32, 0.22, 40000.00, 30000.00, 0.25, 48000.00, 22, 0.12, 0.55, 135.00),
(6, 'Minnesota', 'Minneapolis', 'Tom Brown', 110000.00, 0.23, 0.13, 65000.00, 45000.00, 0.18, 66000.00, 32, 0.20, 0.70, 190.00),
(7, 'Iowa', 'Des Moines', 'Lisa Davis', 65000.00, 0.33, 0.23, 20000.00, 10000.00, 0.19, 39000.00, 20, 0.03, 0.35, 100.00),
(8, 'Missouri', 'Kansas City', 'Mike Thompson', 85000.00, 0.25, 0.15, 40000.00, 30000.00, 0.16, 51000.00, 27, 0.10, 0.50, 155.00),
(9, 'Nebraska', 'Omaha', 'Emily Rodriguez', 95000.00, 0.27, 0.17, 50000.00, 35000.00, 0.21, 57000.00, 30, 0.15, 0.60, 170.00),
(10, 'North Dakota', 'Fargo', 'Jacob Martinez', 70000.00, 0.31, 0.21, 25000.00, 20000.00, 0.17, 42000.00, 23, 0.05, 0.40, 130.00);


CREATE TABLE Southwest (
    Office_ID INT,
    State VARCHAR(255),
    City VARCHAR(255),
    General_Manager VARCHAR(255),
    Total_Sales DECIMAL(10,2),
    Gross_Profit_Margin DECIMAL(5,2),
    Net_Profit_Margin DECIMAL(5,2),
    Working_Capital DECIMAL(10,2),
    Operating_Cash_Flow DECIMAL(10,2),
    Return_on_Equity DECIMAL(5,2),
    COGS DECIMAL(10,2),
    Day_Sales_Outstanding INT,
    Sales_Growth DECIMAL(5,2),
    Repeat_Purchase_Rate DECIMAL(5,2),
    Average_Order_Value DECIMAL(10,2),
    PRIMARY KEY (Office_ID)
);

INSERT INTO Southwest (Office_ID, State, City, General_Manager, Total_Sales, Gross_Profit_Margin, Net_Profit_Margin, Working_Capital, 
					   Operating_Cash_Flow, Return_on_Equity, COGS, Day_Sales_Outstanding, Sales_Growth, Repeat_Purchase_Rate, Average_Order_Value)
VALUES
(101, 'Arizona', 'Phoenix', 'John Doe', 1000000.00, 0.50, 0.10, 500000.00, 200000.00, 0.15, 500000.00, 30, 0.05, 0.20, 500.00),
(102, 'Arizona', 'Tucson', 'Jane Smith', 500000.00, 0.45, 0.08, 250000.00, 100000.00, 0.12, 300000.00, 35, 0.03, 0.25, 700.00),
(103, 'Oklahoma', 'Oklahoma City', 'Bob Johnson', 750000.00, 0.60, 0.15, 450000.00, 150000.00, 0.20, 300000.00, 25, 0.08, 0.30, 900.00),
(104, 'Oklahoma', 'Tulsa', 'Samantha Brown', 900000.00, 0.55, 0.12, 600000.00, 250000.00, 0.18, 400000.00, 28, 0.06, 0.22, 600.00),
(105, 'Texas', 'Houston', 'Mike Davis', 1200000.00, 0.70, 0.20, 800000.00, 350000.00, 0.25, 400000.00, 20, 0.12, 0.35, 1000.00),
(106, 'Texas', 'Dallas', 'Emily Wilson', 800000.00, 0.65, 0.18, 500000.00, 200000.00, 0.22, 300000.00, 22, 0.09, 0.28, 750.00),
(107, 'New Mexico', 'Albuquerque', 'David Lee', 600000.00, 0.40, 0.05, 200000.00, 100000.00, 0.08, 360000.00, 40, 0.02, 0.10, 400.00),
(108, 'New Mexico', 'Las Cruces', 'Christina Nguyen', 400000.00, 0.35, 0.03, 150000.00, 50000.00, 0.05, 260000.00, 45, 0.01, 0.12, 300.00),
(109, 'Texas', 'San Antonio', 'Greg Smith', 1100000.00, 0.72, 0.21, 700000.00, 300000.00, 0.27, 380000.00, 18, 0.15, 0.40, 1100.00)

CREATE TABLE West (
    Office_ID INT,
    State VARCHAR(255),
    City VARCHAR(255),
    General_Manager VARCHAR(255),
    Total_Sales DECIMAL(10,2),
    Gross_Profit_Margin DECIMAL(5,2),
    Net_Profit_Margin DECIMAL(5,2),
    Working_Capital DECIMAL(10,2),
    Operating_Cash_Flow DECIMAL(10,2),
    Return_on_Equity DECIMAL(5,2),
    COGS DECIMAL(10,2),
    Day_Sales_Outstanding INT,
    Sales_Growth DECIMAL(5,2),
    Repeat_Purchase_Rate DECIMAL(5,2),
    Average_Order_Value DECIMAL(10,2),
    PRIMARY KEY (Office_ID)
);

INSERT INTO West (Office_ID, State, City, General_Manager, Total_Sales, Gross_Profit_Margin, Net_Profit_Margin, Working_Capital, Operating_Cash_Flow, Return_on_Equity, COGS, Day_Sales_Outstanding, Sales_Growth, Repeat_Purchase_Rate, Average_Order_Value)
VALUES
(101, 'Washington', 'Seattle', 'John Smith', 1000000.00, 0.70, 0.20, 50000.00, 100000.00, 0.25, 700000.00, 45, 0.05, 0.70, 500.00),
(201, 'Oregon', 'Portland', 'Jane Doe', 750000.00, 0.65, 0.15, 45000.00, 80000.00, 0.20, 500000.00, 60, 0.03, 0.65, 550.00),
(301, 'California', 'San Francisco', 'Mark Johnson', 1500000.00, 0.75, 0.25, 90000.00, 150000.00, 0.30, 1000000.00, 30, 0.10, 0.80, 800.00),
(401, 'Nevada', 'Las Vegas', 'Sarah Lee', 500000.00, 0.60, 0.10, 30000.00, 50000.00, 0.15, 400000.00, 90, 0.02, 0.50, 400.00),
(501, 'Utah', 'Salt Lake City', 'David Brown', 300000.00, 0.65, 0.15, 35000.00, 60000.00, 0.18, 200000.00, 50, 0.04, 0.70, 600.00),
(601, 'Idaho', 'Boise', 'Laura Martinez', 200000.00, 0.70, 0.20, 20000.00, 40000.00, 0.22, 140000.00, 35, 0.01, 0.60, 450.00),
(701, 'Montana', 'Billings', 'Tom Wilson', 100000.00, 0.75, 0.25, 15000.00, 30000.00, 0.28, 75000.00, 25, 0.00, 0.50, 350.00),
(801, 'Wyoming', 'Cheyenne', 'Emily Davis', 75000.00, 0.80, 0.30, 10000.00, 20000.00, 0.32, 50000.00, 20, 0.02, 0.60, 400.00),
(901, 'Colorado', 'Denver', 'Brian Johnson', 1000000.00, 0.70, 0.20, 50000.00, 100000.00, 0.25, 700000.00, 45, 0.05, 0.70, 500.00)


CREATE TABLE Southeast (
    Office_ID INT,
    State VARCHAR(255),
    City VARCHAR(255),
    General_Manager VARCHAR(255),
    Total_Sales DECIMAL(10,2),
    Gross_Profit_Margin DECIMAL(5,2),
    Net_Profit_Margin DECIMAL(5,2),
    Working_Capital DECIMAL(10,2),
    Operating_Cash_Flow DECIMAL(10,2),
    Return_on_Equity DECIMAL(5,2),
    COGS DECIMAL(10,2),
    Day_Sales_Outstanding INT,
    Sales_Growth DECIMAL(5,2),
    Repeat_Purchase_Rate DECIMAL(5,2),
    Average_Order_Value DECIMAL(10,2),
    PRIMARY KEY (Office_ID)
);

INSERT INTO Southeast (Office_ID, State, City, General_Manager, Total_Sales, Gross_Profit_Margin, Net_Profit_Margin, Working_Capital, Operating_Cash_Flow, Return_on_Equity, COGS, Day_Sales_Outstanding, Sales_Growth, Repeat_Purchase_Rate, Average_Order_Value) VALUES
(201, 'Florida', 'Miami', 'David Rodriguez', 1000000.00, 0.70, 0.20, 50000.00, 100000.00, 0.25, 700000.00, 45, 0.05, 0.70, 500.00),
(202, 'Georgia', 'Atlanta', 'Sarah Kim', 750000.00, 0.65, 0.15, 45000.00, 80000.00, 0.20, 500000.00, 60, 0.03, 0.65, 550.00),
(203, 'North Carolina', 'Charlotte', 'John Thompson', 1500000.00, 0.75, 0.25, 90000.00, 150000.00, 0.30, 1000000.00, 30, 0.10, 0.80, 800.00),
(204, 'Alabama', 'Birmingham', 'Jessica Davis', 500000.00, 0.60, 0.10, 30000.00, 50000.00, 0.15, 400000.00, 90, 0.02, 0.50, 400.00),
(205, 'South Carolina', 'Columbia', 'Emily Wilson', 300000.00, 0.65, 0.15, 35000.00, 60000.00, 0.18, 200000.00, 50, 0.04, 0.70, 600.00),
(206, 'Mississippi', 'Jackson', 'Tommy Lee', 200000.00, 0.70, 0.20, 20000.00, 40000.00, 0.22, 140000.00, 35, 0.01, 0.60, 450.00),
(207, 'Tennessee', 'Nashville', 'Linda Davis', 100000.00, 0.75, 0.25, 15000.00, 30000.00, 0.28, 75000.00, 25, 0.00, 0.50, 350.00),
(208, 'Kentucky', 'Louisville', 'Anthony Johnson', 75000.00, 0.80, 0.30, 10000.00, 20000.00, 0.32, 50000.00, 20, 0.02, 0.60, 400.00),
(209, 'Virginia', 'Richmond', 'Karen Wilson', 1000000.00, 0.70, 0.20, 50000.00, 100000.00, 0.25, 700000.00, 45, 0.05, 0.70, 500.00)

CREATE TABLE Northeast (
    Office_ID INT,
    State VARCHAR(255),
    City VARCHAR(255),
    General_Manager VARCHAR(255),
    Total_Sales DECIMAL(10,2),
    Gross_Profit_Margin DECIMAL(5,2),
    Net_Profit_Margin DECIMAL(5,2),
    Working_Capital DECIMAL(10,2),
    Operating_Cash_Flow DECIMAL(10,2),
    Return_on_Equity DECIMAL(5,2),
    COGS DECIMAL(10,2),
    Day_Sales_Outstanding INT,
    Sales_Growth DECIMAL(5,2),
    Repeat_Purchase_Rate DECIMAL(5,2),
    Average_Order_Value DECIMAL(10,2),
    PRIMARY KEY (Office_ID)
);

INSERT INTO Northeast (Office_ID, State, City, General_Manager, Total_Sales, Gross_Profit_Margin, Net_Profit_Margin, Working_Capital, 
					   Operating_Cash_Flow, Return_on_Equity, COGS, Day_Sales_Outstanding, Sales_Growth, Repeat_Purchase_Rate, Average_Order_Value)
VALUES
(402, 'New York', 'New York City', 'John Smith', 123456.78, 0.70, 0.20, 50000.00, 75000.00, 0.15, 74000.00, 30, 0.10, 0.80, 150.00),
(403, 'Connecticut', 'Hartford', 'Jane Doe', 78901.23, 0.75, 0.25, 25000.00, 45000.00, 0.20, 63000.00, 25, 0.08, 0.70, 120.00),
(404, 'New Jersey', 'Trenton', 'William Brown', 456789.12, 0.80, 0.30, 80000.00, 100000.00, 0.25, 420000.00, 20, 0.12, 0.85, 200.00),
(405, 'New York', 'Albany', 'Julia Wilson', 234567.89, 0.75, 0.25, 35000.00, 55000.00, 0.18, 190000.00, 35, 0.15, 0.75, 180.00),
(406, 'Pennsylvania', 'Philadelphia', 'David Johnson', 98765.43, 0.70, 0.20, 45000.00, 70000.00, 0.14, 90000.00, 40, 0.05, 0.60, 100.00),
(407, 'Massachusetts', 'Boston', 'Emily Garcia', 65432.10, 0.75, 0.25, 50000.00, 85000.00, 0.22, 54000.00, 22, 0.18, 0.90, 250.00),
(408, 'New Hampshire', 'Concord', 'Michael Hernandez', 345678.90, 0.85, 0.35, 75000.00, 110000.00, 0.30, 220000.00, 15, 0.20, 0.75, 300.00),
(409, 'Rhode Island', 'Providence', 'Ashley Martinez', 210987.65, 0.80, 0.30, 60000.00, 95000.00, 0.26, 125000.00, 18, 0.13, 0.65, 130.00),
(410, 'Maine', 'Augusta', 'James Lee', 87654.32, 0.70, 0.20, 40000.00, 60000.00, 0.17, 84000.00, 28, 0.08, 0.80, 160.00)

-- Creating Table From Union of all Regions

Create table US_Findata as
SELECT * FROM Northeast
UNION ALL
SELECT * FROM West
UNION ALL
SELECT * FROM Southeast
UNION ALL
SELECT * FROM Southwest;

--- Tasks LEft to Add and join tables that can be utilized to do other joins with valid use cases. 

--- West Coast Marketing Data Left Join and Right Join

CREATE TABLE West_MktKPIs (
    Office_ID INT,
    State VARCHAR(255),
    City VARCHAR(255),
    Leads INT,
    CLTV DECIMAL(10,2),
    CAC DECIMAL(10,2),
    Conversion_Rate DECIMAL(5,2),
    PRIMARY KEY (Office_ID)
);

INSERT INTO West_MktKPIs (Office_ID, State, City, Leads, CLTV, CAC, Conversion_Rate)
VALUES
(101, 'Washington', 'Seattle', 500, 1000.00, 500.00, 0.10),
(201, 'Oregon', 'Portland', 400, 750.00, 400.00, 0.08),
(301, 'California', 'San Francisco', 800, 1500.00, 1000.00, 0.12),
(401, 'Nevada', 'Las Vegas', 250, 500.00, 250.00, 0.05),
(501, 'Utah', 'Salt Lake City', 150, 600.00, 300.00, 0.10),
(601, 'Idaho', 'Boise', 100, 450.00, 200.00, 0.08),
(701, 'Montana', 'Billings', 50, 350.00, 150.00, 0.06),
(801, 'Wyoming', 'Cheyenne', 30, 400.00, 200.00, 0.05),
(901, 'Colorado', 'Denver', 500, 1000.00, 500.00, 0.10)

-- Adding % format
Alter table west_mktkpis
add column PercentFormat_Conversion_Rate INT;

update west_mktkpis
set conversion_rate = CONCAT(Conversion_Rate * 100, '%'); 

-- Left, Right, and inner joins of the west and west_mktkpis tables

-- Finding all the combinationa at the company Pasta Bar using Cross Join and With

CREATE TABLE Company_Pasta_Bar (
    Vegetables VARCHAR(50),
    Spices VARCHAR(50),
    Sauces VARCHAR(50),
    Meats VARCHAR(50),
    Pastas VARCHAR(50)
);
-- Putting in all possible field values in the Company_Pasta_Bar Table
INSERT INTO Company_Pasta_Bar (Vegetables, Spices, Sauces, Meats, Pastas)
VALUES
('Spinach', 'Garlic', 'Marinara', 'Chicken', 'Penne'),
('Eggplant', 'Cumin', 'Alfredo', 'Beef', 'Fettuccine'),
('Bell Peppers', 'Paprika', 'Pesto', 'Shrimp', 'Linguine'),
('Mushrooms', 'Thyme', 'Bolognese', 'Pork', 'Rigatoni'),
('Zucchini', 'Oregano', 'Arrabbiata', 'Lamb', 'Farfalle');

-- Getting all the meat and pasta combinations

create table Company_Pasta_Bar_copy as
Select * 
from company_pasta_bar;

WITH 
Veg AS (
    SELECT Vegetables
    FROM company_pasta_bar
),
Sauce AS (
    SELECT Sauces
    FROM company_pasta_bar
),
Meat AS (
    SELECT Meats
    FROM company_pasta_bar
),
Pasta AS (
    SELECT Pastas
    FROM company_pasta_bar
),
Spices AS (
    SELECT spices 
    FROM company_pasta_bar
)
SELECT *
FROM veg
CROSS JOIN meat
CROSS JOIN sauce
CROSS JOIN spices
CROSS JOIN pasta;

	
