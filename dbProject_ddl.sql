create database pwb;

use pwb;
show tables;

# 	Adminn (attributes: AdminID, FirstName, LastName, Passwordd, AccessLevel)

CREATE TABLE Adminn (
  AdminID varchar(10) NOT NULL UNIQUE PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  Passwordd varchar(50) NOT NULL,
  AccessLevel varchar(50) NOT NULL
);

#---------------------------------------------------------------------------------#

# 	Groupss (attributes: GroupID, GrouptName, GroupDescrip, Members)

CREATE TABLE Groupss(
  GroupID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  GrouptName varchar(100) NOT NULL,
  GroupDescrip varchar(500) NOT NULL,
  Members varchar(200) NOT NULL
);
select* from Userss;
#---------------------------------------------------------------------------------#

# 	Users (attributes: UserID, FirstName, LastName, Email, Passwordd, GroupID, AccessLevel, AdminID)

CREATE TABLE Userss (
  UserID varchar(10) NOT NULL UNIQUE PRIMARY KEY,
  AdminID varchar(10),
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  Email varchar(50) NOT NULL,
  Passwordd varchar(50) NOT NULL,
  GroupID varchar(10) UNIQUE,
  AccessLevel varchar(50) NOT NULL,
  FOREIGN KEY (AdminID) REFERENCES Adminn(AdminID)
  );

#---------------------------------------------------------------------------------#

# 	Comments (attributes: CommentID, Descriptions, UserID)

CREATE TABLE Comments (
  CommentID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  UserID varchar(10),
  Descriptions varchar(200) NOT NULL,
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

#---------------------------------------------------------------------------------#

# 	Roll (attributes: RollID, RollName, Description, UserID)

CREATE TABLE Roll(
  RollID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  UserID varchar(10),
  RollName varchar(50) NOT NULL,
  Descriptions varchar(200) NOT NULL,
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
drop table roll;

#---------------------------------------------------------------------------------#

#  Task (attributes: TaskID, Task_Prio, Due_Date , comments, RollID)

CREATE TABLE Task (
  TaskID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  RollID int,
  Task_Prio enum('1', '2', '3', '4', '5') NOT NULL,
  Due_Date varchar(20) NOT NULL,
  comments varchar(200) NOT NULL,
  FOREIGN KEY (RollID) REFERENCES Roll(RollID)
);

#---------------------------------------------------------------------------------#

#  RoadMap (attributes: MapID, Time_consummed)

CREATE TABLE RoadMap (
  MapID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Time_consumed varchar(100) NOT NULL
);

#---------------------------------------------------------------------------------#

# 	Project (attributes: ProjectID, ProjectName, GroupID, MapID, start_date, end_date, AdminID)

CREATE TABLE Project (
  ProjectID varchar(10) NOT NULL UNIQUE PRIMARY KEY,
  AdminID varchar(10),
  UserID varchar(10),
  MapID int,
  GroupID  int,
  ProjectName varchar(50) NOT NULL,
  start_date varchar(20) NOT NULL,
  end_date varchar(20) NOT NULL,
  FOREIGN KEY (AdminID) REFERENCES Adminn(AdminID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID),
  FOREIGN KEY (MapID) REFERENCES RoadMap(MapID),
  FOREIGN KEY (GroupID) REFERENCES Groupss(GroupID) 
);

#---------------------------------------------------------------------------------#

# 	Versions (attributes: versionID, ver_duration, descrip, ProjectID)

CREATE TABLE Versions (
  versionID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  ProjectID varchar(10),
  ver_duration varchar(50) NOT NULL,
  descrip varchar(500) NOT NULL,
  FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
);

#---------------------------------------------------------------------------------#

# 	Sprint (attributes: sprintID, start_date, Fin_date, descrip, ProjectID)

CREATE TABLE Sprint (
  sprintID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  ProjectID varchar(10),
  start_date varchar(20) NOT NULL,
  fin_date varchar(20) NOT NULL,
  descrip varchar(500) NOT NULL,
  FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
);

#---------------------------------------------------------------------------------#

# 	Board (attributes: boardID, Namee, Email, descrip, ProjectID)

CREATE TABLE Board (
  BoardID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  ProjectID varchar(10),
  Namee varchar(50) NOT NULL,
  Email varchar(50) NOT NULL,
  descrip varchar(500) NOT NULL,
  FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
);

#---------------------------------------------------------------------------------#

# 	Files (attributes: FileID, Namee, Type, descrip, UserID)

CREATE TABLE Files (
  FileID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  UserID varchar(10),
  Namee varchar(50) NOT NULL,
  tyypes varchar(20) NOT NULL,
  descrip varchar(500) NOT NULL,
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

#---------------------------------------------------------------------------------#

# 	Customers (attributes: CustomerID, Namee, Email, Passwordd)

CREATE TABLE Customers (
  CustomerID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Namee varchar(50) NOT NULL,
  Email varchar(50) NOT NULL,
  Passwordd varchar(50) NOT NULL
);

#---------------------------------------------------------------------------------#

# 	Issue (attributes: IssueID, Descrip, Tyype, Title , Files, Comment, Date, CurrentState, LevelOfPrior , SprintID, BoardID, CustomerID)

CREATE TABLE Issue (
  IssueID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  CustomerID int,
  SprintID int,
  BoardID int,
  Descrip varchar(500) NOT NULL,
  Tyype varchar(20) NOT NULL,
  Files varchar(20) NOT NULL,
  Comments varchar(100) NOT NULL, 
  Daate varchar(20) NOT NULL,
  CurrentState varchar(20) NOT NULL,
  LevelOfPrior enum('1', '2', '3', '4', '5') NOT NULL,
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
  FOREIGN KEY (SprintID) REFERENCES Sprint(SprintID),
  FOREIGN KEY (BoardID) REFERENCES Board(BoardID)
);

#---------------------------------------------------------------------------------#

# 	WorkFLow (attributes: workID, Namee, descrip, status, IssueID)

CREATE TABLE WorkFlow (
  WorkID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  IssueID int,
  Namee varchar(50) NOT NULL,
  descrip varchar(500) NOT NULL,
  status varchar(50) NOT NULL,
  FOREIGN KEY (IssueID) REFERENCES Issue(IssueID)
);

#---------------------------------------------------------------------------------#


# 	Notifications (attributes: NotifID, comments)

CREATE TABLE Notifications (
  NotifID varchar(500),
  comments varchar(500) 
);
#---------------------------------------------------------------------------------#

alter user 'root'@'localhost' identified  with mysql_native_password by 'root123';
flush privileges;

select* from groupss;



