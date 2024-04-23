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

--select *from Menu 

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