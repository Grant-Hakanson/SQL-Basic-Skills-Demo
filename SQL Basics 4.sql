Create Table SalesData (
  SalesEmployee VARCHAR(255) NOT NULL,
  SalesRegion VARCHAR(255) NOT NULL,
  Manager VARCHAR(255) NOT NULL,
  SalesContractType VARCHAR(255) NOT NULL,
  ATV DECIMAL(10,2) NOT NULL,
  TotalSalesAmount DECIMAL(10,2) NOT NULL,
  COGS DECIMAL(10,2) NOT NULL,
  Profit DECIMAL(10,2) NOT NULL,
  DateOfSale DATE NOT NULL
); 

INSERT INTO SalesData (SalesEmployee, SalesRegion, Manager, SalesContractType, ATV, TotalSalesAmount, COGS, Profit, DateOfSale)
VALUES
('John Smith', 'East', 'Adam Johnson', 'New Customer', 100.00, 1000.00, 500.00, 500.00, '2022-01-01'),
('Emily Davis', 'West', 'Sarah Lee', 'Renewal', 125.50, 1500.50, 900.00, 600.50, '2022-01-02'),
('Michael Chen', 'North', 'Jessica Wong', 'New Customer', 200.00, 2000.00, 1200.00, 800.00, '2022-01-03'),
('Ashley Thompson', 'South', 'Tom Johnson', 'Renewal', 250.25, 2500.25, 1500.00, 1000.25, '2022-01-04'),
('Jacob Brown', 'East', 'Adam Johnson', 'New Customer', 300.00, 3000.00, 1800.00, 1200.00, '2022-01-05'),
('Megan Wilson', 'West', 'Sarah Lee', 'Renewal', 350.75, 3500.75, 2100.00, 1400.75, '2022-01-06'),
('Justin Kim', 'North', 'Jessica Wong', 'New Customer', 400.00, 4000.00, 2400.00, 1600.00, '2022-01-07'),
('Hannah Lee', 'South', 'Tom Johnson', 'Renewal', 450.50, 4500.50, 2700.00, 1800.50, '2022-01-08'),
('Kevin Wong', 'East', 'Adam Johnson', 'New Customer', 500.00, 5000.00, 3000.00, 2000.00, '2022-01-09'),
('Natalie Garcia', 'West', 'Sarah Lee', 'Renewal', 550.25, 5500.25, 3300.00, 2200.25, '2022-01-10'),
('David Park', 'North', 'Jessica Wong', 'New Customer', 600.00, 6000.00, 3600.00, 2400.00, '2022-01-11'),
('Samantha Kim', 'South', 'Tom Johnson', 'Renewal', 650.75, 6500.75, 3900.00, 2600.75, '2022-01-12'),
('Daniel Lee', 'East', 'Adam Johnson', 'New Customer', 700.00, 7000.00, 4200.00, 2800.00, '2022-01-13'),
('Olivia Miller', 'West', 'Sarah Lee', 'Renewal', 750.50, 7500.50, 4500.00, 3000.50, '2022-01-14'),
('Andrew Chen', 'North', 'Jessica Wong', 'New Customer', 800.00, 8000.00, 4800.00, 3200.00, '2022-01-15');
('Mary Johnson', 'East', 'Adam Johnson', 'New Customer', 900.00, 9000.00, 5400.00, 3600.00, '2022-01-16'),
('Erica Brown', 'West', 'Sarah Lee', 'Renewal', 950.25, 9500.25, 5700.00, 3800.25, '2022-01-17'),
('William Chen', 'North', 'Jessica Wong', 'New Customer', 1000.00, 10000.00, 6000.00, 4000.00, '2022-01-18'),
('Rachel Thompson', 'South', 'Tom Johnson', 'Renewal', 1050.50, 10500.50, 6300.00, 4200.50, '2022-01-19'),
('Emma Davis', 'East', 'Adam Johnson', 'New Customer', 1100.00, 11000.00, 6600.00, 4400.00, '2022-01-20'),
('Henry Wilson', 'West', 'Sarah Lee', 'Renewal', 1150.75, 11500.75, 6900.00, 4600.75, '2022-01-21'),
('Grace Kim', 'North', 'Jessica Wong', 'New Customer', 1200.00, 12000.00, 7200.00, 4800.00, '2022-01-22'),
('Lucas Lee', 'South', 'Tom Johnson', 'Renewal', 1250.50, 12500.50, 7500.00, 5000.50, '2022-01-23'),
('Sophia Wong', 'East', 'Adam Johnson', 'New Customer', 1300.00, 13000.00, 7800.00, 5200.00, '2022-01-24'),
('Anthony Garcia', 'West', 'Sarah Lee', 'Renewal', 1350.25, 13500.25, 8100.00, 5400.25, '2022-01-25'),
('Ava Park', 'North', 'Jessica Wong', 'New Customer', 1400.00, 14000.00, 8400.00, 5600.00, '2022-01-26'),
('Ethan Kim', 'South', 'Tom Johnson', 'Renewal', 1450.75, 14500.75, 8700.00, 5800.75, '2022-01-27'),
('Isabella Lee', 'East', 'Adam Johnson', 'New Customer', 1500.00, 15000.00, 9000.00, 6000.00, '2022-01-28'),
('Jackson Miller', 'West', 'Sarah Lee', 'Renewal', 1550.50, 15500.50, 9300.00, 6200.50, '2022-01-29'),
('Madison Chen', 'North', 'Jessica Wong', 'New Customer', 1600.00, 16000.00, 9600.00, 6400.00, '2022-01-30'),
('Nicholas Thompson', 'South', 'Tom Johnson', 'Renewal', 1650.75, 16500.75, 9900.00, 6600.75, '2022-01-31');
('John Smith', 'East', 'Adam Johnson', 'New Customer', 100.00, 1000.00, 500.00, 500.00, '2021-01-01'),
('Emily Davis', 'West', 'Sarah Lee', 'Renewal', 125.50, 1500.50, 900.00, 600.50, '2022-02-02'),
('Michael Chen', 'North', 'Jessica Wong', 'New Customer', 200.00, 2000.00, 1200.00, 800.00, '2023-03-03'),
('Ashley Thompson', 'South', 'Tom Johnson', 'Renewal', 250.25, 2500.25, 1500.00, 1000.25, '2021-04-04'),
('Jacob Brown', 'East', 'Adam Johnson', 'New Customer', 300.00, 3000.00, 1800.00, 1200.00, '2022-05-05'),
('Megan Wilson', 'West', 'Sarah Lee', 'Renewal', 350.75, 3500.75, 2100.00, 1400.75, '2023-06-06'),
('Justin Kim', 'North', 'Jessica Wong', 'New Customer', 400.00, 4000.00, 2400.00, 1600.00, '2021-07-07'),
('Hannah Lee', 'South', 'Tom Johnson', 'Renewal', 450.50, 4500.50, 2700.00, 1800.50, '2022-08-08'),
('Kevin Wong', 'East', 'Adam Johnson', 'New Customer', 500.00, 5000.00, 3000.00, 2000.00, '2023-09-09'),
('Natalie Garcia', 'West', 'Sarah Lee', 'Renewal', 550.25, 5500.25, 3300.00, 2200.25, '2021-10-10'),
('David Park', 'North', 'Jessica Wong', 'New Customer', 600.00, 6000.00, 3600.00, 2400.00, '2022-11-11'),
('Samantha Kim', 'South', 'Tom Johnson', 'Renewal', 650.75, 6500.75, 3900.00, 2600.75, '2023-12-12'),
('Daniel Lee', 'East', 'Adam Johnson', 'New Customer', 700.00, 7000.00, 4200.00, 2800.00, '2021-02-13'),
('Olivia Miller', 'West', 'Sarah Lee', 'Renewal', 750.50, 7500.50, 4500.00, 3000.50, '2022-03-14'),
('Andrew Chen', 'North', 'Jessica Wong', 'New Customer', 800.00, 8000.00, 4800.00, 3200.00, '2023-04-15');

