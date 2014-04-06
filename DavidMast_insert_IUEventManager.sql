set echo on
spool DavidMast_output.txt
---Class: C442, I451 , A510
---Semester: Spring 2013
---Assignment: Phase 4
---Student Name: Mast, David

INSERT INTO EventHost (ID, Type) VALUES (10000, 'University');
INSERT INTO EventHost (ID, Type) VALUES (10001, 'Campus');
INSERT INTO EventHost (ID, Type) VALUES (10002, 'College');
INSERT INTO EventHost (ID, Type) VALUES (10003, 'Unit');

INSERT INTO CourseOwner (ID, Type) VALUES (20000, 'College');
INSERT INTO CourseOwner (ID, Type) VALUES (20001, 'Unit');

INSERT INTO EventOrSession (ID, Type) VALUES (30000, 'Event');
INSERT INTO EventOrSession (ID, Type) VALUES (30001, 'Session');
INSERT INTO EventOrSession (ID, Type) VALUES (30002, 'Session');
INSERT INTO EventOrSession (ID, Type) VALUES (30003, 'Event');
INSERT INTO EventOrSession (ID, Type) VALUES (30004, 'Session');
INSERT INTO EventOrSession (ID, Type) VALUES (30005, 'Session');


INSERT INTO Organization (ID, Name, AboutUs, Address, City, State, Country, Email, Phone, URL, Comments, ContactPerson) VALUES 
(40000, 'Org1', 'OrgAboutUs','OrgAddress1', 'South Bend', 'Indiana', 'United States of America', 'OrgEmail1', 'OrgPhone1', 'OrgURL1', 'OrgComments1', 'OrgContactPerson1');

INSERT INTO EUser (ID, FName, MName, LName, Title, StartDate, Address, City, State, Country, Email, Phone, SBio, SBioUpdate, LBio, LBioUpdate, UserType, Affiliation, IsFaculty, Position, Classification) 
VALUES (50000, 'F1', 'M1', 'L1', 'UserTitle1', to_date('01-01-2001', 'mm-dd-yyyy'), 'UAddress1', 'South Bend', 'Indiana', 'United States of America', 'UEmail1', 'UPhone1', 'USbio1', to_date('01-01-2001', 'mm-dd-yyyy'), 'ULBio1', to_date('01-01-2001', 'mm-dd-yyyy'), 'Employee', null, 'Y', 'UPosition1', 'UClassification1');
INSERT INTO EUser (ID, FName, MName, LName, Title, StartDate, Address, City, State, Country, Email, Phone, SBio, SBioUpdate, LBio, LBioUpdate, UserType, Affiliation, IsFaculty, Position, Classification) 
VALUES (50001, 'F2', 'M2', 'L2', 'UserTitle2', to_date('01-01-2002', 'mm-dd-yyyy'), 'UAddress2', 'South Bend', 'Indiana', 'United States of America', 'UEmail2', 'UPhone2', 'USbio2', to_date('01-01-2001', 'mm-dd-yyyy'), 'ULBio2', to_date('01-01-2001', 'mm-dd-yyyy'), 'Guest', 'Affiliation1', 'N', null, null);
INSERT INTO EUser (ID, FName, MName, LName, Title, StartDate, Address, City, State, Country, Email, Phone, SBio, SBioUpdate, LBio, LBioUpdate, UserType, Affiliation, IsFaculty, Position, Classification) 
VALUES (50002, 'F3', 'M3', 'L3', 'UserTitle1', to_date('01-01-2003', 'mm-dd-yyyy'), 'UAddress3', 'South Bend', 'Indiana', 'United States of America', 'UEmail3', 'UPhone3', 'USbio3', to_date('01-01-2001', 'mm-dd-yyyy'), 'ULBio3', to_date('01-01-2001', 'mm-dd-yyyy'), 'Student', null, 'N', null, null);
INSERT INTO EUser (ID, FName, MName, LName, Title, StartDate, Address, City, State, Country, Email, Phone, SBio, SBioUpdate, LBio, LBioUpdate, UserType, Affiliation, IsFaculty, Position, Classification) 
VALUES (50003, 'F4', 'M4', 'L4', 'UserTitle3', to_date('01-01-2004', 'mm-dd-yyyy'), 'UAddress4', 'Chicago', 'Illinois', 'United States of America', 'UEmail4', 'UPhone4', 'USbio4', to_date('01-01-2001', 'mm-dd-yyyy'), 'ULBio4', to_date('01-01-2001', 'mm-dd-yyyy'), 'Employee,Student', null, 'N', 'UPosition2', 'UClassification2');
INSERT INTO EUser (ID, FName, MName, LName, Title, StartDate, Address, City, State, Country, Email, Phone, SBio, SBioUpdate, LBio, LBioUpdate, UserType, Affiliation, IsFaculty, Position, Classification) 
VALUES (50004, 'F5', 'M5', 'L5', 'UserTitle2', to_date('01-01-2005', 'mm-dd-yyyy'), 'UAddress5', 'Chicago', 'Illinois', 'United States of America', 'UEmail5', 'UPhone5', 'USbio5', to_date('01-01-2001', 'mm-dd-yyyy'), 'ULBio5', to_date('01-01-2001', 'mm-dd-yyyy'), 'Guest', 'Affiliation2', 'N', null, null);

