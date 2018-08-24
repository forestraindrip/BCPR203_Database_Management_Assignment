-- Search for a student whose ID is 98794054 and all courses he/she has enrolled.
select concat_ws(', ',studentFirstName,studentLastName) as 'Student Name',
courseName, courseCompleted
from student, enrolment, course
where student.studentID = 98794054 
and student.studentID= enrolment.studentID
and course.courseID = enrolment.courseID
;

-- Search students in the course: CFCB206
select courseName,
concat_ws(', ',studentFirstName,studentLastName) as 'Student Name'
from enrolment, course, student
where course.courseID = 'CFCB206'
and course.courseID = enrolment.courseID
and student.studentID = enrolment.studentID;

-- Search students in course CFCB206 and havent finished the course
select courseName,
concat_ws(', ',studentFirstName,studentLastName) as 'Student Name'
from enrolment, course, student
where course.courseID = 'CFCB206'
and course.courseID = enrolment.courseID
and student.studentID = enrolment.studentID
and  courseCompleted = false;

-- Search attended session number of students  
select concat_ws(', ',studentFirstName,studentLastName) as 'Student Name',
course.courseName,
count(sessionID)
from attendance, enrolment, student, course
where attendance.enrolmentID  = enrolment.enrolmentID
and student.studentID = enrolment.studentID
and course.courseID = enrolment.courseID
group by enrolment.enrolmentID;

-- Search attended session number of student (98794054)
select concat_ws(', ',studentFirstName,studentLastName) as 'Student Name',
course.courseName,
count(sessionID)
from attendance, enrolment, student, course
where student.studentID = '98794054'
and attendance.enrolmentID  = enrolment.enrolmentID
and student.studentID = enrolment.studentID
and course.courseID = enrolment.courseID
group by course.courseID;

-- Search students at Omaru branch between 10~12 2018-08-02
select branchName,
concat_ws(', ',studentFirstName,studentLastName) as 'Student Name',
attendanceStartTime,
attendanceEndTime
from branch, student, sessions, attendance, enrolment
where branchName = 'Oamaru'
and branch.branchID = sessions.branchID
and sessions.sessionDate = '2018-08-02'
and sessions.sessionStartTime = '10:00:00'
and sessions.sessionID = attendance.sessionID
and attendance.enrolmentID = enrolment.enrolmentID
and enrolment.studentID = student.studentID;