select * from salesdata;

-- Total Deals Won
select Count(*) 
from salesdata;

-- Reveue Based Queries

	SELECT SUM(atv) AS total_annual_revenue_retention,
       SUM(totalsalesamount) AS total_sales_revenue,
       ROUND(AVG(totalsalesamount), 2) AS avg_deal_size,
       ROUND(AVG(atv), 2) AS avg_annual_revenue_add,
       MAX(atv) AS largest_atv,
       MAX(totalsalesamount) AS largest_total_deal_amount,
       MIN(atv) AS smallest_atv,
       MIN(totalsalesamount) AS smallest_total_deal_amount
FROM salesdata;
	

-- COGS and Profit
	SELECT 
    SUM(profit) AS total_profit,
    SUM(cogs) AS total_cogs,
    ROUND(AVG(profit), 2) AS average_profit,
    Round(AVG(cogs),2) AS average_cogs,
    MAX(profit) AS largest_profit,
    MAX(cogs) AS largest_cogs,
    MIN(profit) AS smallest_profit,
    MIN(cogs) AS smallest_cogs
FROM salesdata;
	
	
	-- making the date field more usable groupby and order by 
	--- add 
		ALTER TABLE salesdata
		ADD COLUMN year INT,
		ADD COLUMN month INT,
		ADD COLUMN day INT;

		UPDATE salesdata
		SET 
		year = date_part('year', dateofsale),
		month = date_part('month', dateofsale),
		day = date_part('day', dateofsale);

		select * from salesdata;
		
	-- COGS & Profit and Reveue Based Queries Grouped and Ordered 
	--- by Year

	SELECT SUM(atv) AS total_annual_revenue_retention,
       SUM(totalsalesamount) AS total_sales_revenue,
       ROUND(AVG(totalsalesamount), 2) AS avg_deal_size,
       ROUND(AVG(atv), 2) AS avg_annual_revenue_add,
       MAX(atv) AS largest_atv,
       MAX(totalsalesamount) AS largest_total_deal_amount,
       MIN(atv) AS smallest_atv,
       MIN(totalsalesamount) AS smallest_total_deal_amount, YEAR
	FROM salesdata
	group by (year)
	Order by (year);
	
	-- COGS and Profit
	SELECT 
    SUM(profit) AS total_profit,
    SUM(cogs) AS total_cogs,
    ROUND(AVG(profit), 2) AS average_profit,
    Round(AVG(cogs),2) AS average_cogs,
    MAX(profit) AS largest_profit,
    MAX(cogs) AS largest_cogs,
    MIN(profit) AS smallest_profit,
    MIN(cogs) AS smallest_cogs,YEAR
	FROM salesdata
	group by (year)
	Order by (year);
	
	--- By Month
	
	--- by Year

	SELECT SUM(atv) AS total_annual_revenue_retention,
       SUM(totalsalesamount) AS total_sales_revenue,
       ROUND(AVG(totalsalesamount), 2) AS avg_deal_size,
       ROUND(AVG(atv), 2) AS avg_annual_revenue_add,
       MAX(atv) AS largest_atv,
       MAX(totalsalesamount) AS largest_total_deal_amount,
       MIN(atv) AS smallest_atv,
       MIN(totalsalesamount) AS smallest_total_deal_amount, Month
	FROM salesdata
	group by (Month)
	Order by (Month);
	
	-- COGS and Profit
	SELECT 
		SUM(profit) AS total_profit,
		SUM(cogs) AS total_cogs,
		ROUND(AVG(profit), 2) AS average_profit,
		Round(AVG(cogs),2) AS average_cogs,
		MAX(profit) AS largest_profit,
		MAX(cogs) AS largest_cogs,
		MIN(profit) AS smallest_profit,
		MIN(cogs) AS smallest_cogs,Month
	FROM salesdata
	group by (Month)
	Having max(profit) > 3000
	Order by (Month);
	
	--- by Quarter
	Alter Table salesdata
	add column Quarter text;
	
	
	UPDATE SalesData
	SET quarter = CASE
		WHEN Month IN (1, 2, 3) THEN 'Q1'
		WHEN Month IN (4, 5, 6) THEN 'Q2'
		WHEN Month IN (7, 8, 9) THEN 'Q3'
		WHEN Month IN (10, 11, 12) THEN 'Q4'
    ELSE NULL
    END;
	
	--- Profit and COGS by Quarter
	SELECT 
		SUM(profit) AS total_profit,
		SUM(cogs) AS total_cogs,
		ROUND(AVG(profit), 2) AS average_profit,
		Round(AVG(cogs),2) AS average_cogs,
		MAX(profit) AS largest_profit,
		MAX(cogs) AS largest_cogs,
		MIN(profit) AS smallest_profit,
		MIN(cogs) AS smallest_cogs,Year, quarter
	FROM salesdata
	Group by (year, quarter)
	Order by (year, quarter) desc;
	
	--- Revenue Metrics by Quarter
	SELECT SUM(atv) AS total_annual_revenue_retention,
       SUM(totalsalesamount) AS total_sales_revenue,
       ROUND(AVG(totalsalesamount), 2) AS avg_deal_size,
       ROUND(AVG(atv), 2) AS avg_annual_revenue_add,
       MAX(atv) AS largest_atv,
       MAX(totalsalesamount) AS largest_total_deal_amount,
       MIN(atv) AS smallest_atv,
       MIN(totalsalesamount) AS smallest_total_deal_amount, Year, quarter
	FROM salesdata
	group by (year, quarter)
	Order by (year, quarter) desc;

	



