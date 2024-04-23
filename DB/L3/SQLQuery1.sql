create database Events;

create table Event(
EvID int NOT NULL PRIMARY KEY,
EvName varchar(255)
)

create table Planner(
PlannerID int NOT NULL PRIMARY KEY,
PlannerFirstName varchar(255),
PlannerLastName varchar(255) NOT NULL
)

create table Date(
Date_ID int NOT NULL PRIMARY KEY,
Day int,
Month int,
Year int
)

create table Location(
Location_ID int NOT NULL PRIMARY KEY,
Location_Name varchar(255) NOT NULL
)

create table Menu(
Menu_ID int NOT NULL PRIMARY KEY,
Menu_Name varchar(255)
)

create table Partners(
Part_ID int NOT NULL PRIMARY KEY,
Part_Name varchar(255)
)

create table Sponsors(
Sonsor_ID int NOT NULL PRIMARY KEY,
Sponsor_Name varchar(255)
)

create table Sponsorship(
Sponsorship_ID int NOT NULL PRIMARY KEY,
Sponsorship_Sum int
Fk_Sponsorship INT FOREIGN KEY REFERENCES Location(Location_ID)
)


create table Event_Date(
EvID int NOT NULL,
Date_ID int NOT NULL,
FOREIGN KEY (EvID) REFERENCES Event(EvID),
FOREIGN KEY (Date_ID) REFERENCES Date(Date_ID),
UNIQUE (EvID, Date_ID)
)

create table Event_Loc(
EvID int NOT NULL,
Location_ID int NOT NULL,
FOREIGN KEY (EvID) REFERENCES Event(EvID),
FOREIGN KEY (Location_ID) REFERENCES Location(Location_ID),
UNIQUE (EvID, Location_ID)
)


create table Planners_Partners(
Planner_ID int not NULL,
Partners_ID int not NULL,
FOREIGN KEY (Planner_ID) REFERENCES Planner(Planner_ID),
FOREIGN KEY (Partners_ID) REFERENCES Partners(Partners_ID),
UNIQUE (Planner_ID, Partners_ID)
)




insert into Event(EvID,EvName) values (1,'Party')
insert into Event(EvID,EvName) values (2,'Party Ana')
insert into Event(EvID,EvName) values (3,'Brunch')
insert into Event(EvID,EvName) values (4,'Birthday')
insert into Event(EvID,EvName) values (5,'Pool Party')
insert into Event(EvID,EvName) values (6,'Graduation')

select * from Event

insert into Planner(PlannerID,PlannerFirstName,PlannerLastName) values (1,'Jon','Mich')
insert into Planner(PlannerID,PlannerFirstName,PlannerLastName) values (2,'Ana','Mihu')
insert into Planner(PlannerID,PlannerFirstName,PlannerLastName) values (3,'Mia','Khan')
insert into Planner(PlannerID,PlannerFirstName,PlannerLastName) values (4,'Alex','Pop')
insert into Planner(PlannerID,PlannerFirstName,PlannerLastName) values (5,'Mada','Brown')
insert into Planner(PlannerID,PlannerFirstName,PlannerLastName) values (6,'Stefan','Bill')

select * from Planner

insert into Date(Date_ID,Day,Month,Year) values (1,12,3,2022)
insert into Date(Date_ID,Day,Month,Year) values (2,16,11,2022)
insert into Date(Date_ID,Day,Month,Year) values (3,22,5,2023)
insert into Date(Date_ID,Day,Month,Year) values (4,9,12,2022)
insert into Date(Date_ID,Day,Month,Year) values (5,4,9,2024)
insert into Date(Date_ID,Day,Month,Year) values (6,17,8,2022)

--select *from Date

insert into Location(Location_ID,Location_Name) values (1,'Wonderland')
insert into Location(Location_ID,Location_Name) values (2,'Euphoria')
insert into Location(Location_ID,Location_Name) values (3,'La Citadel')
insert into Location(Location_ID,Location_Name) values (4,'Colors')
insert into Location(Location_ID,Location_Name) values (5,'Cluj')
insert into Location(Location_ID,Location_Name) values (6,'Bucharest')

select *from Location 

insert into Menu(Menu_ID,Menu_Name) values (1,'Chicken')
insert into Menu(Menu_ID,Menu_Name) values (2,'Lamb')
insert into Menu(Menu_ID,Menu_Name) values (3,'Pork')
insert into Menu(Menu_ID,Menu_Name) values (4,'Carrots')
insert into Menu(Menu_ID,Menu_Name) values (5,'Fish')
insert into Menu(Menu_ID,Menu_Name) values (6,'Shrimps')

select *from Menu 

