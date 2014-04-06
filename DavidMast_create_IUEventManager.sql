set echo on
spool DavidMast_output.txt
---Class: C442, I451 , A510
---Semester: Spring 2013
---Assignment: Phase 4
---Student Name: Mast, David

create table EventHost
(
ID number(5) primary key,
Type Varchar2(10)
);

create table CourseOwner
(
ID number (5) primary key,
Type varchar2(10)
);

create table EventOrSession
(
ID number(5) primary key,
Type Varchar2(10)
);

create table Organization
(
ID number(5) primary key,
Name varchar2(250) not null,
AboutUs varchar2(2000) not null,
Address varchar2(250),
City varchar2 (50),
State varchar2(25) not null,
Country varchar2(50) not null,
Email varchar2 (100),
Phone varchar2 (15),
URL varchar2(200),
Comments varchar2 (1000),
ContactPerson varchar2 (200)
);

create table EUser
(
ID number(5) primary key,
FName varchar2 (50) not null,
MName varchar2 (50) not null,
LName varchar2 (50) not null,
Title varchar2 (15) not null,
StartDate date not null,
Address varchar2(250),
City varchar2 (50),
State varchar2(25) not null,
Country varchar2(50) not null,
Email varchar2 (100),
Phone varchar2 (15),
SBio varchar2 (200),
SBioUpDate date,
LBio varchar2 (4000),
LBioUpdate date,
UserType varchar2 (50) not null,
Affiliation varchar2 (150),
IsFaculty char,
Position varchar2 (150),
Classification varchar2 (150)
);

Create table University 
(
ID number(5) primary key,
Name varchar(150) not null,
Address varchar2(250),
City varchar2 (50),
State varchar2(25) not null,
Country varchar2(50) not null,
Email varchar2 (100),
Phone varchar2 (15),
URL varchar2 (200),
EventHost_ID number(5) not null,
foreign key (EventHost_ID) references EventHost(ID) on delete cascade
);

create table Campus
(
ID number(5) primary key,
Name varchar(150) not null,
Address varchar2(250),
City varchar2 (50),
State varchar2(25) not null,
Country varchar2(50) not null,
Email varchar2 (100),
Phone varchar2 (15),
URL varchar2 (200),
EventHost_ID number(5) not null,
University_ID number(5) not null,
foreign key (EventHost_ID) references EventHost(ID) on delete cascade,
foreign key (University_ID) references University(ID) on delete cascade
);

create table College
(
ID number(5) primary key,
Name varchar(150) not null,
Address varchar2(250),
City varchar2 (50),
State varchar2(25) not null,
Country varchar2(50) not null,
Email varchar2 (100),
Phone varchar2 (15),
URL varchar2 (200),
EventHost_ID number(5) not null,
Campus_ID number(5) not null,
CourseOwner_ID number(5) not null,
foreign key (CourseOwner_ID) references CourseOwner(ID) on delete cascade,
foreign key (EventHost_ID) references EventHost(ID) on delete cascade,
foreign key (Campus_ID) references Campus(ID) on delete cascade
);

create table Unit
(
ID number(5) primary key,
Name varchar(150) not null,
Address varchar2(250),
City varchar2 (50),
State varchar2(25) not null,
Country varchar2(50) not null,
Email varchar2 (100),
Phone varchar2 (15),
URL varchar2 (200),
College_ID number(5),
Campus_ID number(5) not null,
EventHost_ID number(5) not null,
CourseOwner_ID number(5) not null,
foreign key (College_ID) references college(ID),
foreign key (CourseOwner_ID) references CourseOwner(ID) on delete cascade,
foreign key (College_ID) references College(ID),
foreign key (EventHost_ID) references EventHost(ID) on delete cascade
);

create table Course
(
Code varchar2 (10),
CNumber integer,
Title varchar2 (200) not null,
CourseOwner_ID number(5) not null,
primary key (Code, CNumber),
foreign key (CourseOwner_ID) references CourseOwner(ID) on delete cascade
);

create table Degrees
(
User_ID number(5),
Title varchar2(250),
UnivName varchar2(250) not null,
GradYear date not null,
GradeSemester varchar2 (10),
GradDate date,
foreign key (User_ID) references EUser(ID) on delete cascade,
primary key (User_ID, Title)
);

create table Faculty
(
User_ID number(5) primary key,
Rank varchar2(150) not null,
foreign key (User_ID) references EUser(ID) on delete cascade
);

create table Event
(
ID number(5) primary key,
Title varchar2(300),
Location varchar2(500),
StartDateTime date,
EndDateTime date,
Type varchar2 (50),
EventHost_ID number(5) not null,
EventOrSession_ID number(5) not null,
foreign key (EventHost_ID) references EventHost(ID) on delete cascade,
foreign key (EventOrSession_ID) references EventOrSession(ID) on delete cascade
);

create table ESession
(
ID number(5) primary key,
Code varchar2(50) not null,
Title varchar2(300),
Location varchar2(500),
StartDateTime date,
EndDateTime date,
BldgNameNo varchar2(50),
RoomNameNo varchar2(50),
Event_ID number(5) not null,
EventOrSession_ID number(5) not null,
foreign key (Event_ID) references Event(ID) on delete cascade,
foreign key (EventOrSession_ID) references EventOrSession(ID) on delete cascade
);

create table ParticipatedBy
(
EventOrSession_ID number(5),
User_ID number(5),
primary key(EventOrSession_ID, User_ID),
foreign key (EventOrSession_ID) references EventOrSession(ID) on delete cascade,
foreign key (User_ID) references EUser(ID) on delete cascade
);

create table HasSpeaker
(
EventOrSession_ID number(5),
User_ID number(5),
primary key(EventOrSession_ID, User_ID),
foreign key (EventOrSession_ID) references EventOrSession(ID) on delete cascade,
foreign key (User_ID) references EUser(ID) on delete cascade
);

create table ChairedBy
(
EventOrSession_ID number(5),
User_ID number(5),
primary key(EventOrSession_ID, User_ID),
foreign key (EventOrSession_ID) references EventOrSession(ID) on delete cascade,
foreign key (User_ID) references EUser(ID) on delete cascade
);

create table UserSponsor
(
EventOrSession_ID number(5),
User_ID number(5),
primary key(EventOrSession_ID, User_ID),
foreign key (EventOrSession_ID) references EventOrSession(ID) on delete cascade,
foreign key (User_ID) references EUser(ID) on delete cascade
);

create table OrgSponsor
(
EventOrSession_ID number(5),
Organization_ID number(5),
primary key(EventOrSession_ID, Organization_ID),
foreign key (EventOrSession_ID) references EventOrSession(ID) on delete cascade,
foreign key (Organization_ID) references Organization(ID) on delete cascade
);

create table Handout
(
Filename varchar2 (200),
FType varchar2 (10),
Tags varchar2 (500),
EventOrSession_ID number(5),
primary key (Filename, EventOrSession_ID),
foreign key (EventOrSession_ID) references EventOrSession(ID) on delete cascade
);

create table Testimonial
(
ID number(5),
EventOrSession_ID number(5),
Title varchar2(150),
Text varchar2(500),
User_ID number(5),
primary key(ID, EventOrSession_ID),
foreign key (EventOrSession_ID) references EventOrSession(ID) on delete cascade,
foreign key (User_ID) references EUser(ID) on delete cascade
);

spool off
set echo off