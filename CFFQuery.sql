-- 1. Students that have not been engaged in the last week (or other time period)
select concat_ws(', ',studentFirstName,studentLastName) as 'Student Name',
enrolment.enrolmentID,
Max(sessionDate),
(curdate() - MAX(sessionDate)) as 'Last Attendance Duration'
from sessions, attendance, enrolment, student
where sessions.sessionID = attendance.sessionID
and attendance.enrolmentID  = enrolment.enrolmentID
and student.studentID = enrolment.studentID
and ((curdate() - sessionDate) > 7)
group by enrolment.enrolmentID
;


-- 2. Students that are near the end of their course duration
select concat_ws(', ',studentFirstName,studentLastName) as 'Student Name',
enrolment.enrolmentID,
course.courseName,
(curdate() - enrolment.startDate)/(enrolment.endDate - enrolment.startDate)*100 
as 'Course Progress(%)',
enrolment.courseCompleted
from enrolment, student, course
where student.studentID = enrolment.studentID
and enrolment.courseID = course.courseID
and (curdate() - enrolment.startDate)/(enrolment.endDate - enrolment.startDate) > 0.75
and courseCompleted = false;
 

-- 3. How many times have students attended their course
select concat_ws(', ',studentFirstName,studentLastName) as 'Student Name',
enrolment.enrolmentID,
course.courseName,
count(sessionID) as 'Attendance times'
from attendance, enrolment, student, course
where attendance.enrolmentID  = enrolment.enrolmentID
and student.studentID = enrolment.studentID
and course.courseID = enrolment.courseID
group by enrolment.enrolmentID;

-- 4. Bookings for a day/time/session (2018-08-13 08:00:00)
select sessions.sessionDate,sessionStartTime, bookingNum,
concat_ws(',',studentFirstName,studentLastName) as 'Student Name' 
from booking,sessions, enrolment, student
where sessions.sessionID = booking.sessionID
and sessions.sessionDate = '2018-08-13'
and sessionStartTime = '08:00:00'
and booking.enrolmentID = enrolment.enrolmentID
and enrolment.studentID = student.studentID;

-- 5. Students that have not attended past the last withdrawal date
select concat_ws(',',studentFirstName,studentLastName) as 'Student Name' ,
enrolment.enrolmentID,
enrolment.startDate,
datediff(enrolment.endDate,enrolment.startDate) as 'Course Duration',
round(datediff(enrolment.endDate,enrolment.startDate)*0.1) as 'Withdrawl Point',
date_add(enrolment.startDate , interval round(datediff(enrolment.endDate,enrolment.startDate)*0.1) day)
as 'Last Withdrawl Date',
Max(sessions.sessionDate) as 'Last attendance date'
from student, enrolment, attendance, sessions
where sessions.sessionID = attendance.sessionID
and attendance.enrolmentID = enrolment.enrolmentID
and enrolment.studentID = student.studentID
and sessionDate < date_add(enrolment.startDate , interval round(datediff(enrolment.endDate,enrolment.startDate)*0.1) day)
group by enrolment.enrolmentID;
