-- Table Formating using case statements. Converting Meausre feilds into Dimensional Feilds.
-- See IBM Tableau Project onTableau Public page, User Grant Hakanson.

-- Converting Data Ranges Into Nominal Values

-- Data Range conversion Column 1
alter table dbo.ibmdata
add Monthlyincome_Dim as 
(Case
	When monthlyincome between 1009 and 3018 then 'Very Low Income'
	when monthlyincome between 3018 and 6856 then 'Low Income'
	when monthlyincome between 6856 and 15427 then 'Moderate Income'
	When monthlyincome between 15427 and 17713 then 'High Income'
	when monthlyincome between 17714 and 19999 then 'Very High Income'
	end)
	
	
------------------------------------------------------------------------------------------------------------------------------------
-- Data Range conversion Column 2
alter table dbo.ibmdata
add Percent_Salary_Increase_Dim as 
(Case
	When percentsalaryhike between 11 and 13 then 'Very Low Increase'
	when percentsalaryhike between 13 and 15 then 'Low Increase'
	when percentsalaryhike between 15 and 17 then 'Moderate Increase'
	When percentsalaryhike between 17 and 20 then 'High Increase'
	when percentsalaryhike between 20 and 25 then 'Very High Increase'
	end)
-----------------------------------------------------------------------------------------------------------------------------------	
-- Data Range conversion Column 3

alter table dbo.ibmdata
add DistanceFromHome_dim as 
(Case
	When distancefromhome between 1 and 5 then 'Very Short Distance'
	when distancefromhome between 5 and 9 then 'Short Distance'
	when distancefromhome between 9 and 15 then 'Moderate Distance'
	When distancefromhome between 15 and 22 then 'Long Distance'
	when distancefromhome between 22 and 29 then 'Very Long Distance'
	end)
----------------------------------------------------------------------------------------------------------------------------------
-- Data Range conversion Column 4

alter table dbo.ibmdata
add AgeRange_Dim as 
(Case
	When Age between 18 and 26 then '18-26yrs'
	when age between 26 and 34 then '26-34yrs'
	when age between 34 and 42 then '34-42yrs'
	When age between 42 and 50 then '42-50yrs'
	when age between 50 and 60 then '50-60yrs'
	end)

-----------------------------------------------------------------------------------------------------------------------------------
	-- Data Range conversion Column 5

alter table dbo.ibmdata
add Totalworkingyears_Dim as 
(Case
	When Totalworkingyears between 0 and 8 then '0-8yrs'
	when Totalworkingyears between 8 and 16 then '8-16yrs'
	when Totalworkingyears between 16 and 24 then '16-24yrs'
	When Totalworkingyears between 24 and 32 then '24-32yrs'
	when Totalworkingyears between 32 and 40 then '32-40yrs'
	end)
-----------------------------------------------------------------------------------------------------------------------------------
-- Data Range conversion Column 6

alter table dbo.ibmdata
add yearswithcurrmanager_Dim as 
(Case
	When yearswithcurrmanager between 0 and 4 then '0-4yrs'
	when yearswithcurrmanager between 4 and 8 then '4-8yrs'
	when yearswithcurrmanager between 8 and 12 then '8-12yrs'
	When yearswithcurrmanager between 12 and 16 then '12-16yrs'
	when yearswithcurrmanager between 16 and 20 then '16-20yrs'
	end)
-----------------------------------------------------------------------------------------------------------------------------------
-- Data Range conversion Column 7

alter table dbo.ibmdata
add yearssincelastpromotion_Dim as 
(Case
	When yearssincelastpromotion between 0 and 3 then '0-3yrs'
	when yearssincelastpromotion between 3 and 6 then '3-6yrs'
	when yearssincelastpromotion between 6 and 9 then '6-9yrs'
	When yearssincelastpromotion between 9 and 12 then '9-12yrs'
	when yearssincelastpromotion between 12 and 15 then '12-15yrs'
	end)
----------------------------------------------------------------------------------------------------------------------------------
	-- Data Range conversion Column 8

alter table dbo.ibmdata
add yearssincelastpromotion_Dim as 
(Case
	When yearssincelastpromotion between 0 and 3 then '0-3yrs'
	when yearssincelastpromotion between 3 and 6 then '3-6yrs'
	when yearssincelastpromotion between 6 and 9 then '6-9yrs'
	When yearssincelastpromotion between 9 and 12 then '9-12yrs'
	when yearssincelastpromotion between 12 and 15 then '12-15yrs'
	end)

