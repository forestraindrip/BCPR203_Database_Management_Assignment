drop database CFF;
create database CFF;
use CFF;
-- Programme
create table Programme (
programmeName VARCHAR(20) PRIMARY KEY not null
)engine = InnoDb;

insert into Programme values('Level l');
insert into Programme values('Level 3');
insert into Programme values('ACE');
insert into Programme values('Level 4');

-- Course
create table Course (
courseID char(7) primary key not null,
courseName varchar(40),
numberOfWeek int(2) not null,
numberOfSessions int(2) not null,
programmeName VARCHAR(20),
foreign key(programmeName) REFERENCES Programme(programmeName)
)engine = InnoDb; 

insert into Course values('CFCB206','Computing Skills and Ergonomics',9,30,'Level 3');
insert into Course values('CFCF106','Computing Fundamentals',6,20,'Level 3');
insert into Course values('CFHM301','HTML Web Design',11,40,'Level 3');
insert into Course values('CFDT110','Computing Basics DT',13,25,'Level l');
insert into Course values('CFCB110','Computing Basics',10,20,'ACE');
insert into Course values('ITTL410','Advanced Tools B',16,32,'Level 4');
insert into Course values('CFWP407','Word Advanced',16,32,'Level 3');

select * from course;


-- Student
create table Student(
studentID char(8) primary key not null,
studentFirstName varchar(20) not null,
studentLastName varchar(20) not null
)engine=InnoDB;

INSERT INTO Student VALUES(92567137,'Ezekiel','Watkins');
INSERT INTO Student VALUES(39599171,'Emerald','Bowman');
INSERT INTO Student VALUES(98794054,'Mariam','Burris');
INSERT INTO Student VALUES(50224035,'Curran','White');
INSERT INTO Student VALUES(68047593,'Gannon','Romero');
INSERT INTO Student VALUES(78021184,'Melvin','Hopkins');
INSERT INTO Student VALUES (70101299,'Keelie','Barber'),
(14023288,'Keiko','Frye'),
(61611086,'Fletcher','Hardin'),
(72528668,'Allen','Carpenter'),
(34459007,'Gareth','Hunt'),
(95224952,'Octavius','Morris'),
(37955404,'Daryl','Rodriguez'),
(56068661,'Karly','Cobb'),
(27820599,'Nathaniel','Hanson');

select * from student;

create table Branch(
branchID varchar(2) primary key not null,
branchName varchar(20) not null
)engine=InnoDB;

insert into Branch values('CT','City');
insert into Branch values('BI','Bishopdale');
insert into Branch values('HR','Hornby');
insert into Branch values('BR','New Brighton');
insert into Branch values('RA','Rangiora');
insert into Branch values('T','Timaru');
insert into Branch values('O','Oamaru');

select * from Branch;


-- Sessions
create TABLE Sessions(
sessionID varchar(10) PRIMARY KEY not null, -- branchID + date + starttime
branchID varchar(2) not null, 
sessionDate DATE not null,
sessionStartTime time not null,
sessionEndTime TIME not null,
foreign key (branchID) references Branch(branchID)
)engine=InnoDB;

insert into Sessions values('O18080210','O','2018-08-02','10:00:00','12:00:00');
insert into Sessions values('O18080213','O','2018-08-02','13:00:00','15:00:00');
insert into Sessions values('O18080218','O','2018-08-02','18:00:00','20:00:00');
insert into Sessions values('O18080310','O','2018-08-03','10:00:00','12:00:00');
insert into Sessions values('O18080313','O','2018-08-03','13:00:00','15:00:00');


insert into Sessions values('BR18082909','BR','2018-08-29','09:00:00','12:00:00');
insert into Sessions values('BR18082912','BR','2018-08-29','12:30:00','14:30:00');
insert into Sessions values('BR18083009','BR','2018-08-30','09:00:00','12:00:00');
insert into Sessions values('BR18083012','BR','2018-08-30','12:30:00','14:30:00');


insert into Sessions values('CT18081308','CT','2018-08-13','08:00:00','09:00:00');
insert into Sessions values('CT18081309','CT','2018-08-13','09:00:00','15:00:00');
insert into Sessions values('CT18081409','CT','2018-08-14','09:00:00','15:00:00');
insert into Sessions values('CT18081508','CT','2018-08-15','08:00:00','09:00:00');
insert into Sessions values('CT18081509','CT','2018-08-15','09:00:00','15:00:00');

select * from sessions;


create table Enrolment(
enrolmentID char(7) primary key not null,
studentID char(8) not null,
courseID char(7) not null,
startDate date not null,
endDate date not null,
courseCompleted boolean not null, -- For verification purpose
foreign key (studentID) references student(studentID),
foreign key (courseID) references course(courseID)
)engine=InnoDB;