INSERT INTO University (ID, Name, Address, City, State, Country, Email, Phone, URL, EventHost_ID) 
VALUES (60010, 'Univ1', 'UnivAddress1', 'South Bend', 'Indiana', 'UnivCountry1', 'UnivEmail1', 'UnivPhone1', 'UnivURL1', 10000);

INSERT INTO Campus (ID, Name, Address, City, State, Country, Email, Phone, URL, University_ID, EventHost_ID) 
VALUES (60020, 'Camp1', 'CampAddress1', 'CampCity1', 'CampState1', 'CampCountry1', 'CampEmail1', 'CampPhone1', 'CampURL1', 60010, 10001);

INSERT INTO College (ID, Name, Address, City, State, Country, Email, Phone, URL, Campus_ID, EventHost_ID, CourseOwner_ID) 
VALUES (60030, 'Coll1', 'CollAddress1', 'CollCity1', 'CollState1', 'CollCountry1', 'CollEmail1', 'CollPhone1', 'CollURL1', 60020, 10002, 20000);

INSERT INTO Unit (ID, Name, Address, City, State, Country, Email, Phone, URL, College_ID, Campus_ID, EventHost_ID, CourseOwner_ID) 
VALUES (60040, 'Un1', 'UnAddress1', 'UnCity1', 'UnState1', 'UnCountry1', 'UnEmail1', 'UnPhone1', 'UnURL1', 60030, 60020, 10003, 20001);

INSERT INTO Course (Code, CNumber, Title, CourseOwner_ID) VALUES ('Code1', 1, 'Course1', 20000);

INSERT INTO Degrees (User_ID, Title, UnivName, GradYear, GradeSemester, GradDate) VALUES (50000, 'Deg1', 'Univ1', to_date('2001', 'yyyy'), 'Spring', to_date('05-01-2001', 'mm-dd-yyyy'));

INSERT INTO Faculty (User_ID, Rank) VALUES (50000, 'FRank1');

INSERT INTO Event (ID, Title, Location, StartDateTime, EndDateTime, Type, EventHost_ID, EventOrSession_ID) 
VALUES (70010, 'ETitle1', 'ELocation1', to_date('01-01-2013 18:00', 'mm-dd-yyyy HH24:MI'), to_date('01-01-2013 22:00', 'mm-dd-yyyy HH24:MI'), 'EType1', 10002, 30000);
INSERT INTO Event (ID, Title, Location, StartDateTime, EndDateTime, Type, EventHost_ID, EventOrSession_ID) 
VALUES (70011, 'ETitle2', 'ELocation2', to_date('01-02-2013 18:00', 'mm-dd-yyyy HH24:MI'), to_date('01-02-2013 22:00', 'mm-dd-yyyy HH24:MI'), 'EType1', 10002, 30000);

