-- Staff need to able to search for: Individual students 
select * from student where studentID = 95224952;

-- Search students in courses: CFCB206
select * from enrolment where (courseID = 'CFCB206');
select * from enrolment where courseID = 'CFCB206' and courseCompleted = false;

-- Search students at Omaru branch between 10~12 2018-08-02
select * from student where studentID in(
	select studentID from enrolment where enrolmentID in
		(select enrolmentID
		from attendance 
		where sessionID = 'O18080210'
		)
);

-- check whether an attendance has a booking
select * from booking where (enrolmentID,sessionID) in(
select enrolmentID, sessionID
from attendance
where enrolmentID = 'CC22617' && sessionID='O18080210');

-- check whether a booking has an attendance
select * from attendance where (enrolmentID,sessionID) in(
select enrolmentID,sessionID
from booking 
where bookingNum =560407);

