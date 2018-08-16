drop database CFF;
create database CFF;
use CFF;
-- Programme
create table Programme (
programmeName VARCHAR(20) PRIMARY KEY
)engine = InnoDb;
-- ADD Prog!!!!!!!!!!!
insert into Programme values('Level l');
insert into Programme values('Level 3');
insert into Programme values('ACE');
insert into Programme values('Level 4');

-- Course
create table Course (
courseID char(7) primary key,
courseName varchar(40),
numberOfWeek int(2),
numberOfSessions int(2),
programmeName VARCHAR(20),
foreign key(programmeName) REFERENCES Programme(programmeName)
)engine = InnoDb; 

-- Add course!!!!
insert into Course values('CFCB206','Computing Skills and Ergonomics',9,30,'Level 3');
insert into Course values('CFCF106','Computing Fundamentals',6,20,'Level 3');
insert into Course values('CFHM301','HTML Web Design',11,40,'Level 3');
insert into Course values('CFDT110','Computing Basics DT',13,25,'Level l');
insert into Course values('CFCB110','',10,20,'ACE');
insert into Course values('ITTL410','',16,32,'Level 4');
insert into Course values('CFWP407','',16,32,'Level 3');

select * from course;

-- Sessions
create TABLE Sessions(
sessionStartDateTime DATETIME,
sessionEndDateTime DATETIME,
PRIMARY KEY(sessionStartDateTime,sessionEndDateTime)
)engine=InnoDB;

insert into Sessions values('2018-08-02 10:00:00','2018-08-02 12:00:00');
insert into Sessions values('2018-08-02 13:00:00','2018-08-02 15:00:00');
insert into Sessions values('2018-08-02 18:00:00','2018-08-02 20:00:00');

insert into Sessions values('2018-08-29 09:00:00','2019-08-29 12:00:00');
insert into Sessions values('2018-08-29 12:30:00','2019-08-29 14:30:00');

insert into Sessions values('2018-08-13 08:00:00','2018-08-13 09:00:00');
insert into Sessions values('2018-08-13 09:00:00','2018-08-13 15:00:00');



create table Branch(
branchID varchar(2) primary key,
branchName varchar(20)
)engine=InnoDB;

insert into Branch values('CT','City');
insert into Branch values('BI','Bishopdale');
insert into Branch values('HR','Hornby');
insert into Branch values('BR','New Brighton');
insert into Branch values('RA','Rangiora');
insert into Branch values('T','Timaru');
insert into Branch values('O','Oamaru');

select * from Branch;

-- BranchSession
create table BranchSession(
branchID varchar(2),
sessionStartDateTime DATETIME,
sessionEndDateTime DATETIME,
FOREIGN KEY(branchID) REFERENCES Branch(branchID),
FOREIGN KEY(sessionStartDateTime,sessionEndDateTime) REFERENCES Sessions(sessionStartDateTime,sessionEndDateTime),
PRIMARY KEY(branchID,sessionStartDateTime,sessionEndDateTime)
)engine=InnoDB;


insert into BranchSession values('O','2018-08-02 10:00:00','2018-08-02 12:00:00');
insert into BranchSession values('O','2018-08-02 13:00:00','2018-08-02 15:00:00');
insert into BranchSession values('O','2018-08-02 18:00:00','2018-08-02 20:00:00');

insert into BranchSession values('BR','2018-08-29 09:00:00','2019-08-29 12:00:00');
insert into BranchSession values('BR','2018-08-29 12:30:00','2019-08-29 14:30:00');

insert into BranchSession values('CT','2018-08-13 08:00:00','2018-08-13 09:00:00');
insert into BranchSession values('CT','2018-08-13 09:00:00','2018-08-13 15:00:00');

-- Student
create table Student(
studentID char(8) primary key,
studentFirstName varchar(20),
studentLastName varchar(20)
)engine=InnoDB;

