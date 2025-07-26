CREATE DATABASE FIFA;
USE FIFA;

drop table Fifa_D;
CREATE TABLE Fifa_D(
ID	INT PRIMARY KEY,
Name	VARCHAR(60),
Age	INT,
Nationality	VARCHAR(50),
Overall_rating	INT,
Potential_rating	INT,
Club	VARCHAR(60),
Value	DECIMAL(15,2),
Wage	INT,
Preferred_Foot	VARCHAR(10),
Jersey_No	INT,
Height	INT,
Fina_Height	INT,
Final_Height	INT,
Weight	INT,
Penalties INT
);
desc Fifa_D;

Show variables like 'secure_file_priv';

set secure_file_priv="";

USE  FIFA;
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/FIFA_Dataset_1.csv"
INTO TABLE Fifa_D
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/FIFA_Dataset_1.csv'
INTO TABLE Fifa_D_modified
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT * FROM Fifa_D;



SELECT Name,Club,Wage FROM Fifa_D where Preferred_Foot='Left';


SELECT Name,Age,Overall_rating FROM Fifa_D where Overall_rating>85;


SELECT Name,Age,weight,Penalties FROM Fifa_D where weight>70 and Penalties>70;

select Name,Sum(Overall_rating) from Fifa_D Group by Name;

select Name,avg(Overall_rating) from Fifa_D Group by Name;

select Name,Height,Jersey_No from Fifa_D
Where Height in (Select max(Height) from Fifa_D);

select Name from Fifa_D where Age between 18 and 25;

Select Nationality,Value,Preferred_Foot from Fifa_D where Potential_rating>90;

Select * from Fifa_D where wage>100000 and Potential_rating>85;

Select * from Fifa_D where Fina_height>180 and weight<75;

Select * from Fifa_D where Potential_rating>Overall_rating;

Select Nationality,avg(Value) as avg_val from Fifa_D 
group by Nationality order by avg_val desc;

select count(*) from Fifa_D;

select Preferred_Foot,avg(Age) as avg_age from Fifa_D
where Preferred_Foot='Right' group by Preferred_Foot;

select Name,Club from Fifa_D where Jersey_No<10 and Potential_rating>80;

select Sum(Wage) from Fifa_D;

select max(Wage) from Fifa_D;

select min(Wage) from Fifa_D;

select count(*),Preferred_foot from Fifa_D
where preferred_foot='Left' or preferred_foot='Right'
group by preferred_foot;

Select count(*),Preferred_foot from Fifa_D where Preferred_foot='Left'
 group by Preferred_foot;
 
 Select count(*),max(Potential_rating) from Fifa_D;
 
 

 