insert into Partners(Partners_ID,Partners_Name) values (1,'Hermes')
insert into Partners(Partners_ID,Partners_Name) values (1,'OST')
insert into Partners(Partners_ID,Partners_Name) values (1,'FTC')
insert into Partners(Partners_ID,Partners_Name) values (1,'OSUB')
insert into Partners(Partners_ID,Partners_Name) values (1,'OSUT')
insert into Partners(Partners_ID,Partners_Name) values (1,'EVIDENT')

--select *from Partners

insert into Sponsorship(Sponsorship_ID,Sponsorship_Sum) values (1,'1546')
insert into Sponsorship(Sponsorship_ID,Sponsorship_Sum) values (2,'1896')
insert into Sponsorship(Sponsorship_ID,Sponsorship_Sum) values (3,'1524')
insert into Sponsorship(Sponsorship_ID,Sponsorship_Sum) values (4,'4746')
insert into Sponsorship(Sponsorship_ID,Sponsorship_Sum) values (5,'2348')
insert into Sponsorship(Sponsorship_ID,Sponsorship_Sum) values (6,'2105')

--select *from Sponsorship

insert into Event_Date(EvID, Date_ID) values (1,2)
insert into Event_Date(EvID, Date_ID) values (3,6)
insert into Event_Date(EvID, Date_ID) values (2,5)
insert into Event_Date(EvID, Date_ID) values (6,4)

--select *from Event_Date 

insert into Event_Loc(EvID, Location_ID) values (6,4)
insert into Event_Loc(EvID, Location_ID) values (5,3)
insert into Event_Loc(EvID, Location_ID) values (3,1)
insert into Event_Loc(EvID, Location_ID) values (2,6)

--select * from Event_Loc

SELECT *FROM Location
SELECT *FROM Sponsorship

------------------------------------------------------------------
--------LABORATOR 2---------------
------------------------------------------------------------------
---insert data – for at least 4 tables; at least one statement should violate referential integrity constraints;
insert into Event_Date(EvID, Date_ID) values (1,6)
insert into Event_Date(EvID, Date_ID) values (3,9)
insert into Event_Date(EvID, Date_ID) values (2,5)
insert into Event_Date(EvID, Date_ID) values (6,4)

--select *from Event_Date 

insert into Event_Loc(EvID, Location_ID) values (6,4)
insert into Event_Loc(EvID, Location_ID) values (5,9)
insert into Event_Loc(EvID, Location_ID) values (3,10)
insert into Event_Loc(EvID, Location_ID) values (2,6)

select * from Event_Loc


---update data – for at least 3 tables;
UPDATE Date
SET Date.Day=0
WHERE Date.Year BETWEEN 2019 AND 2021

UPDATE Menu 
SET Menu.Menu_Name='Unable'
WHERE Menu.Menu_ID BETWEEN 6 AND 101

UPDATE Sponsorship 
SET Sponsorship_Sum =NULL
Where Location.Fk_Sponsorship in (100,2000)

---delete data – for at least 2 tables.
DELETE 
FROM Planner
WHERE Planner.PlannerFirstName LIKE 'S%'

DELETE
FROM Menu
WHERE Menu.Menu_Name = 'Unable'

--a. 2 queries with the union operation; use UNION [ALL] and OR;

SELECT Location_Name FROM Location;
UNION ALL
SELECT Menu_Name FROM Menu;


SELECT Day,Month,Year
FROM Date
WHERE Month=9 OR Year=2021;

--b. 2 queries with the intersection operation; use INTERSECT and IN;

SELECT Day
FROM Date
WHERE Day IN (1,2,3,12);

SELECT Month
FROM Date
WHERE Month IN (1,2,3,12);
INTERSECT
SELECT Location_ID
FROM Location
WHERE Location_ID IN (1,2,3);

--c. 2 queries with the difference operation; use EXCEPT and NOT IN;

SELECT * FROM Location
WHERE Location_Name NOT IN ('Cluj', 'Colors', 'Wonderland');

SELECT PlannerFirstName,PlannerLastName
FROM Planner
WHERE PlannerFirstName IN ('Ana', 'Steph')

EXCEPT

SELECT PlannerFirstName,PlannerLastName
FROM Planner
WHERE PlannerLastName IN ('Mihu')

--d. 4 queries with INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL JOIN (one query per operator); 
--one query will join at least 3 tables, 
--while another one will join at least two many-to-many relationships;

SELECT Sponsor_Name
FROM Sponsors
INNER JOIN Partners
ON Sponsors.Sponsor_Name = Partners.Part_name;

SELECT Sponsor_Name
FROM Sponsors
LEFT JOIN Partners
ON Sponsors.Sponsor_Name = Partners.Part_name;

