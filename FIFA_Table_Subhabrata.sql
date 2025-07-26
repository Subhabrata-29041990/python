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
/*1. Retrieve all player' information from the table*/
SELECT * FROM Fifa_D;


/*4. List the names, clubs, and wages of players who prefer their left foot*/
SELECT Name,Club,Wage FROM Fifa_D where Preferred_Foot='Left';

/*2. Get the names and ages of players with an overall rating above 85 */
SELECT Name,Age,Overall_rating FROM Fifa_D where Overall_rating>85;

/*5. Retrieve players' names, ages, and weights who weigh over 70 kg and have a penalty 
rating above 70 */
SELECT Name,Age,weight,Penalties FROM Fifa_D where weight>70 and Penalties>70;

/*6. Get the average overall rating of players in the table*/
select Name,avg(Overall_rating) from Fifa_D Group by Name;

/*7. Find the tallest player's name, height, and jersey number*/
select Name,Height,Jersey_No from Fifa_D
Where Height in (Select max(Height) from Fifa_D);

/*8. List the name of the player whose age is between 18 to 25*/
select Name from Fifa_D where Age between 18 and 25;

/*9. Find the nationality, value, and preferred foot of players with a potential rating above 90*/
Select Nationality,Value,Preferred_Foot from Fifa_D where Potential_rating>90;

/*10. Retrieve players with a wage greater than 100,000 and a potential rating above 85*/
Select * from Fifa_D where wage>100000 and Potential_rating>85;

/*11. List the names and heights of players who are taller than 180 cm and weigh less than 
75 kg*/
Select * from Fifa_D where Fina_height>180 and weight<75;

/*12. Retrieve players with a potential rating greater than their overall rating*/
Select * from Fifa_D where Potential_rating>Overall_rating;

/*13. Find the average value of players from each nationality, ordered by average value in 
descending order*/
Select Nationality,avg(Value) as avg_val from Fifa_D 
group by Nationality order by avg_val desc;

/*15. Get the total number of players in the table*/
select count(*) from Fifa_D;

/*16. Find the average age of players who prefer their right foot*/
select Preferred_Foot,avg(Age) as avg_age from Fifa_D
where Preferred_Foot='Right' group by Preferred_Foot;
/*18. List the names and clubs of players whose jersey number is less than 10 and have a 
potential rating above 80*/
select Name,Club from Fifa_D where Jersey_No<10 and Potential_rating>80;
/*20. What is the total wage given to all players? What's the average and standard 
deviation?*/
select Sum(Wage) from Fifa_D;
/*21. Which player has the highest wage? Who has the lowest?*/
select max(Wage) from Fifa_D;

select min(Wage) from Fifa_D;

/*39. How many left-footed players are in each club?*/
Select count(*),Preferred_foot from Fifa_D where Preferred_foot='Left'
 group by Preferred_foot;

 
 

 