-----------------------------------------------------------------------------------------------------------------------------------
--Turing Numeric Values into Nominal Values
-- Numeric to Nominal Column 1

alter table dbo.ibmdata
add Education_Dim as
(case
	when education = 1 then 'very low Education'
	when education = 2 then 'low Education'
	when education = 3 then 'moderate Education'
	when education = 4 then 'high Education'
	when education = 5 then 'very high Education'
	else 'null'
end)
 ----------------------------------------------------------------------------------------------------------------------------------
-- Numeric to Nominal Column 2

alter table dbo.ibmdata
add EnvironmentalSatisfaction_Dim as
(case
	when environmentsatisfaction = 1 then 'very low'
	when environmentsatisfaction = 2 then 'low'
	when environmentsatisfaction = 3 then 'moderate'
	when environmentsatisfaction = 4 then 'high'
	when environmentsatisfaction = 5 then 'very high'
	else 'null'
end)



-----------------------------------------------------------------------------------------------------------------------------------
-- Numeric to Nominal Column 3

alter table dbo.ibmdata
add JobInvolvement_Dim as
(case
	when jobinvolvement = 1 then 'very low involvement '
	when jobinvolvement = 2 then 'low involvement'
	when jobinvolvement = 3 then 'moderate involvement'
	when jobinvolvement = 4 then 'high involvement'
	when jobinvolvement = 5 then 'very high involvement'
	else 'null'
end)

-----------------------------------------------------------------------------------------------------------------------------------
-- Numeric to Nominal Column 4

alter table dbo.ibmdata
add JobLevel_Dim as
(case
	when joblevel = 1 then 'very low level '
	when joblevel = 2 then 'low level'
	when joblevel = 3 then 'moderate level'
	when joblevel = 4 then 'high level'
	when joblevel = 5 then 'very high level'
	else 'null'
end)
----------------------------------------------------------------------------------------------------------------------------------
-- Numeric to Nominal Column 5

alter table dbo.ibmdata
add JobSatisfaction_Dim as
(case
	when jobsatisfaction = 1 then 'very low satisfaction '
	when jobsatisfaction = 2 then 'low level satisfaction'
	when jobsatisfaction = 3 then 'moderate satisfaction'
	when jobsatisfaction = 4 then 'high satisfaction'
	when jobsatisfaction = 5 then 'very high satisfaction'
	else 'null'
end)
-----------------------------------------------------------------------------------------------------------------------------------
-- Numeric to Nominal Column 6

alter table dbo.ibmdata
add PerformanceRating_Dim as
(case
	when performancerating = 1 then 'very low rating '
	when performancerating = 2 then 'low level rating'
	when performancerating = 3 then 'moderate rating'
	when performancerating = 4 then 'high rating'
	when performancerating = 5 then 'very high rating'
	else 'null'
end)
-----------------------------------------------------------------------------------------------------------------------------------
-- Numeric to Nominal Column 7

alter table dbo.ibmdata
add RelationshipSatisfaction_Dim as
(case
	when relationshipsatisfaction = 1 then 'very low Rel-satisfaction '
	when relationshipsatisfaction = 2 then 'low level Rel-satisfaction'
	when relationshipsatisfaction = 3 then 'moderate Rel-satisfaction'
	when relationshipsatisfaction = 4 then 'high Rel-satisfaction'
	when relationshipsatisfaction = 5 then 'very high Rel-satisfaction'
	else 'null'
end)
------------------------------------------------------------------------------------------------------------------------------------
-- Numeric to Nominal Column 8

alter table dbo.ibmdata
add WorkLifeBalance_Dim as
(case
	when worklifebalance = 1 then 'very low WLB '
	when worklifebalance = 2 then 'low level WLB'
	when worklifebalance = 3 then 'moderate WLB'
	when worklifebalance = 4 then 'high WLB'
	when worklifebalance = 5 then 'very high WLB'
	else 'null'
end)

-----------------------------------------------------------------------------------------------------------------------------------
-- Numeric to Nominal Column 9
alter table dbo.ibmdata
add StockOptions_Dim as 
(Case
	When stockoptionlevel = 0 then 'No Options'
	when stockoptionlevel = 1 then 'Low Options'
	when stockoptionlevel = 2 then 'Moderate Options'
	when stockoptionlevel = 3 then 'Many Options' 
end)

