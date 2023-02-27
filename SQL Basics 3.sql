# Resource: https://www.youtube.com/watch?v=w3ea4fKiS2g

# Data Cleaning in SQL [Using snow_fin_hist data tables]

#Trimming Types (Removing Spaces in field Values to prevent duplicates in SQL). 
	#LTRIM(String)
		#Removes leading spaces from String
    #RTRIM(String)
		#Removes Trailing Spaces from string
    #TRIM(String)
		#Removes both leading and Trailing spaces from string
        
select * from customers; 
select * from snow; 

SELECT 
    Profession, COUNT(*) AS profession_count
FROM
    customers
GROUP BY profession;

#example using Trim()
SELECT 
    Trim(Profession) as Attempting__TRIM, COUNT(*) AS profession_count
FROM
    customers
GROUP BY profession;

#example using LTrim()
SELECT 
    LTrim(Profession) as Attempting__LTRIM, COUNT(*) AS profession_count
FROM
    customers
GROUP BY profession;

#example using RTrim()
SELECT 
    RTrim(Profession) as Attempting__RTRIM, COUNT(*) AS profession_count
FROM
    customers
GROUP BY profession;

#Learning Left and Right Functions
	#Left(string, length) - Returns specified charectors left of the string.
    #Right(string, length) - Returns specified charectors Right of the string.

# Right() function used
SELECT 
    RTrim(Profession) as Attempting__RTRIM, COUNT(*) AS profession_count, Right(Gender, 4) as Gender_2
FROM
    customers
GROUP BY profession, Gender;

# Left() function used
SELECT 
    RTrim(Profession) as Attempting__RTRIM, Left(Gender, 3) as Gender_2, COUNT(*) AS profession_count
FROM
    customers
GROUP BY profession, Gender_2;

select * from customers; 

#Learning Transformations using LPad() and Rpad()
	#LPAD(str, len, padstr) - pads a string with another string leftward.
    #RPAD(str,len, padstr) - pads a string with another string rightward.

#Using Lpad

SELECT 
    Volume, lpad(volume,7,'$')
FROM
    snow;
    
#Using rpad

SELECT 
    Volume, rpad(volume,7,"*")
FROM
    snow;

#Returning specific sement of string field values using Substring(str,pos,len)
	#Substring(str,pos,len) - Returns a specified number of charectors from a particular position of a given string. 

SELECT 
    Volume, substring(volume,2,4) as Substring_Volume_Value
FROM
    snow;
    
#Length Function in select and where clause.

#Using Length function in Select. Length(str,pos,len)
Select 
	Volume, Length(volume)
From 
	Snow;
    
#Using Length(str,pos,len) under where Clause and select clause.
 
 Select 
	Volume, Length(volume)
From 
	Snow
Where
Length(Volume)>6;

#Using Locate(substr, str) & Position(substring(str,pos,len))
	#Position(substring(str,pos,len)) -returns the position of a substring within a string.
    #Locate(substr, str) - Returns the position of a substring within a string.
    
    select * from customers;

Selec


