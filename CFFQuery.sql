-- Staff need to able to search for: Individual students 
select * from student where studentID = 95224952;

-- Students in courses
select * from enrolment where (courseID = 'CFCB206');
select * from enrolment where courseID = 'CFCB206' and courseCompleted = false;

-- Students at Omaru branch between 10~12 2018-08-02
select * from student where studentID in(
	select studentID from enrolment where enrolmentID in
		(select enrolmentID
		from attendance 
		where sessionID = 'O18080210'
		)
);

select * from attendance where enrolmentID = 'CD18904' and sessionID = 'O18080210';

-- check whether an attendance has booking
select * from booking where (enrolmentID,sessionID) in(
select enrolmentID, sessionID
from attendance
where enrolmentID = 'CC22617' && sessionID='O18080210');


select * from attendance where (enrolmentID,sessionID) in(
select enrolmentID,sessionID
from booking 
where bookingNum =560407);








select * from attendance where enrolmentID in(
	select distinct enrolmentID 
    from booking 
    where bookingNum = 560407);
    
select * from enrolment where enrolmentID in(
	select distinct enrolmentID 
    from attendance 
    where bookingNum = 560407);