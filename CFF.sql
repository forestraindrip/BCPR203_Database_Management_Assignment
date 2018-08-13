drop database CFF;
create database CFF;
use CFF;
create table Course (
courseID char(7) primary key,
courseName varchar(40),
numberOfSessions int(2),
numberOfWeek int(2)
)engine = InnoDb;

insert into Course values('CFCB206','Computing Skills and Ergonomics',30,9);
insert into Course values('CFCF106','Computing Fundamentals',20,6);
insert into Course values('CFPP206','PowerPoint Introduction',20,6);
insert into Course values('CFHM301','HTML Web Design',40,11);
insert into Course values('CFDT110','Computing Basics DT',25,13);

select * from course;

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

insert into CourseEnrolment values('CP20205',50224035,'CFPP206',70401978,'2016-12-31','2017-09-22','No');
insert into CourseEnrolment values('CH38453',68047593,'CFHM301',92099402,'2018-04-05','2018-10-03','No');
insert into CourseEnrolment values('CD18214',78021184,'CFDT110',58995289,'2018-04-05','2018-09-03','No');

select * from CourseEnrolment;

create table Booking(
bookingNum int(6) primary key,
studentID char(8),
courseID char(7),
branchID varchar(2),
enrolmentID char(7),
staffID char(8),
bookingTime datetime,
bookedStartTime datetime,
bookedEndTime datetime,
actualStartTime datetime,
actualEndTime datetime,
foreign key (studentID) references student(studentID),
foreign key (branchID) references branch(branchID),
foreign key (courseID) references course(courseID),
foreign key (enrolmentID) references CourseEnrolment(enrolmentID),
foreign key (staffID) references staff(staffID)
)engine=InnoDB;

insert into Booking values(560407,92567137,'CFCB206','O','CC22617',93258280,
'2018-07-30 23:59:59',
'2018-08-02 09:00:00',
'2018-08-02 12:00:00',
'2018-08-02 09:09:59',
'2018-08-02 13:19:25');

insert into Booking values(991317,92567137,'CFCB206','BR','CC22617',58995289,
'2018-07-26 13:09:59',
'2018-08-29 23:59:59',
'2019-08-29',
null,
null);

insert into Booking values(212856,98794054,'CFDT110','CT','CD18904',93258280,
'2018-07-21 03:59:59',
'2018-08-12 12:00:00',
'2018-08-12 16:00:00',
'2018-08-12 16:09:59',
'2018-08-12 17:19:25');

select * from booking;