-- student 92567137
insert into Enrolment values('CC22617',92567137,'CFCB206','2018-01-08','2018-09-21',false);
-- student 39599171
insert into Enrolment values('CC29911',39599171,'CFCB206','2018-01-05','2018-09-16',false);
-- student 98794054
insert into Enrolment values('CC28904',98794054,'CFCB206','2017-12-05','2018-05-16',true);
insert into Enrolment values('CC18904',98794054,'CFCF106','2017-12-22','2018-03-11',true);
insert into Enrolment values('CFD8904',98794054,'CFDT110','2018-07-22','2018-11-11',false);
-- student 50224035
insert into Enrolment values('CD10205',50224035,'CFDT110','2016-12-31','2017-09-22',false);
-- student 68047593
insert into Enrolment values('CH38453',68047593,'CFHM301','2018-04-05','2018-10-03',false);
-- student 78021184
insert into Enrolment values('IT48214',78021184,'ITTL410','2018-04-05','2018-09-03',false);
--
insert into Enrolment values('IT14023',14023288,'ITTL410','2018-04-05','2018-09-03',false);
--
insert into Enrolment values('IT61611',61611086,'ITTL410','2018-04-05','2018-09-03',false);
--
insert into Enrolment values('IT72528',72528668,'ITTL410','2018-04-05','2018-09-03',false);
--
insert into Enrolment values('IT34459',34459007,'ITTL410','2018-04-05','2018-09-03',false);
--
insert into Enrolment values('IT37955',37955404,'ITTL410','2018-04-05','2018-09-03',false);
--
insert into Enrolment values('IT56068',56068661,'ITTL410','2018-04-05','2018-09-03',false);
--
insert into Enrolment values('IT27820',27820599,'ITTL410','2018-04-05','2018-09-03',false);
-- No booking and attendance
insert into Enrolment values('IT95224',95224952,'ITTL410','2018-04-05','2018-09-03',false);

select * from Enrolment;

create table Booking(
bookingNum int(6) primary key not null,
enrolmentID char(7) not null,
sessionID varchar(10) not null,
bookingDate date not null,
bookingTime time not null,
foreign key (enrolmentID) references Enrolment(enrolmentID),
foreign key (sessionID) references Sessions(sessionID)
)engine=InnoDB;

-- Bookings for the same enrolment
insert into Booking values(560407,'CC22617','O18080210','2018-07-30','23:49:59');
insert into Booking values(145452,'CC22617','O18080218','2018-07-30','23:59:59');


-- this booking has no attendance
insert into Booking values(333333,'CC29911','BR18082909','2018-04-30','23:59:59'); 
INSERT INTO Booking VALUES(654544,'CH38453','BR18082909','2018-08-30','20:59:59');

insert into Booking values(252424,'IT34459','O18080210','2018-07-30','23:59:59');
insert into Booking VALUES(343434,'IT48214','O18080310','2018-08-01','02:59:59');
insert into Booking values(991317,'CC18904','BR18082909','2018-07-26','13:09:59');
insert into Booking values(212856,'CD10205','CT18081308','2018-07-21','03:59:59');
insert into Booking values(458856,'IT61611','CT18081308','2018-07-21','04:59:59');



select * from booking;

create table Attendance(
enrolmentID char(7) not null,
sessionID varchar(10) not null,
attendanceStartTime time not null,
attendanceEndTime time,
foreign key (enrolmentID) references Enrolment(enrolmentID),
foreign key (sessionID) references Sessions(sessionID),
primary key (enrolmentID,sessionID)
)engine=InnoDB;

-- different attendances in the same enrolment 
insert into Attendance values('CC22617','O18080210','09:50:00','10:20:00');
insert into Attendance values('CC22617','O18080218','17:50:00','19:20:00');

-- this attendance has no booking
insert into attendance values('CFD8904','O18080210','10:00:00','12:20:00'); 
insert into attendance values('CFD8904','O18080313','13:00:00','14:30:00'); 
insert into attendance values('IT14023','O18080313','13:00:00','14:30:00'); 

-- the student is still at the branch
insert into Attendance values('CC18904','BR18082909','10:00:00',null); 
insert into Attendance values('IT72528','BR18082909','10:20:00',null);

--
INSERT into Attendance VALUES('IT48214','O18080310','10:00:00','11:20:00');
insert into Attendance values('CC29911','O18080210','10:05:00','11:20:00');
INSERT into Attendance VALUES('IT34459','O18080210','10:05:00','11:20:00');
insert into Attendance values('CD10205','CT18081308','08:00:00','13:20:00');
insert into Attendance values('IT37955','CT18081308','08:00:00','13:20:00');
insert into Attendance values('IT56068','CT18081308','08:00:00','13:20:00');
insert into Attendance values('IT27820','CT18081308','08:00:00','13:20:00');

select * from attendance;
