set echo on
spool DavidMast_output.txt
---Class: C442, I451 , A510
---Semester: Spring 2013
---Assignment: Homework 1 Part 2
---Student Name: Mast, David

-- 1: A query involving one table to demonstrate select, project, and rename
-- 1. Find all users who live in South Bend, Indiana
Select * 
From EUser
Where City = 'South Bend' AND State = 'Indiana';

-- 2: A query involving two tables to demonstrate equi-join
-- 2. Show how many testimonials each user has written
Select user_id, Count(t.ID)
From EUser u Join Testimonial t on u.id = t.user_id
Group by user_ID;

-- 3: A query involving two or more tables to demonstrate aggregation
-- 3. Find the number of users who have participated in each type of event
Select Type, Count(User_ID)
From ParticipatedBy P Join EventOrSession E On P.EventOrSession_ID = E.ID
Group by Type;

-- 4: A query involving two or more tables to demonstrate division
-- 4. Find all users who have participated in all sessions of the event 70010
Select ID
From EUser E
Where not exists
  (
    Select S.EventOrSession_ID FROM ESession S Join Event E On S.Event_ID = E.ID Where E.ID = 70010
    Minus
    Select EventOrSession_ID FROM ESession Natural Join ParticipatedBy Where User_ID = E.ID 
  );


-- 5: A query involving three or more tables to demonstrate grouping
-- 5. For each session show the number of handouts that were used
Select E.ID, Count(Handout.Filename)
From  ESession E Join EventOrSession S on E.EventOrSession_ID = S.ID, Handout
Where Handout.EventOrSession_ID = E.EventOrSession_ID
Group By E.ID;

-- 6: A query involving three or more tables to demonstrate outer join/outer union


spool off
set echo off