SELECT Sponsor_Name
FROM Sponsors
RIGHT JOIN Partners
ON Sponsors.Sponsor_Name = Partners.Part_name;

SELECT Sponsor_ID
FROM Sponsors
FULL OUTER JOIN Partners
ON Sponsors.Sponsor_Name = Partners.Part_name;
WHERE Sponsor_ID=Part_ID;


--e. 2 queries with the IN operator and a subquery in the WHERE clause; 
--in at least one case, the subquery should include a subquery in its own WHERE clause;

select Planner.PlannerFirstName from Planners
where PlannerID in (
	select Event.Ev_ID from Event
	where
	Planner.PlannerID =  Event.Ev_ID 
)


select Planner.PlannerFirstName from Planners
where PlannerID in  (select Event_Loc.EvID from Event_Loc)


--f. 2 queries with the EXISTS operator and a subquery in the WHERE clause;

select Location.Location_Name from Location
where exists (
	select Menu_Name from Menu
	where Location_ID = Menu_ID 

select Event.EvName from Event
where exists (
	select PlannerFirstName from Planners
	where PlannerID=EvID

--g. 2 queries with a subquery in the FROM clause;  

select Sponsorship_Sum from (
	select Sponsorship.Sponsorship_Sum from Sponsorship
	where Sponsorship_Sum is not null
)as T

select Date.Month from (
	select Date.Month from Date
	where Date.Month is between 1 and 12
) as T

--h. 4 queries with the GROUP BY clause, 3 of which also contain the HAVING clause; 
--2 of the latter will also have a subquery in the HAVING clause; use the aggregation operators: COUNT, SUM, AVG, MIN, MAX;

select count(Sponsors.Sponsors_ID), Sponsors.Sponsor_Name
group by Sponsors_Name
having count(Sponsors.Sponsors_ID) > 2

select count(Sponsorship.Sponsorship_ID), Sponsorship.Sponsorship_Sum
group by Sponsorship_Sum
having count(Sponsorship.Sponsorship_ID) < 22


--i. 4 queries using ANY and ALL to introduce a subquery in the WHERE clause (2 queries per operator);
--rewrite 2 of them with aggregation operators, and the other 2 with IN / [NOT] IN.

select Event.EvName from Event
where Event.EvID = any (
	select all Location.Location_ID from Location
	where Location_Name = 'Cluj'
)

select Event.EvName from Event
where Event.EvID = any (
	select all Menu.Menu_ID from Menu
	where Menu_Name = 'Fish'
)

select Location.Location_Name from Location
where Location.Location_ID=any (
	select all Date.Date_ID from Date
	where Day=12 and Month = 4
)

------------------------------------------------------------------
--------LABORATOR 3---------------
------------------------------------------------------------------

--a. modify the type of a column;
select * from Event
select * from Planner 

GO
create procedure SwichType
ALTER TABLE Event
ALTER COLUMN EvName nvarchar(100);
GO
exec SwichType
--b. add / remove a column;

GO
create procedure AddColumn
ALTER TABLE Event 
ADD Type varchar(255);
GO
exec AddColumn


GO
create procedure DelColumn
ALTER TABLE Event
DROP COLUMN Type;
GO
exec DelColumn

--c. add / remove a DEFAULT constraint;

GO
create procedure AddDefaultConst
ALTER TABLE Event 
ADD DEFAULT Type varchar(255);
GO
exec AddDefaultConst


GO
create procedure DelDefaultConst
ALTER TABLE Event
ALTER COLUMN Type DROP DEFAULT;
GO
exec DelDefaultConst

--d. add / remove a primary key;

GO
create procedure addpk
as
ALTER TABLE Event
ADD PRIMARY KEY (EvID);
GO

exec addpk

GO
create procedure droppk
as
alter table Event
drop constraint PK__Event__3214EC276EA7A05E;
go
drop procedure droppk

exec droppk

--f. add / remove a foreign KEY

GO
create procedure addFk
as
ALTER TABLE Event
ADD FOREIGN KEY (EvID);
GO

exec addFk

GO
create procedure dropFk
as
alter table Event
DROP CONSTRAINT FK_PersonOrder;
go
drop procedure dropFk

exec dropFk

--g. create / drop a table.

GO
create procedure CreateTable
as
CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255))
GO
exec CreateTable

GO
create procedure DropTable
as
DROP TABLE Persons;
GO
exec DropTable


--For each of the scripts above, write another one that reverts the operation. Place each script in a stored procedure. Use a simple, intuitive naming convention.

--Create a new table that holds the current version of the database schema. Simplifying assumption: the version is an integer number.

--Write a stored procedure that receives as a parameter a version number and brings the database to that version.

