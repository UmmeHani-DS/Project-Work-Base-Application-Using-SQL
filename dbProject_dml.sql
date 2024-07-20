use pwb;

#Admin have 4 access levels
#SuperAdmin with most control
#Admin with some restrictions
#Moderator has access only of content
#Technical support

insert Adminn (AdminID, FirstName, LastName, Passwordd, AccessLevel) 
values ('admin001', 'John', 'Doe', '*****', 'SuperAdmin');
insert Adminn (AdminID, FirstName, LastName, Passwordd, AccessLevel) 
values ('admin002', 'David', 'Henry', '*****', 'Admin');
select *from Adminn;

#---------------------------------------------------------------------------------#

insert Groupss (GrouptName, GroupDescrip, Members) 
values ('Group 1', 'Description for Group 1', 'John, Jane, Sarah');
insert Groupss (GrouptName, GroupDescrip, Members) 
values ('Group 2', 'Description for Group 2', 'Bob, Alice, Tom');
select* from Groupss;

#---------------------------------------------------------------------------------#

insert Userss (UserID, AdminID, FirstName, LastName, Email, Passwordd, GroupID, AccessLevel)
values ('user001', 'admin001', 'John', 'Doe', 'john.doe@gmail.com', 'password123', '1', 'User');
insert Userss (UserID, AdminID, FirstName, LastName, Email, Passwordd, GroupID, AccessLevel)
values ('user002', 'admin002', 'Jane', 'Smith', 'jane.smith@gmail.com', 'password456', '2', 'User');
insert Userss (UserID, AdminID, FirstName, LastName, Email, Passwordd, GroupID, AccessLevel)
values ('user003', 'admin002', '', '', '', '', '3', 'User');
insert Userss (UserID, AdminID, FirstName, LastName, Email, Passwordd, GroupID, AccessLevel)
values ('user004', 'admin002', '', '', '', '', '4', 'User');
insert Userss (UserID, AdminID, FirstName, LastName, Email, Passwordd, GroupID, AccessLevel)
values ('user005', 'admin002', '', '', '', '', '5', 'User');
insert Userss (UserID, AdminID, FirstName, LastName, Email, Passwordd, GroupID, AccessLevel)
values ('user006', 'admin002', '', '', '', '', '6', 'User');
insert Userss (UserID, AdminID, FirstName, LastName, Email, Passwordd, GroupID, AccessLevel)
values ('user007', 'admin002', '', '', '', '', '7', 'User');

select *from Users;
#---------------------------------------------------------------------------------#

insert Comments (UserID, Descriptions)
values ('user001', 'I would like to edit my prev doc.');
insert Comments (UserID, Descriptions)
values ('user002', 'I agree with your comment.');
select* from Comments;

#---------------------------------------------------------------------------------#

insert Roll (UserID, RollName, Descriptions)
values ('user001', 'Editor', 'Can handle issues.');
insert Roll (UserID, RollName, Descriptions)
values ('user002', 'Moderator', 'Will notify the issues to superAdmin');
select* from Roll;

#---------------------------------------------------------------------------------#

insert Task (RollID, Task_Prio, Due_Date, comments)
values (1, '1', '2023-05-16', 'Complete the sprint by Next week');
insert Task (RollID, Task_Prio, Due_Date, comments)
values (2, '4', '2023-05-20', 'none');

#---------------------------------------------------------------------------------#

insert RoadMap (Time_consumed)
values ('2 hours');
insert RoadMap (Time_consumed)
values ('3.5 hours');
select* from RoadMap;

#---------------------------------------------------------------------------------#

insert Project (ProjectID, AdminID, UserID, MapID, GroupID, ProjectName, start_date, end_date)
values ('P001', 'admin001', 'user001', 1, 1, 'DBproject', '2023-12-01', '2024-01-30');
insert Project (ProjectID, AdminID, UserID, MapID, GroupID, ProjectName, start_date, end_date)
values ('P002', 'admin002', 'user002', 2, 2, 'Project Two', '2022-02-01', '2022-07-31');
insert Project (ProjectID, AdminID, UserID, MapID, GroupID, ProjectName, start_date, end_date)
values ('P003', 'admin002', 'user002', 2, 2, 'Project Two', '2022-02-01', '2022-07-31');

select* from Project;

#---------------------------------------------------------------------------------#

insert Versions (ProjectID, ver_duration, descrip) 
values ('P001', '2 weeks', 'Added new feature X');
insert Versions (ProjectID, ver_duration, descrip) 
values ('P002', '1 month', 'Fixed bug Y and improved performance');
select* from Versions;

#---------------------------------------------------------------------------------#

insert Sprint (ProjectID, start_date, fin_date, descrip)
values('P001', '2023-05-01', '2023-05-14', 'Sprint 1 for Project P001');
insert Sprint (ProjectID, start_date, fin_date, descrip)
values('P002', '2023-06-01', '2023-06-14', 'Sprint 2 for Project P002');
select* from Sprint;

#---------------------------------------------------------------------------------#

insert Board (ProjectID, Namee, Email, descrip) 
values ('P001', 'xyz', 'xyz@example.com', 'Board for project P001');
insert Board (ProjectID, Namee, Email, descrip) 
values('P002', 'avc', 'avc@example.com', 'Board for project P002');
select* from Board;
#---------------------------------------------------------------------------------#

insert Files (UserID, Namee, tyypes, descrip) 
values ('user001', 'Report.pdf', 'pdf', 'Quarterly report for Q1 2023');
insert Files (UserID, Namee, tyypes, descrip) 
values ('user002', 'Presentation.pptx', 'pptx', 'Sales pitch for new product launch'); 
#---------------------------------------------------------------------------------#


insert Customers (Namee, Email, Passwordd) values
('Anna', 'anna@example.com', 'password123'),
('Joe', 'joe@example.com', 'password456');

#---------------------------------------------------------------------------------#

insert Issue (CustomerID, SprintID, BoardID, Descrip, Tyype, Files, Comments, Daate, CurrentState, LevelOfPrior) values
(1, 1, 2, 'Issue 1 description', 'Bug', 'file1.txt', 'Comment 1', '2023-05-14', 'Open', '3'),
(2, 2, 3, 'Issue 2 description', 'Feature', 'file2.txt', 'Comment 2', '2023-05-15', 'In Progress', '2');
select* from Issue;
#---------------------------------------------------------------------------------#

insert WorkFlow (IssueID, Namee, descrip, status)
values (3, 'Workflow 1', 'Description of Workflow 1', 'Active'),
(4, 'Workflow 2', 'Description of Workflow 2', 'Inactive');

#---------------------------------------------------------------------------------#

select* from Notifications;


delimiter $$
CREATE TRIGGER add_user_info_notification
AFTER INSERT ON Users
FOR EACH ROW
BEGIN
  IF NEW.FirstName IS NULL OR NEW.FirstName = '' OR NEW.Email = '' or NEW.Passwordd = '' or NEW.Email IS NULL OR NEW.Passwordd IS NULL THEN
    INSERT INTO Notifications (NotifID, comments)
    VALUES (NEW.UserID, 'Please fill in all necessary user information.');
  END IF;
END;


delimiter $$
CREATE TRIGGER project_created_trigger
AFTER INSERT ON Project
FOR EACH ROW
BEGIN
  INSERT INTO Notifications (NotifID, comments)
  VALUES (NEW.UserID, CONCAT('New project created with ProjectID ', NEW.ProjectID, ' on ', NEW.start_date));
END;