INSERT INTO Student VALUES(92567137,'Ezekiel','Watkins');
INSERT INTO Student VALUES(98794054,'Mariam','Burris');
INSERT INTO Student VALUES(50224035,'Curran','White');
INSERT INTO Student VALUES(68047593,'Gannon','Romero');
INSERT INTO Student VALUES(78021184,'Melvin','Hopkins');
INSERT INTO Student VALUES (39599171,'Emerald','Bowman'),(70101299,'Keelie','Barber'),(14023288,'Keiko','Frye'),(61611086,'Fletcher','Hardin'),(72528668,'Allen','Carpenter'),(34459007,'Gareth','Hunt'),(95224952,'Octavius','Morris'),(37955404,'Daryl','Rodriguez'),(56068661,'Karly','Cobb'),(27820599,'Nathaniel','Hanson');
INSERT INTO Student VALUES (50878787,'Briar','Gallegos'),(16417607,'Stone','Branch'),(282352,'Tobias','Steele'),(84044786,'Beau','Little'),(21352367,'Maris','Higgins'),(30179506,'Margaret','Jefferson'),(59643107,'Adena','Shannon'),(45835886,'Drake','Marsh'),(70563243,'Julie','Best'),(86781971,'Carson','Fleming');
INSERT INTO Student VALUES (59340225,'Indigo','Stephens'),(23806758,'Stephen','Chase'),(15525246,'Clio','Lane'),(40772984,'Rinah','Sanchez'),(73942303,'Aladdin','Hancock'),(58831444,'Rinah','Noble'),(32835161,'MacKenzie','Baxter'),(32439766,'Beck','Landry'),(3085631,'Vernon','Austin'),(42115003,'Thaddeus','May');
INSERT INTO Student VALUES (78160603,'Garrison','Spencer'),(17668882,'Darius','Reid'),(73672289,'Dustin','Frazier'),(66879360,'Nerea','Cochran'),(87058753,'Kristen','Banks'),(92644115,'Chava','Padilla'),(8524086,'Jin','Bruce'),(98983526,'Alice','Horne'),(36245431,'Clark','Shaw'),(6796398,'Edward','Brennan');
INSERT INTO Student VALUES (13671132,'Martha','Winters'),(63923203,'Dorian','Dixon'),(40370062,'Quyn','Woodard'),(91365549,'Sara','Gentry'),(19357176,'William','Beach'),(32357934,'Maxine','Hopper'),(51330114,'Donna','Mack'),(35916913,'Leroy','Morton'),(36937423,'Cyrus','Byrd'),(96767179,'Karina','Bradshaw');
INSERT INTO Student VALUES (53982384,'Whoopi','Riggs'),(15400807,'Lucius','Vazquez'),(44644824,'Kamal','Peck'),(28380074,'Joseph','Moore'),(18872751,'Shafira','Saunders'),(27682386,'Kareem','Wynn'),(7671273,'Roary','Brady'),(27301744,'Mia','Mendez'),(58751898,'Theodore','Hinton'),(92806084,'Jameson','Bolton');
INSERT INTO Student VALUES (45309300,'Alfonso','Mcgee'),(24578644,'Pearl','Terrell'),(26117019,'Wallace','Atkins'),(97257681,'Quintessa','Horne'),(47169203,'Francis','Serrano'),(9856570,'Signe','Taylor'),(85842962,'Avram','Goodman'),(89643349,'Wayne','Thompson'),(33567712,'Dacey','Fulton'),(94803268,'Finn','Tanner');
INSERT INTO Student VALUES (99970975,'Haviva','Price'),(11568421,'Mariko','English'),(39166489,'Virginia','Tate'),(10964559,'Erica','Hopkins'),(39874034,'Brendan','Mason'),(58446364,'Ethan','Roth'),(78828791,'Giselle','Good'),(76911403,'Tashya','Garcia'),(69126664,'Flynn','Boone'),(44713428,'Rina','Harris');
INSERT INTO Student VALUES (41033392,'Fredericka','Rosario'),(27059638,'Rooney','Morgan'),(99101571,'Dolan','Mcmillan'),(65895108,'Claudia','Chapman'),(82583444,'Glenna','Dean'),(45422311,'Shad','Gates'),(16241982,'Deborah','Brennan'),(14707389,'Valentine','Howe'),(25109332,'Maya','Barron'),(72391853,'Minerva','Dillon');

