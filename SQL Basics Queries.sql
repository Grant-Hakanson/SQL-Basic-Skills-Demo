create database snow_fin_hist;
use snow_fin_hist;
#Snow Stock trading data 
SELECT 
    *
FROM
    Snow;

SELECT 
	TradeDate, High
FROM
	Snow;

Select 
	*
FROM 
	Snow;

Select 
	Volume as "Total Volume"
From 
	Snow;
    
Select
	*
FROM
	snow
WHERE
	low <= 24;
    
Select
	*
FROM
	snow
WHERE
	High = 24.75;
    
    # Customer data below

Select
	*
FROM
	customers;
    
Select
	*
FROM
	customers
WHERE 
	Profession like "H%e";

Select
	*
FROM
	customers
WHERE 
	Profession like "H%";

Select
	*
FROM
	customers
WHERE 
	Profession = "Healthcare";
    
Select
	*
FROM
	customers
WHERE 
	Profession like "H%";
    
#Using   in    to sort through data. Only can be used to find exact matches. 
Select
	*
FROM
	customers
WHERE 
	Profession in ("Healthcare", "lawyer");
    
#using   between   to sort through data

Select
	*
FROM
	customers
WHERE  
	Family Size between 1 and 7;
    
#Orderby stuff

Select *
From customers
order by profession desc;
    

    
    
    

    

    