INSERT INTO ESession (ID, Code, Title, Location, StartDateTime, EndDateTime, BldgNameNo, RoomNameNo, Event_ID, EventOrSession_ID) 
VALUES (70020, 'SessCode1', 'SessTitle1', 'SessLocation1',  to_date('01-01-2013 18:00', 'mm-dd-yyyy HH24:MI'), to_date('01-01-2013 20:00', 'mm-dd-yyyy HH24:MI'), 'SessBldg1', 'SessRoom1', 70010, 30001);
INSERT INTO ESession (ID, Code, Title, Location, StartDateTime, EndDateTime, BldgNameNo, RoomNameNo, Event_ID, EventOrSession_ID) 
VALUES (70021, 'SessCode2', 'SessTitle2', 'SessLocation2',  to_date('01-01-2013 20:00', 'mm-dd-yyyy HH24:MI'), to_date('01-01-2013 22:00', 'mm-dd-yyyy HH24:MI'), 'SessBldg2', 'SessRoom2', 70010, 30002);
INSERT INTO ESession (ID, Code, Title, Location, StartDateTime, EndDateTime, BldgNameNo, RoomNameNo, Event_ID, EventOrSession_ID) 
VALUES (70023, 'SessCode3', 'SessTitle3', 'SessLocation3',  to_date('01-02-2013 18:00', 'mm-dd-yyyy HH24:MI'), to_date('01-02-2013 20:00', 'mm-dd-yyyy HH24:MI'), 'SessBldg3', 'SessRoom3', 70010, 30004);
INSERT INTO ESession (ID, Code, Title, Location, StartDateTime, EndDateTime, BldgNameNo, RoomNameNo, Event_ID, EventOrSession_ID) 
VALUES (70024, 'SessCode4', 'SessTitle4', 'SessLocation4',  to_date('01-02-2013 20:00', 'mm-dd-yyyy HH24:MI'), to_date('01-02-2013 22:00', 'mm-dd-yyyy HH24:MI'), 'SessBldg3', 'SessRoom4', 70010, 30005);

INSERT INTO ParticipatedBy (EventOrSession_ID, User_ID) VALUES (30000, 50000);
INSERT INTO ParticipatedBy (EventOrSession_ID, User_ID) VALUES (30000, 50001);
INSERT INTO ParticipatedBy (EventOrSession_ID, User_ID) VALUES (30000, 50002);
INSERT INTO ParticipatedBy (EventOrSession_ID, User_ID) VALUES (30000, 50003);
INSERT INTO ParticipatedBy (EventOrSession_ID, User_ID) VALUES (30000, 50004);

INSERT INTO ParticipatedBy (EventOrSession_ID, User_ID) VALUES (30001, 50000);
INSERT INTO ParticipatedBy (EventOrSession_ID, User_ID) VALUES (30001, 50001);
INSERT INTO ParticipatedBy (EventOrSession_ID, User_ID) VALUES (30001, 50002);

INSERT INTO ParticipatedBy (EventOrSession_ID, User_ID) VALUES (30002, 50002);
INSERT INTO ParticipatedBy (EventOrSession_ID, User_ID) VALUES (30002, 50003);
INSERT INTO ParticipatedBy (EventOrSession_ID, User_ID) VALUES (30002, 50004);

INSERT INTO HasSpeaker (EventOrSession_ID, User_ID) VALUES (30001, 50001);

INSERT INTO ChairedBy (EventOrSession_ID, User_ID) VALUES (30000, 50000);

INSERT INTO UserSponsor (EventOrSession_ID, User_ID) VALUES (30000, 50003);

INSERT INTO OrgSponsor (EventOrSession_ID, Organization_ID) VALUES (30000, 40000);

INSERT INTO Handout (Filename, FType, Tags, EventOrSession_ID) VALUES ('FileName1', 'FType1', 'Tag1,Tag2', 30001);
INSERT INTO Handout (Filename, FType, Tags, EventOrSession_ID) VALUES ('FileName2', 'FType1', 'Tag1,Tag3', 30001);
INSERT INTO Handout (Filename, FType, Tags, EventOrSession_ID) VALUES ('FileName3', 'FType2', 'Tag4,Tag5', 30002);
INSERT INTO Handout (Filename, FType, Tags, EventOrSession_ID) VALUES ('FileName4', 'FType1', 'Tag1,Tag2', 30004);
INSERT INTO Handout (Filename, FType, Tags, EventOrSession_ID) VALUES ('FileName5', 'FType3', 'Tag3,Tag6', 30004);

INSERT INTO Testimonial (ID, EventOrSession_ID, Title, Text, User_ID) VALUES (80000, 30001, 'Test1', 'TextyText', 50000);

spool off
set echo off