select * from student;

create table Staff(
staffID char(8) primary key,
staffFirstName varchar(20),
staffLastName varchar(20),
staffRole varchar(30)
)engine=InnoDB;

INSERT INTO Staff VALUES(10810515,'Illana','Riley','Manager');
INSERT INTO Staff VALUES(70401978,'Hakeem','Huffman','Team Leader');
INSERT INTO Staff VALUES(93258280,'Anne','Britt','Assistant');
INSERT INTO Staff VALUES(92099402,'Luke','Freeman','Assistant');
INSERT INTO Staff VALUES(58995289,'Ross','Perry','Assistant');

select * from staff;



create table CourseEnrolment(
-- create by first there odd characters of courseID and even numbers of sutdentID 
enrolmentID char(7) primary key,
studentID char(8),
courseID char(7),
staffID char(8),
startDate date,
endDate date,
courseCompleted varchar(3),
foreign key (studentID) references student(studentID),
foreign key (courseID) references course(courseID),
foreign key (staffID) references staff(staffID)
)engine=InnoDB;

insert into CourseEnrolment values('CC22617',92567137,'CFCB206',10810515,'2018-01-08','2018-09-21','No');

insert into CourseEnrolment values('CC18904',98794054,'CFCF106',10810515,'2017-12-22','2018-03-11','Yes');
insert into CourseEnrolment values('CD18904',98794054,'CFDT110',93258280,'2018-07-22','2018-11-11','No');

insert into CourseEnrolment values('CD10205',50224035,'CFDT110',70401978,'2016-12-31','2017-09-22','No');
insert into CourseEnrolment values('CH38453',68047593,'CFHM301',92099402,'2018-04-05','2018-10-03','No');
insert into CourseEnrolment values('IT48214',78021184,'ITTL410',58995289,'2018-04-05','2018-09-03','No');

select * from CourseEnrolment;

create table Booking(
bookingNum int(6) primary key,
studentID char(8),
courseID char(7),
branchID varchar(2),
enrolmentID char(7),
staffID char(8),
bookingTime datetime,
sessionStartDateTime datetime,
sessionEndDateTime datetime,
actualStartTime datetime,
actualEndTime datetime,
foreign key (studentID) references student(studentID),
foreign key (courseID) references course(courseID),
foreign key (branchID) references branch(branchID),
foreign key (enrolmentID) references CourseEnrolment(enrolmentID),
foreign key (staffID) references staff(staffID),
foreign key (sessionStartDateTime,sessionEndDateTime) references Sessions(sessionStartDateTime,sessionEndDateTime)
)engine=InnoDB;

insert into Booking values(560407,92567137,'CFCB206','O','CC22617',93258280,
'2018-07-30 23:59:59',
'2018-08-02 13:00:00',
'2018-08-02 15:00:00',
'2018-08-02 13:09:59',
'2018-08-02 14:19:25');

insert into Booking values(991317,92567137,'CFCB206','BR','CC22617',58995289,
'2018-07-26 13:09:59',
'2018-08-29 09:00:00',
'2019-08-29 12:00:00',
null,
null);

insert into Booking values(212856,98794054,'CFDT110','CT','CD18904',93258280,
'2018-07-21 03:59:59',
'2018-08-13 08:00:00',
'2018-08-13 09:00:00',
'2018-08-13 09:09:59',
'2018-08-13 12:19:25');

select * from booking;