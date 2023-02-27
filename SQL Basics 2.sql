create database Learningp2;
# data types 
	# Int
    # Decimal (6,2)
    # Varchar(30)
    # Date "yyyy-MM-DD" <- Format
    # Time Stamp " yyyy-MM-DD HH:MM:SS "
    
#Creating a Table using the above Data Type information.
    
Create Table James_Bonds(
id int, 
title Varchar(50), 
released int, 
actor varchar (30),
director Varchar (30), 
Box_Office decimal (5,1)
); 

select * from James_Bonds;

# Contraints
	# Ex1. Primary Key. (Makes a field the key identifier. see field being turned into primary key below.)
    #Ex.2 Unique. (does not allow duplicate values to appear in a feild; see it used below)
    #Ex.3 Not Null (does not allow Null/Empty field values. See used below.)
    # Ex. 4 Defualt ( replaces null values with a default value listed. See Used below)
    
Create Table Contraint_Bond(
id int primary key, 
title Varchar(50) Unique, 
released int Not Null, 
actor varchar (30),
director Varchar (30) default "ah la la", 
Box_Office decimal (5,1) Default "0.0"
); 

# Inserting Data into a created table
Insert into Contraint_Bond Values( 1,"big Booty Bertha", 1965, "Shively6", "Mikey Ice", 59.6);

Select * from Contraint_Bond;

#altering table
	#adding a column
Alter Table Contraint_Bond Add Critic_name varchar(30);

	#Droping a column
Alter table Contraint_Bond Drop Critic_name;

	# Altering table data
    Update Contraint_Bond
    set title= "big Booty Beth"
    Where title= "big Booty Bertha";

Select * from contraint_bond;



