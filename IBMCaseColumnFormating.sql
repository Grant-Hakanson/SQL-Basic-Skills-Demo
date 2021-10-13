-- Table Formating using case statements. See IBM Tableau Project on Tableau Public page, User Grant Hakanson.



-- New Column 1

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
-- Column 2

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
-- Column 3

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
--Column 4

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
-- Column 5

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
-- Column 6

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
-- Column 7

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
-- Column 8

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


